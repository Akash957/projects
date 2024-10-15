import 'package:flutter/material.dart';
import 'package:projects/verificationemail.dart';

class MyForgotPassword extends StatefulWidget {
  const MyForgotPassword({super.key});

  @override
  State<MyForgotPassword> createState() => _MyForgotPasswordState();
}

class _MyForgotPasswordState extends State<MyForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    final String email = _emailController.text.trim();
    if (email.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset link sent to $email')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your email')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot password?'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter email associated with your account and we\'ll send an email with instructions to reset your password',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Enter your email here',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 200),
            SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: _resetPassword,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Verification Email',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
