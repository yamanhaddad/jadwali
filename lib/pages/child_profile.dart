import 'package:jadwali_test_1/modules/child.dart';
import 'package:flutter/material.dart';

class ChildProfilePage extends StatelessWidget {
  final Child child;

  ChildProfilePage({required this.child});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${child.name}'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name: ${child.name}'),
              Text('Gender: ${child.gender}'),
              Text('Date of Birth: ${child.dob.toString().substring(0, 10)}'),
            ],
          ),
        ),
      ),
    );
  }
}


