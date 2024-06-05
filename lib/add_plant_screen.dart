import 'package:flutter/material.dart';

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
        child: Column(
              children: [
                TextField(
                  controller: _plantNameController,
                  onChanged: (text) => setState(() => _plantNameController.text = text),
                  decoration: InputDecoration(
                    labelText: 'Enter Plant Name',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _plants.add(_plantNameController.text);
                      _plantNameController.text = '';
                    });
                  },
                  child: Text('Add Plant'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _plants.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_plants[index]),
                        leading: Icon(Icons.add), // Optional leading icon
                      );
                    },
                  ),
                ),
              ],
            ),



    )
    );
  }
}
