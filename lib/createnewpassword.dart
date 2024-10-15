import 'package:flutter/material.dart';

class MyCreateNewPassword extends StatefulWidget {
  const MyCreateNewPassword({super.key});

  @override
  State<MyCreateNewPassword> createState() => _MyCreateNewPasswordState();
}
class _MyCreateNewPasswordState extends State<MyCreateNewPassword> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
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
              'Create new password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Your new password must be different from previously used passwords',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'New password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String newPassword = _newPasswordController.text;
                  String confirmPassword = _confirmPasswordController.text;
                  if (newPassword.isEmpty || confirmPassword.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill in all fields')),
                    );
                  } else if (newPassword != confirmPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Passwords do not match')),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Success'),
                          content: Text('Your password has been changed successfully!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BDD6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Text(
                  'Confirm',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

