import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:shopease/models/RegistrationResponseModel.dart';
import 'package:shopease/provider/AuthProvider.dart';
import 'package:shopease/screen/LandingPage.dart';
import 'package:shopease/widgets/CustomeWidgets.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _avatarController =
        TextEditingController(text: "https://i.imgur.com/LDOO4Qs.jpg");
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _cPasswordController = TextEditingController();

    // final authProvider = Provider.of<AuthProvider>(context);
    return Consumer<AuthProvider>(builder: (context,authProvider,child){

      return Scaffold(
          appBar: AppBar(title: const Text("Create Account😲"),centerTitle: true,automaticallyImplyLeading: false,),
          body: Form(
            key: _formKey,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.greenAccent.shade100,
                  Colors.purpleAccent.shade100
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              ),
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Image.asset(
                    'assets/images/shopping.png',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 30,),
                  SizedBox(height: 30,
                      child: Marquee(text: 'Sign up to get started!',textScaleFactor: 1.5,blankSpace: 50)),
                  const SizedBox(height: 30,),
                  CustomeWidgets.customeTextField(
                      labelName: 'Name',
                      controller: _nameController,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter the name.' : null),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomeWidgets.customeTextField(
                      labelName: 'Email',
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter an email.";
                        } else if (!value.contains('@')) {
                          return 'Mail does not contain @.';
                        }
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomeWidgets.customeTextField(
                      labelName: 'Image URL', controller: _avatarController),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomeWidgets.customeTextField(
                      labelName: 'Password',
                      controller: _passwordController,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a password' : null,
                      obsecureText: !authProvider.isVisible,
                      sufixIcon: IconButton(
                          onPressed: () {authProvider.toggleVisibility();},
                          icon: Icon(authProvider.isVisible
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      maxLines: 1),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomeWidgets.customeTextField(
                    labelName: 'Confirm Password',
                    controller: _cPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please confirm your password.";
                      } else if (value != _passwordController.text) {
                        return 'Confirm password does not match.';
                      }
                      return null;
                    },
                    obsecureText: !authProvider.isVisible,
                    maxLines: 1,
                    sufixIcon: IconButton(onPressed: (){authProvider.toggleVisibility();},
                        icon: Icon(authProvider.isVisible?Icons.visibility:Icons.visibility_off)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomeWidgets.customeButtom(
                      buttonName: 'Submit',
                      fontSize: 20,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            await authProvider.register(
                                _nameController.text,
                                _emailController.text,
                                _avatarController.text,
                                _passwordController.text);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LandingPage()));
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Registration success.")));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Registartion Failed")));
                          }
                        }
                      })
                ],
              ),
            ]),
          )
      );}
    );
  }
}
