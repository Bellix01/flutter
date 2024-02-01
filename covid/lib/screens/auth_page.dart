import 'package:covid/components/login_form.dart';
import 'package:covid/utils/config.dart';
import 'package:covid/utils/text.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("back.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.clear,
            ),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Config.spaceSmall,
                Center(
                  child: Text(
                    AppText.enText['signIn_text']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Config.spaceSmall,
                Image.asset(
                  'assets/back.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                Config.spaceSmall,
                LoginForm(),
                Config.spaceSmall,
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Ajoutez le code pour gérer le clic sur "Mot de passe oublié"
                    },
                    child: Text(
                      AppText.enText['forgot-password']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
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
