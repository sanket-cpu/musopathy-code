import 'package:flutter/material.dart';
import 'package:musopathy/auth.dart';

class Register extends StatefulWidget {
  Registerwidget createState() => Registerwidget();
}

class Registerwidget extends State<Register> {
  TextEditingController _emailsignin = TextEditingController();
  TextEditingController _passwordsignin = TextEditingController();
  TextEditingController _username = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  TextEditingController _passwordretype = TextEditingController();

  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _username,
                decoration: InputDecoration(
                  hintText: "username",
                  labelText: "Username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _emailsignin,
                decoration: InputDecoration(
                  hintText: "something@example.com",
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: _passwordsignin,
                obscureText: true,
                validator: (val) {
                  if (val.isEmpty) {
                    return "enter password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _passwordretype,
                obscureText: true,
                validator: (val) {
                  if (val.isEmpty) {
                    return "enter password";
                  }
                  if (_passwordretype.text != _passwordsignin.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Confirm password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: ElevatedButton(
                onPressed: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('user registered///')));
                  print(_formkey.currentState.validate());
                  bool signup = await register(
                      _emailsignin.text.trim(), _passwordsignin.text.trim());
                  if (_formkey.currentState.validate()) {
                    if (signup) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('user registered///')));
                    }
                    _formkey.currentState.reset();
                  }
                },
                child: Text("Register"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    primary: Colors.blueGrey,
                    onPrimary: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
