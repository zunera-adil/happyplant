import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/color.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({super.key});

  @override
  State<AddPlantScreen> createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  final _plantNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _addPlantName() async {
    final plantName = _plantNameController.text.trim();
    if (plantName.isNotEmpty) {
      // Add the plant name to the Firestore collection
      await FirebaseFirestore.instance.collection('plants').add({
        'name': plantName,
      });
      // Clear the text field after adding the plant
      _plantNameController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/images/home_screenbg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70.h),
              TextField(
                controller: _plantNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: darkGreen.withOpacity(0.9),
                  labelText: 'Enter Plant Name',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.9),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: kShadowBlackColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kShadowBlackColor),
                  ),
                ),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: _addPlantName,
                style: ElevatedButton.styleFrom(
                  backgroundColor: lightGreen,
                ),
                child: Text(
                  'Add Plant',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: kShadowBlackColor,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('plants').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No plants added yet'));
                    }
                    final plantDocs = snapshot.data!.docs;
                    return ListView.separated(
                      itemCount: plantDocs.length,
                      padding: EdgeInsets.only(top: 10.h),
                      separatorBuilder: (context, index) => Divider(
                        thickness: 1.w,
                        color: kShadowBlackColor.withOpacity(0.1),
                      ),
                      itemBuilder: (context, index) {
                        final plantName = plantDocs[index]['name'];
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
                                color: kShadowBlackColor.withOpacity(0.3),
                                blurRadius: 1.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
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
                                child: Image.asset(
                                  'asset/images/add_plant.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                plantName,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
