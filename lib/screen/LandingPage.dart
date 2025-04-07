import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopease/provider/AuthProvider.dart';
import 'package:shopease/screen/Homepage.dart';
import 'package:shopease/screen/Registration.dart';
import 'package:shopease/widgets/CustomeWidgets.dart';

class LandingPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Shopese"),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.greenAccent.shade100,
            Colors.purpleAccent.shade100
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
        Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Image.asset(
                'assets/images/couple.png',
                height: 300,
                width: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              const Center(
                  child: Text(
                "Login for the digital market👇.",
              )),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              CustomeWidgets.customeTextField(
                labelName: "Email",
                controller: emailController,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter email' : null,
              ),
              const SizedBox(height: 20),
              CustomeWidgets.customeTextField(
                controller: passwordController,
                labelName: "Password",
                obsecureText: !authProvider.isVisible,
                maxLines: 1,
                sufixIcon: IconButton(onPressed: (){authProvider.toggleVisibility();}, icon: Icon(authProvider.isVisible?Icons.visibility:Icons.visibility_off)),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter password' : null,
              ),
              const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text("Forget Password"))),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              CustomeWidgets.customeButtom(
                buttonName: "Login",
                fontSize: 25,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    authProvider
                        .login(emailController.text.trim(),
                            passwordController.text.trim())
                        .then((_) {
                      if (authProvider.isLoggedIn) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Homepage()), // Replace with your homepage
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login failed!')),
                        );
                      }
                    });
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.08,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Registration()));
                  },
                  child: const Center(
                      child: Text(
                    "Create new Account here.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline),
                  )))
            ],
          ),
        ),
      ]),
    );
  }
}
