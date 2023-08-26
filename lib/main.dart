import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isChecked = false;
  bool? _isChecked = false;
  int _value = 1;
  final _formState = GlobalKey<FormState>();
  final textController = TextEditingController();

  void validate(String text) {
    setState(() {
      isChecked = false;
    });
    if (_formState.currentState!.validate()) {
      setState(() {
        isChecked = true;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Textfield and CheckBox"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Textfield, CheckBox, Validation',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 50,
            ),
            Form(
              key: _formState,
              child: Column(children: [
                TextFormField(
                  onChanged: (isChecked) {
                    validate(isChecked);
                  },
                  showCursor: true,
                  cursorColor: Colors.black,
                  cursorWidth: 2,
                  cursorHeight: 20,
                  cursorRadius: Radius.circular(20),
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  textCapitalization: TextCapitalization.words,
                  controller: textController,
                  validator: (value) {
                    if (value!.length < 10) {
                      return 'need more text';
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Name'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
            Checkbox(
                //CheckBox
                value: isChecked,
                activeColor: Colors.red,
                onChanged: (newBool) {
                  setState(() {
                    isChecked = newBool;
                  });
                }),
            CheckboxListTile(
                //CheckBoxTile
                title: Text(
                  'Are you Sure?',
                ),
                value: _isChecked,
                activeColor: Colors.red,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked = newValue;
                  });
                }),
            Column(children: [
              //RadioButton
              Row(
                children: [
                  Radio(
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      }),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('Laki-Laki'),
                  Radio(
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      }),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('Perempuan'),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
