import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';
import 'createnewpassword.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  int _start = 30;
  late Timer _timer;
  TextEditingController _pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        _timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Verification code',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please enter the verification code we sent to your email address',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            PinCodeTextField(
              controller: _pinController,
              appContext: context,
              length: 4,
              keyboardType: TextInputType.number,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.white,
                selectedColor: Colors.green,
                inactiveColor: Colors.grey,
              ),
              onChanged: (value) {
                print(value);
              },
              onCompleted: (value) {
                print("Completed: $value");
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                _start > 0 ? "Resend in 00:$_start" : "Resend",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String pinCode = _pinController.text;
                  if (pinCode.isEmpty) {
                    print("Please enter a pin code.");
                  } else if (pinCode.length != 4) {
                    print("Invalid pin code. It should be 4 digits long.");
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyCreateNewPassword()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
