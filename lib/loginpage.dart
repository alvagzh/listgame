import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isValidUsername = true;
  bool _isValidPassword = true;

  void _validateInputs() {
    setState(() {
      _isValidUsername = _usernameController.text.contains('@');

      _isValidPassword = _passwordController.text.length > 8;

      if (_isValidUsername && _isValidPassword) {
        Navigator.pushReplacementNamed(context, '/gameList');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                errorText: _isValidUsername ? null : 'Username harus terdapat @',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _isValidPassword ? null : 'Password harus lebih dari 8 karakter',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validateInputs,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
