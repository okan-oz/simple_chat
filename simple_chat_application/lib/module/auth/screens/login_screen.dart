import 'package:flutter/material.dart';

import '../../../core/action_response.dart';
import '../../home/screens/home_screen.dart';
import '../utils.dart/login_utils.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 22.0),
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 20.0),
                        TextFormField(
                          maxLines: 1,
                          initialValue: 'username',
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your username',
                            label: Text('username'),
                          ),
                          onSaved: (String? value) {
                            username = value!;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          maxLines: 1,
                          initialValue: '905555555555',
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your phone number',
                            label: Text('Phone Number'),
                          ),
                          onSaved: (String? value) {
                            phoneNumber = value!;
                          },
                        ),
                      ],
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                      onPressed: () async {
                        _formKey.currentState!.save();
                        ActionResponse<bool> loginResult = await LoginUtils.login(phoneNumber: phoneNumber, username: username);

                        if (loginResult.isSuccess) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
