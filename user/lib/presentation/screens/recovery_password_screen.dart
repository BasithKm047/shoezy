import 'package:flutter/material.dart';
import 'package:shoezy/presentation/widgets/costum_widget.dart';

class RecoveryPasswordScreen extends StatelessWidget {
  const RecoveryPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CostumWidget.backButton(context),
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  CostumWidget.labelText(
                    context,
                    'Recovery Password',
                    fontSize: 25,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        CostumWidget.labelText(
                          fontSize: 15,
                          context,
                          fontWeight: FontWeight.normal,
                          'Please Enter Your Email Address To', 
                    
                        ),
                        CostumWidget.labelText(context, 'Recieve a Verification Code',
                        fontSize: 15,
                        fontWeight: FontWeight.normal)
                      ],
                    ),
                  ),
                ],
              ),

              
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                SizedBox(width: 20,),
                CostumWidget.labelText(context, 'Email Adress'),
              ],
            ),
            SizedBox(height: 10,),
            CostumWidget.costumTextformField(hintText: 'Email',
            borderRadius: 50,
            isBorderNotNeed: false,
            width:screenWidth/1.1 ),

            SizedBox(height: 40,),

            CostumWidget.costumElevatedButton(context: context, title: 'Continue',
            width: screenWidth/1.1,
            fontSize: 17,
            borderRadius: 50),
            SizedBox(height: 20,),
   
      
          ],
        ),
      ),
    );
  }


}
