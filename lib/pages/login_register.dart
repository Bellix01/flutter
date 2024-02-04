import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerNom = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> sauvegarderUtilisateur(
      String nom, String email, String motDePasse) async {
    try {
      await FirebaseFirestore.instance.collection('utilisateurs').add({
        'nom': nom,
        'email': email,
        'motDePasse': motDePasse,
      });
    } catch (e) {
      print("Erreur lors de la sauvegarde de l'utilisateur: $e");
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await sauvegarderUtilisateur(
        _controllerNom.text,
        _controllerEmail.text,
        _controllerPassword.text,
      );

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.purple],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Authentification',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _controllerNom,
                  decoration: InputDecoration(
                    labelText: 'Nom',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _controllerPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  errorMessage == '' ? '' : 'No ? $errorMessage',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: isLogin ? null : createUserWithEmailAndPassword,
                  child: Text(
                    isLogin ? 'Login' : 'Register',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin ? 'you dont have account? Register' : 'already have account? Login',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import'../auth.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}): super(key: key);
  
//   @override
//   State<LoginPage> createState() => _LoginPageState();


// }
// class _LoginPageState extends State<LoginPage> {

//   String? errorMessage = '';
//   bool isLogin = true;

//     final TextEditingController _controllerNom = TextEditingController();


//   final TextEditingController _controllerEmail = TextEditingController();

//   final TextEditingController _controllerPassword = TextEditingController();

// Future <void> signInWithEmailAndPassword() async{
//   try {
//     await Auth().signInWithEmailAndPassword(
//       email: _controllerEmail.text, 
//       password: _controllerPassword.text

      
//       );


//   } on FirebaseAuthException catch (e) {
//     setState(() {
      
//       errorMessage = e.message;
//     });
//   }
// }

// Future <void> createUserWithEmailAndPassword() async{
//   try {
//     await Auth().createUserWithEmailAndPassword(
//       nom: _controllerNom.text,
//       email: _controllerEmail.text, 
//       password: _controllerPassword.text
      
//       );


//   } on FirebaseAuthException catch (e) {
//     setState(() {
      
//       errorMessage = e.message;
//     });
//   }}

//    Widget _title(){
//     return const Text ('Firebase Auth');
//    }

//     Widget _entryField(
//       String title,
//       TextEditingController controller,
//     ){
//       return TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: title,
//         ),
//       );
//     }


//     Widget _errorMessage(){
//       return Text ( errorMessage == '' ? '' : 'No ? $errorMessage');

//     }
//     Widget _submitButton(){
//       return ElevatedButton(
//         onPressed: 
//         isLogin ? signInWithEmailAndPassword: createUserWithEmailAndPassword,
//         child: Text(isLogin ? 'login' : 'Register'),
//         );
//     }


//     Widget _loginOrRegisterButton() {
//       return TextButton(
//         onPressed: () {
//           setState(() {
//           isLogin = !isLogin;
//         });
//       },
//       child: Text(isLogin ? 'Register instead': 'Login instead'),
// ); // TextButton
// }



//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: _title(),
//       ), // AppBar
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           _entryField('nom', _controllerNom),

//           _entryField('email', _controllerEmail),
//           _entryField('password', _controllerPassword),
//           _errorMessage(),
//           _submitButton(),
//           _loginOrRegisterButton(),
//           ], // <Widget>[]
//         ), // Column
//       ), // Container
//     ); // Scaffold
//   }
// }