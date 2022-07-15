import 'package:flutter/material.dart';
import 'package:freelance/settings/config.dart';
import 'package:freelance/ui/widgets/auth_button.dart';
import 'package:freelance/ui/widgets/curve_painter.dart';
import 'package:freelance/ui/widgets/text_field.dart';
import 'package:freelance/validators/string_utility.dart';

class EntrepriseInscriptionScreen extends StatelessWidget {
  const EntrepriseInscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: CustomPaint(
                size: Size(context.width,200),
                painter: CurvePainter(),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: context.height * .02),
                child: Text(
                  "Inscription",
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            AuthTextField(hintText: "Nom de l'entreprise",error: "Veuillez entrer le nom de votre entreprise",),
            AuthTextField(hintText: "E-mail",error: "Veuillez entrer un e-mail valide",valid: StringUtility.isEmail,),
            AuthTextField(hintText: "Mot de passe",error: "Le mot de passe doit contenir 6 caractères minimum",type: "password", validPassword: StringUtility.isLengthLongerOrEqual,),
            AuthTextField(hintText: "Numéro de téléphone",error: "Veuillez entrer un numéro de téléphone valide",type: "number", valid: StringUtility.isPhoneNumber,),

            AuthButton(content: "Suivant", onPressed: (){
            ///return to the login screen
              Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false);


            },)
          ],
        ),
      ),
    );
  }
}
