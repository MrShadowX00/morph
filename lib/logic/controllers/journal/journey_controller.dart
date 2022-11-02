import 'dart:io';
import 'dart:typed_data';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';



class JourneyController extends GetxController{
  RxBool loading = false.obs;
  var pathAudio;
  RxBool isRecording = false.obs;
  RxBool recordCompleted = false.obs;
  RxBool isFileUploaded = false.obs;
  RxBool paintLoader = false.obs;
  RxBool isTimeWidget = false.obs;
  Rx<DateTime> dateTime = DateTime.now().obs;
  Rx<DateTime> focusedDateTime = DateTime.now().obs;
  RxList images = [].obs;
  RxInt indexSlide = 0.obs;
  File? file;
  RxString uploadedFileDirectory = ''.obs;
  FilePickerResult? uploadFile;

  pickFile()async{
    uploadFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:

      ['pdf','doc','docx','txt']
    );
    uploadedFileDirectory.value = (await FilePicker.platform.getDirectoryPath())!;
    return uploadFile!.files.first.name;
  }


  late final RecorderController recorderController;
  late final PlayerController playerController;

  getDir()async{
    Directory appDirectory = await getApplicationDocumentsDirectory();
    pathAudio ="${appDirectory.path}/record.acc";
  }

  readImageFromUnit8(Uint8List unitImage)async{
    paintLoader.value = true;
    final tempDir = await getTemporaryDirectory();
    file = await File('${tempDir.path}/${DateTime.now()}.png').create();
    file!.writeAsBytesSync(unitImage);
    paintLoader.value = false;
    print(file!.path);
  }
  journeyImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporary = File(image.path);
    return imageTemporary;
  }

  journeyImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    return imageTemporary;
  }


  @override
  void onInit() {
    super.onInit();
    recorderController = RecorderController()
    ..androidEncoder = AndroidEncoder.aac
    ..androidOutputFormat = AndroidOutputFormat.mpeg4
    ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
    ..sampleRate = 16000;
    playerController = PlayerController();
    // getDir();
    print(dateTime.value);
  }
}