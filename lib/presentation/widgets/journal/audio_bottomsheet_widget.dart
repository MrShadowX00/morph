import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:morphzing/logic/controllers/journal/journey_controller.dart';
import 'package:get/get.dart';

import '../../../utils/style/colors.dart';




class AudioBottomSheetWidget extends StatefulWidget {
  const AudioBottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<AudioBottomSheetWidget> createState() => _AudioBottomSheetWidgetState();
}

class _AudioBottomSheetWidgetState extends State<AudioBottomSheetWidget> {
  JourneyController journeyController = Get.put(JourneyController());

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        width: Get.width,
        child: Obx((){
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  height: 40,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: AudioWaveforms(
                    size: Size(Get.width, 30),
                    recorderController:
                    journeyController.recorderController,
                    waveStyle:const  WaveStyle(
                      durationStyle: TextStyle(
                          color: blackTextColor
                      ),
                      backgroundColor: blueColor,
                      showDurationLabel: false,
                      showHourInDuration: false,
                      showBottom: false,
                      extendWaveform: true,
                      showMiddleLine: false,
                      showTop: true,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                height: 80,
                width: Get.width,
                color: whiteColor,
                child: SizedBox(
                  height: 56,
                  width: Get.width,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap:(){},
                        child:const SizedBox(width: 90,height: 56,
                          child: Center(
                            child: Icon(Icons.delete,color: todayColor, size: 26,),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:()async{
                          if(journeyController.isRecording.value){
                            var audio = await journeyController.recorderController.stop(false);
                            print('audio$audio');
                            journeyController.isRecording.value = false;

                              await journeyController
                                  .playerController
                                  .preparePlayer(
                                  audio!);
                            // }catch(e){}
                            journeyController.recordCompleted.value = true;
                            Get.back();

                            print('path : ${journeyController.pathAudio}');
                          }else{
                            journeyController.isRecording.value = true;
                            journeyController.recorderController.record();
                          }
                        },
                        child:  Container(
                          width: Get.width-90,
                          color: blueColor,
                          child: Center(
                            child:(journeyController.isRecording.value)?const Icon(Icons.check,color: whiteColor, size: 26,):const Icon(Icons.mic,color: whiteColor, size: 26,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        })
    );
  }
}
