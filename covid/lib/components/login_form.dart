import 'package:covid/components/button.dart';
import 'package:covid/utils/config.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget{
  const LoginForm({Key? key}) : super(key:key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;
  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller:_emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Color.fromARGB(255, 118, 185, 212),
            decoration: const InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Color.fromARGB(255, 118, 185, 212),

            ),
            
          ),

          Config.spaceSmall,
          TextFormField(
            controller:_passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: const Color.fromARGB(255, 22, 102, 3),
            obscureText: obsecurePass,
            decoration:  InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              alignLabelWithHint: true,
              prefixIcon: const Icon(Icons.lock_outlined),
              prefixIconColor: const Color.fromARGB(255, 22, 102, 3),
              suffixIcon: IconButton(onPressed: () {
                setState(() {
                  obsecurePass = !obsecurePass;
                });
              },
               icon: obsecurePass ? const Icon(Icons.visibility_off_outlined, color: Colors.black38,) : const Icon(Icons.visibility_outlined, color: const Color.fromARGB(255, 118, 212, 122),))

            ),

            
          ),
            Config.spaceSmall,
            //login button
            Button(
              width: double.infinity,
              title: 'Sign In',
              onPressed: () {
                //let try sign in manually
                Navigator.of(context).pushNamed('main');
              }, 
              disable: false,
              )



        ],

      ),
    );
   
  }
}