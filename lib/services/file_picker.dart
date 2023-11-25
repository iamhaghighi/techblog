import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import '../controllers/file_picker_controller.dart';

FilePickerController filePickerController = Get.put(
  FilePickerController(),
);

Future filePicker() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
  filePickerController.file.value = result!.files.first;
}
