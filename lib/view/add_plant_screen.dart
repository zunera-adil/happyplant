import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({super.key});

  @override
  State<AddPlantScreen> createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  final _plants = <String>[];
  final _plantNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/images/home_screenbg.jpg'),
                fit: BoxFit.cover)
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  TextField(
                    controller: _plantNameController,
                    onChanged: (text) => setState(() => _plantNameController.text = text),
                    decoration:  InputDecoration(
                      filled: true,
                      fillColor: darkGreen.withOpacity(0.9),
                      labelText: 'Enter Plant Name',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.9)
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kShadowBlackColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kShadowBlackColor,
                      ),
                    ),

                  ),
                    style: TextStyle( fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.9)),
                  )
,                 SizedBox(
                   height: 20.h,
                 ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _plants.add(_plantNameController.text);
                        _plantNameController.text = '';
                     });
                    },
                   style: ElevatedButton.styleFrom(
                     backgroundColor: lightGreen,
                   ),
                    child: Text('Add Plant',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: kShadowBlackColor
                    ),),
                 ),

                  Expanded(
                    child: ListView.separated(
                      itemCount: _plants.length,
                      padding: EdgeInsets.only(top: 10.h),
                      separatorBuilder: (context, index) => Divider( // Customize separator here
                        thickness: 1.w, // Adjust divider thickness
                        color: kShadowBlackColor.withOpacity(0.1), // Adjust divider color
                      ),

                      itemBuilder: (context, index) {
                        return Container(
                          height: 150.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.r),
                            color: darkGreen.withOpacity(0.9),
                            border: Border.all(
                              color: kShadowBlackColor.withOpacity(0.1),
                              width: 1.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kShadowBlackColor.withOpacity(0.3), // Shadow color with opacity
                                blurRadius: 1.0, // Blur radius of the shadow
                                spreadRadius: 1.0, // How much the shadow expands from the container
                              ),

                            ],
                          ),
                          //tileColor: Colors.red.withOpacity(0.3),
                          child: Row(
                         children: [
                           Container(
                             margin: EdgeInsets.only(left: 3.w),
                             width: 90.w,
                             height: 130.h,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(5.r),
                               border: Border.all(
                                 color: kShadowBlackColor.withOpacity(0.5),
                                 width: 2.w,
                               ),
                             ),
                             child: Image.asset('asset/images/add_plant.jpeg',
                             fit: BoxFit.cover,),
                             ),
                           SizedBox(
                             width: 10.w,
                           ),
                           Text(_plants[index],
                           style: TextStyle(
                               fontSize: 12.sp,
                               fontWeight: FontWeight.w600,
                               color: Colors.white
                           ),),
                         ],
                          )
                        );
                      },
                    ),
                  ),
                ],
              ),
        ),
    )
    );
  }
}
