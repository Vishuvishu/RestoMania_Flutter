import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:resto_mania/common/text_form_field.dart';

import '../common/colors.dart';
import '../common/generated_scaffold.dart';
import '../common/typography.dart';
import 'otp.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController mobileController = TextEditingController();
    var width = MediaQuery.of(context).size.width;
    return  appScaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 80,right: 20,left:20 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Fill your details",style:poppins.get30.w700.textColor(AppColors.gold)),
            Text("to get connected with us",style:poppins.get30.w700.textColor(AppColors.gold) ),
            const AppDivider(),
             Padding(
              padding: const EdgeInsets.only(top: 40),
              child: AppTextForm(
                controller: mobileController,
                prefixIcon: const Icon(Icons.phone),
                hintText:"+91 xxxx xxx xxx" ,
                labelText: "Mobile No",
              ),
            ),
            const AppTextForm(
              prefixIcon: Icon(Icons.person_outline_sharp),
              labelText: "Name",
              hintText: "Mr Foodie fox",
            ),
            Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               AppButton(
                 width: width * 0.4,
                 onPressed: () async {
                  await EasyLoading.show(status: 'loading...');
                   Navigator.push(
                    context,
                     MaterialPageRoute(
                       builder: (context) => OtpScreen(mobileNumber: mobileController.text),
                     ),
                   );
                  EasyLoading.dismiss();
                 },
                 text: "Get OTP",
                 textStyle: poppins.get25.w400.textColor(AppColors.xffbb9867),
                 icon: Image.asset("assets/icons/right.png"),
                 iconColor: AppColors.xffbb9867,
               ),
             ],
           )
          ],
        ),
      ) ,
    );
  }
}
