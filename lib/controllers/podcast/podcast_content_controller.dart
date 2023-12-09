import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/models/podcast_file_model.dart';

import 'package:techblog/services/dio_services.dart';

class PodcastContentController extends GetxController {
  var id;
  PodcastContentController({this.id});
  RxList<PodcastFileModel> podcastFileList = RxList();
  RxBool loading = true.obs;

  final player = AudioPlayer();
  late ConcatenatingAudioSource playList;
  RxBool playState = false.obs;
  RxInt currentFileIndex = 0.obs;
  RxBool isLoopModelAll = false.obs;

  // Timer? timer;

  RxList<Color> colors = [
    AppColors.secondaryColor,
    AppColors.defaultColorBlack,
    AppColors.defaultColorBlack,
    AppColors.defaultColorBlack,
  ].obs;
  void changeStyle(int index) {
    for (int i = 0; i < playList.length; i++) {
      colors[i] =
          (i == index) ? AppColors.secondaryColor : AppColors.defaultColorBlack;
    }
  }

  Rx<Color> black = AppColors.defaultColorBlack.obs;

  @override
  onInit() async {
    super.onInit();
    playList = ConcatenatingAudioSource(useLazyPreparation: true, children: []);
    await getPodcastsFile();
    await player.setAudioSource(
      playList,
      initialIndex: 0,
      initialPosition: Duration.zero,
    );
  }

  getPodcastsFile() async {
    loading.value = true;
    var response = await DioService().getMethod(
      "https://techblog.sasansafari.com/Techblog/api/podcast/get.php?command=get_files&podcats_id=$id",
    );
    if (response.statusCode == 200) {
      for (var element in response.data['files']) {
        podcastFileList.add(
          PodcastFileModel.fromJson(element),
        );
        playList.add(
          AudioSource.uri(
            Uri.parse(
              PodcastFileModel.fromJson(element).file!,
            ),
          ),
        );
      }
      loading.value = false;
    }
  }

  // RxDouble prograssVal = 0.0.obs;
  // startPrograss() {
  //   const tick = Duration(seconds: 1);
  //   int duration = player.duration!.inSeconds;
  //   var step = 1 / duration;
  //   timer = Timer.periodic(
  //     tick,
  //     (timer) {
  //       duration--;
  //       prograssVal.value += step;
  //       if (duration <= 0) {
  //         timer.cancel();
  //       }
  //     },
  //   );
  // }

  Rx<Duration> progressVal = Duration(seconds: 0).obs;
  Rx<Duration> bufferVal = Duration(seconds: 0).obs;
  Timer? timer;

  startProgress() {
    const tick = Duration(seconds: 1);
    var duration = player.duration!.inSeconds - player.position.inSeconds;

    if (timer != null) {
      if (timer!.isActive) {
        timer!.cancel();
        timer = null;
      }
    }

    timer = Timer.periodic(tick, (timer) {
      duration--;
      debugPrint(
          "duration: $duration ---> index: ${player.currentIndex}".toString());
      progressVal.value = player.position;
      bufferVal.value = player.bufferedPosition;

      if (duration <= 0) {
        timer.cancel();
        progressVal.value = const Duration(seconds: 0);
        bufferVal.value = const Duration(seconds: 0);
      }
    });
  }

  checkTimer() {
    if (player.playing) {
      startProgress();
    } else {
      // timer!.cancel();
      // progressVal.value = const Duration(seconds: 0);
      // bufferVal.value = const Duration(seconds: 0);
    }
  }

  setLoopMode() {
    if (isLoopModelAll.value) {
      isLoopModelAll.value = false;
      player.setLoopMode(LoopMode.off);
    } else {
      isLoopModelAll.value = true;
      player.setLoopMode(LoopMode.all);
    }
  }
}
