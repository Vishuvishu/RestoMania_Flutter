import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../common/colors.dart';
import '../common/generated_scaffold.dart';
import '../common/text_form_field.dart';
import '../common/typography.dart';
import 'menu.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return appScaffold(
        body:  Padding(
          padding: const EdgeInsets.only(top: 80,right: 20,left:20 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("welcome to",style:poppins.get25.w700.textColor(AppColors.xff573C17)),
              Text("Gujju Resto",style:poppins.get41.w700.textColor(AppColors.xffbb9867) ),
              const AppDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Container(
                        height:200 ,
                        width:200 ,
                        decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Your Table No :",style: poppins.get25.w700.textColor(AppColors.xffbb9867),),
                        Text("1",style: poppins.get25.w700.textColor(AppColors.xffbb9867),),

                      ],
                    ),
                  ),
                  AppButton(
                    width: width * 0.4,
                    onPressed: () async {
                      await EasyLoading.show(status: 'loading...');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Menu(),
                        ),
                      );
                      EasyLoading.dismiss();
                    },
                    text: "Order",
                    textStyle: poppins.get25.w400.textColor(AppColors.xffbb9867),
                    icon: Image.asset("assets/icons/right.png"),
                    iconColor: AppColors.xffbb9867,
                  ),                ],
              )

            ],
          ),
        )
    );
  }
}
