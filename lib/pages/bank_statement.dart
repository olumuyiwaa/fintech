// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fatherland_money/utilities/button_big.dart';
import 'package:fatherland_money/utilities/input_field.dart';
import 'package:flutter/material.dart';

class BankStatement extends StatefulWidget {
  const BankStatement({super.key});

  @override
  State<BankStatement> createState() => _BankStatementState();
}

class _BankStatementState extends State<BankStatement> {
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(DateTime.now().year, 12, 31),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            primaryColor: Colors.green, // Green color for the picker header
            colorScheme: ColorScheme.light(
              primary: Colors.green, // Green color for the selected date
            ),
            buttonTheme: ButtonThemeData(
              textTheme:
                  ButtonTextTheme.primary, // For buttons like "OK" or "CANCEL"
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != (isStart ? _startDate : _endDate)) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
        title: Text('Bank Statement'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: ListView(
          children: [
            Text('Time Frame'),
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _selectDate(context, true),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            child: Text(
                              _startDate == null
                                  ? 'Select start date'
                                  : '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text('To'),
                      SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _selectDate(context, false),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            child: Text(
                              _endDate == null
                                  ? 'Select end date'
                                  : '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Inputfield(
                inputHintText: 'username@server.com', inputTitle: 'Email'),
            SizedBox(height: 12),
            Text(
              'Your account statement will be sent to the provided email. Please verify that the email you have provided is correct.',
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
            SizedBox(height: 24),
            ButtonBig(buttonText: 'Send Statement')
          ],
        ),
      ),
    );
  }
}
