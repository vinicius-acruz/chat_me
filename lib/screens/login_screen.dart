import 'package:chat_me/components/rounded_button.dart';
import 'package:chat_me/components/show_alert_dialog.dart';
import 'package:chat_me/constants.dart';

import 'package:chat_me/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart'; // Spinner

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;

  BuildContext getContext() {
    return context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: Navigator.of(context).pop,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Stack(
          children: [
            const BackgroundContainer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                        height: 100.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/logo.png'),
                              fit: BoxFit.contain),
                        )),
                  ),
                  const SizedBox(
                    height: 48.0,
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter your e-mail',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8),
                    child: TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Type your password',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                      text: 'Log in',
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          // ignore: unused_local_variable
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);

                          Navigator.pushNamed(getContext(), MainScreen.id);

                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(' Error: $e');
                          CustomDialog.show(
                            context: getContext(),
                            title: 'Error',
                            content:
                                'An error occurred while getting the current user. $e',
                            bottomButtonText: 'OK',
                            onOkPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                showSpinner = false;
                              });
                            },
                          );
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
