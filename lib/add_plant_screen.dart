import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happyplant/components/button.dart';

import 'color.dart';

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
        decoration: BoxDecoration(
          gradient: kBackgroundGradient
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  TextField(
                    controller: _plantNameController,
                    onChanged: (text) => setState(() => _plantNameController.text = text),
                    decoration:  InputDecoration(
                      labelText: 'Enter Plant Name',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: kShadowBlackColor
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
                    textAlign: TextAlign.center,

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
                    child: Text('Add Plant',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: kShadowBlackColor
                    ),),
                   style: ElevatedButton.styleFrom(
                     backgroundColor: lightGreen,
                   ),
                 ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: _plants.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 150.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1)
                          ),
                          //tileColor: Colors.red.withOpacity(0.3),
                          child:
                       Column(
                         children: [
                           Text(_plants[index]),
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
