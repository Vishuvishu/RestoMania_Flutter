import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pinput/pinput.dart';
import 'package:resto_mania/screens/welcome.dart';
import '../common/colors.dart';
import '../common/generated_scaffold.dart';
import '../common/text_form_field.dart';
import '../common/typography.dart';

class OtpScreen extends StatefulWidget {
  final String mobileNumber;

  const OtpScreen({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return  appScaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 80,right: 20,left:20 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter OTP sent to",style:poppins.get30.w700.textColor(AppColors.gold)),
            Text("+91 ${widget.mobileNumber}",style:poppins.get30.w700.textColor(AppColors.gold) ),
            const AppDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: buildPinPut(),
            ),
            AppButton(
              width:width * 0.4,
              onPressed: () async {
                await EasyLoading.show(status: 'loading...');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Welcome(),
                  ),
                );
                EasyLoading.dismiss();
              },
              text: "Verify",
              textStyle: poppins.get25.w600.textColor(AppColors.xffbb9867),
              icon: Image.asset("assets/icons/right.png"),

              iconColor: AppColors.xffbb9867,
            ),
            const onClose()
          ],
        ),
      ),
    );
  }
  Widget buildPinPut() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Pinput(
      defaultPinTheme: PinTheme(
      margin:  EdgeInsets.symmetric(horizontal:width* 0.01),
        width: 56,
        height: 56,
        textStyle: const TextStyle(fontSize: 20, color:AppColors.xffbb9867, fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.xffbb9867,width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onCompleted: (pin) => print(pin),
    );
  }
}
class onClose extends StatelessWidget {
  const onClose({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: InkWell(
        onTap: () {
          showdialog(context);
        },
          child: Image.asset("assets/icons/cancel.png",width:60 ,height:60)),
    );
  }
  showdialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert Dialog Title'),
            content: const Text('This is the content of the alert dialog.'),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

            ],
          );
        }
    );
  }
}
