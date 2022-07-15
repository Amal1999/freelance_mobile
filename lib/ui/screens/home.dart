import 'package:flutter/material.dart';
import 'package:freelance/settings/config.dart';
import 'package:freelance/ui/screens/inscription_screen.dart';
import 'package:freelance/ui/widgets/auth_button.dart';
import 'package:freelance/ui/widgets/curve_painter.dart';
import 'package:freelance/ui/widgets/text_field.dart';
import 'package:freelance/validators/string_utility.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: CustomPaint(
                size: Size(context.width, 200 /*context.height * .25*/),
                painter: CurvePainter(),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: context.height * .02),
                child: Text(
                  "Bienvenu à nouveau",
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthTextField(
                      icon: Icons.email,
                      hintText: "E-mail",
                      valid: StringUtility.isEmail,
                      error: "E-mail invalide"),
                  AuthTextField(
                    icon: Icons.password_outlined,
                    hintText: "Mot de passe",
                    type: "password",
                    validPassword: StringUtility.isLengthLongerOrEqual,
                    error: "Doit contenir au minimum 6 caractères",
                  ),
                  AuthButton(
                    onPressed: () {
                    },
                    content: "Se connecter",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Vous n'avez pas de compte ? "),
                      InkWell(
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Text("Créez-en un",style: TextStyle(
                          color: Colors.purple.shade400,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const InscriptionScreen()));
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
