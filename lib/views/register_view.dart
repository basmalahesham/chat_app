import 'package:chat_app/constants.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/widgets/custom_button.dart';
import 'package:chat_app/views/widgets/custom_form_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static const String routeName = "register";

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email;

  String? password;
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  bool isProcessing = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 75,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Scholar Chat',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 75,
              ),
              const Row(
                children: [
                  Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormTextField(
                controller: emailTextController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email address';
                  }
                  var regex = RegExp(
                      r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-.]+$)");
                  if (!regex.hasMatch(value)) {
                    return 'enter a valid email address';
                  }
                  return null;
                },
                onChanged: (data) {
                  email = data;
                },
                hintText: 'Email',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                controller: passwordTextController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your password';
                  }
                  var regex = RegExp(
                      r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$");
                  if (!regex.hasMatch(value)) {
                    return 'enter a valid password';
                  }
                  return null;
                },
                obscureText: true,
                onChanged: (data) {
                  password = data;
                },
                hintText: 'Password',
              ),
              const SizedBox(
                height: 20,
              ),
              isProcessing
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                      onTap: () async {
                        await register(context);
                      },
                      text: 'REGISTER',
                    ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'already have an account?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: const Text(
                      '  Login',
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register(BuildContext context) async {
    setState(() {
      isProcessing = true;
    });
    if (formKey.currentState!.validate()) {
      setState(() {
        isProcessing = true;
      });
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      setState(() {
        isProcessing = false;
      });
      if (user.user != null) {
        Navigator.pushReplacementNamed(
          context,
          ChatView.routeName,
          arguments: email,
        );
      } else {
        setState(() {
          isProcessing = false;
        });
      }
    }
  }
}
