import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_barber/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:schedule_barber/screens/auth/components/my_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool signInRequired = false;
  IconData iconPassword = Icons.visibility_off;
  bool obscurePassword = true;
  String? _erroMsg;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          setState(() {
            signInRequired = false;
          });
        } else if (state is SignInProgress) {
          setState(() {
            signInRequired = true;
          });
        } else if (state is SignInFailure) {
          setState(() {
            signInRequired = false;
            _erroMsg = 'Invalid email or password';
          });
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email is required";
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$').hasMatch(value)) {
                    return "Invalid email";
                  }
                  return null;
                },
                errorMsg: _erroMsg,
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: obscurePassword,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$').hasMatch(value)) {
                    return "Invalid password";
                  }
                  return null;
                },
                errorMsg: _erroMsg,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                      iconPassword = obscurePassword ? Icons.visibility_off : Icons.visibility;
                    });
                  },
                  icon: Icon(iconPassword),
                ),
              ),
            ),
            const SizedBox(height: 20),
            !signInRequired
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<SignInBloc>().add(
                                SignInRequired(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                        }
                      },
                      style: TextButton.styleFrom(
                        elevation: 3.0,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                      ),
                      child: const Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
