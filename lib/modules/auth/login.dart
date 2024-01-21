import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool hiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.black,
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 12, horizontal: 24),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ]),
              ),
              Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.grey),
                            hintStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            labelText: 'Email',
                            hintText: 'Your email address',
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: hiddenPassword,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  hiddenPassword = !hiddenPassword;
                                },
                                icon: hiddenPassword
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.grey),
                            suffixIconColor: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            minWidth: double.infinity,
                            color: Colors.blueAccent,
                            onPressed: () {
                              print(emailController.text);
                              print(passwordController.text);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Reset your password?',
                                  style: TextStyle(color: Colors.white54),
                                ))
                          ],
                        )
                      ],
                    ),
                  )),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
