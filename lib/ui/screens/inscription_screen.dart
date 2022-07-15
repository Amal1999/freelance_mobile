import 'package:flutter/material.dart';
import 'package:freelance/settings/config.dart';
import 'package:freelance/ui/screens/entreprise_inscription/entreprise_insc_screen.dart';
import 'package:freelance/ui/widgets/curve_painter.dart';
import 'package:freelance/ui/widgets/insc_button.dart';

class InscriptionScreen extends StatelessWidget {
  const InscriptionScreen({Key? key}) : super(key: key);

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
                  "Merci de choisir le type de votre compte",
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(height: 35,),
            InscriptionButton(onPressed:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const EntrepriseInscriptionScreen()));
            },content:"Compte entreprise"),
            InscriptionButton(onPressed:(){
            },content:"Compte personnel"),
          ],
        ),
      ),
    );
  }
}
