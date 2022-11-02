import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morphzing/logic/controllers/journal/journey_controller.dart';
import '../../../core/constants/style.dart';
import '../../../utils/style/colors.dart';


class JourneyBottomSheet extends StatefulWidget {
  const JourneyBottomSheet({Key? key}) : super(key: key);

  @override
  State<JourneyBottomSheet> createState() => _JourneyBottomSheetState();
}

class _JourneyBottomSheetState extends State<JourneyBottomSheet> {

  JourneyController journeyController = Get.put(JourneyController());

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 400,
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Media',
                    style: staticTextStyle(
                      20,
                      blackTextColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(20),
                      color: bgColor,
                    ),
                    child:const  Center(
                      child: Icon(
                        CupertinoIcons.clear,
                        size: 18,
                        color: blackTextColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
            child: GestureDetector(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(14),
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const Padding(
                      padding:  EdgeInsets.only(right: 15.0),
                      child:  Image(image: AssetImage('assets/images/location.png'), height: 18,),
                    ),
                    Expanded(child: Text('Location', style: staticTextStyle(17, blackTextColor,),),),
                    const Icon(CupertinoIcons.forward,size: 20,color: blackTextColor,),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
            child: GestureDetector(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(14),
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const Padding(
                      padding:  EdgeInsets.only(right: 15.0),
                      child:  Image(image: AssetImage('assets/images/weblink.png'), height: 18,),
                    ),
                    Expanded(child: Text('Web link', style: staticTextStyle(17, blackTextColor,),),),
                    const Icon(CupertinoIcons.forward,size: 20,color: blackTextColor,),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
            child: GestureDetector(
              onTap: (){

                  journeyController.pickFile();

              },
              child: Container(
                padding: const EdgeInsets.all(14),
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const Padding(
                      padding:  EdgeInsets.only(right: 15.0),
                      child:  Image(image: AssetImage('assets/images/document.png'), height: 18,),
                    ),
                    Expanded(child: Text('Document', style: staticTextStyle(17, blackTextColor,),),),
                    const Icon(CupertinoIcons.forward,size: 20,color: blackTextColor,),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
            child: GestureDetector(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(14),
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const Padding(
                      padding:  EdgeInsets.only(right: 15.0),
                      child:  Image(image: AssetImage('assets/images/camera.png'), height: 18,),
                    ),
                    Expanded(child: Text('Camera', style: staticTextStyle(17, blackTextColor,),),),
                    const Icon(CupertinoIcons.forward,size: 20,color: blackTextColor,),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
            child: GestureDetector(
              onTap: ()async {
                if(journeyController.images.length <5) {
                  var image = await journeyController.journeyImageFromGallery();
                  journeyController.images.add(image);
                }else{
                  Get.back();
                  Get.snackbar('', 'Free limit is 5. Please remove a photo to add new one ');
                }
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const Padding(
                      padding:  EdgeInsets.only(right: 15.0),
                      child:  Image(image: AssetImage('assets/images/photo.png'), height: 18,),
                    ),
                    Expanded(child: Text('Photo', style: staticTextStyle(17, blackTextColor,),),),
                    const Icon(CupertinoIcons.forward,size: 20,color: blackTextColor,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
