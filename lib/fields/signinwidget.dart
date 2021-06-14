import 'package:flutter/material.dart';
import 'package:musopathy/auth.dart';
import 'package:musopathy/screens/languagePage.dart';

class SignIn extends StatefulWidget {
  SignInwidget createState() => SignInwidget();
}

class SignInwidget extends State<SignIn> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  var key = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, top: 16, right: 25, bottom: 16),
              child: TextField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "something@example.com")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, top: 20, right: 25, bottom: 16),
              child: TextFormField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.15,
                height: 55,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  onPressed: () async {
                    bool signin =
                        await signIn(_email.text.trim(), _password.text.trim());
                    if (key.currentState.validate()) {
                      if (signin) {
                        key.currentState.reset();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Language()),
                        );
                      }
                    } else {
                      return "Invalid email";
                    }
                  },
                  child: Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: Colors.cyan.shade900,
                      onPrimary: Colors.white),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
              child: ElevatedButton(
                onPressed: () {
                  //final provider = Provider.of<GoogleLogin>(context,
                  //  listen: false);
                  //provider.login();
                },
                child: Text("Sign in with Google"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    primary: Colors.black,
                    onPrimary: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
