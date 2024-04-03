import 'package:flutter/material.dart';
import 'package:jadwali_test_1/modules/child.dart';

class addChild extends StatefulWidget {
  static const String routeName = 'add_child';
  addChild({super.key});

  @override
  State<addChild> createState() => _addChildState();
}

class _addChildState extends State<addChild> {
  final _childformKey = GlobalKey<FormState>();
  
  final _name = TextEditingController();
  String _gender = "";
  DateTime _dob = DateTime.now();
  final _dobControler = TextEditingController();
  String genderErr = "";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('أضف طفل'),
          ),
          body: Column(
            children: [
              Expanded(
                child: Form(
                  key: _childformKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: ListView(
                    padding: const EdgeInsets.all(24.0),
                    shrinkWrap: true,
                    children: [
//////////////////////////name
                      const Text('جنس الطفل:', style: TextStyle(fontSize: 16)),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFormField(
                          //textAlign: TextAlign.right,
                          controller: _name,
                          decoration: const InputDecoration(
                            //filled: true,
                            //labelText: "إسم الطفل:",
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' الرجاء إدخال إسم الطفل';
                            }
                            // final RegExp regex = RegExp(r'^[a-zA-Z]+$');
                            // if (!regex.hasMatch(value)) {
                            //   return 'الاسم يحتوي على أحرف فقط';
                            // }

                            return null;
                          },
                        ),
                      ),
//////////////////////////////////// gender
                      const SizedBox(height: 40),
                      const Text('جنس الطفل:', style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          Radio(
                            value: 'Male',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value.toString();
                                genderErr = "";
                              });
                            },
                          ),
                          const Text('ذكر'),
                          Radio(
                            value: 'Female',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value.toString();
                                genderErr = "";
                              });
                            },
                          ),
                          const Text('أنثى'),
                        ],
                      ),
                      Text(
                        genderErr,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),

//////////////////////////////date of birth
                      const SizedBox(height: 40),
                      const Text('تاريخ ميلاد الطفل:',
                          style: TextStyle(fontSize: 16)),
                      GestureDetector(
                        onTap: () => _selectDob(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: _dobControler,
                            decoration: const InputDecoration(
                                labelText: 'تاريخ الميلاد',
                                prefixIcon: Icon(Icons.edit_calendar_rounded)
                                //hintText: _dob.toString().substring(0, 10),
                                ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return ' الرجاء إختيار تاريخ الميلاد';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: () {
                            _childformKey.currentState!.validate();
                            if (_gender == "") {
                              setState(() {
                                genderErr = "الرجاء إختيلر الجنس";
                              });
                            } else if (_childformKey.currentState!.validate()) {
                              // Simulate adding a new child

                              Child newChild = Child(
                                  name: _name.text,
                                  gender: _gender,
                                  dob: _dob,
                                  id: 'ghj');
                              Navigator.pop(context, newChild);
                            }
                          },
                          child: Text('submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Future<void> _selectDob(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _dob,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _dob) {
      setState(() {
        _dob = pickedDate;
        _dobControler.text = _dob.toString().substring(0, 10);
      });
    }
  }
}
