import 'package:flutter/material.dart';
import 'package:resto_mania/common/generated_scaffold.dart';
import 'package:resto_mania/common/typography.dart';

import 'colors.dart';

class AppTextForm extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  const AppTextForm({super.key, this.labelText, this.hintText, this.prefixIcon, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller:controller ,
       decoration: InputDecoration(
         prefixIcon:prefixIcon ,
         prefixIconColor: AppColors.xffbb9867,
         labelStyle: roboto.get16.w400.textColor(AppColors.xffbb9867),
         labelText: labelText,
         hintStyle: roboto.get16.w400.textColor(AppColors.xffbb9867) ,
         hintText:hintText ,
         fillColor: Colors.white,
         focusedBorder: OutlineInputBorder(
           gapPadding: 5,
           borderRadius: BorderRadius.circular(10),
           borderSide:  const BorderSide(
             width: 2,
             color: AppColors.xffbb9867,
           ),
         ),
         enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10),
           borderSide:  const BorderSide(
             color:  AppColors.xffbb9867,
             width: 2,
           ),
         ),
       )
      ),
    );
  }
}
class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return  Divider(
      color: AppColors.xffbb9867,
      thickness: 2,
      endIndent: width * 0.35,
    );
  }
}
class AppButton extends StatelessWidget {
  final Widget? icon;
  final Color? iconColor;
  final String? text;
  final TextStyle? textStyle;
  final double? width;
  final void Function()? onPressed;

  const AppButton({
    Key? key,
    this.icon,
    this.iconColor,
    this.text,
    this.onPressed,
    this.textStyle, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.xffFBF3E8,
          side: const BorderSide(
            width: 2.0,
            color: AppColors.xffbb9867,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text ?? "", style: textStyle),
            SizedBox(
              width: 24, // Adjust the width as needed
              height: 24, // Adjust the height as needed
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final TextStyle? style;
  const CommonAppBar({
    required this.title,
    this.actions,
    Key? key,
    this.style,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Image.asset("assets/icons/drawer.png"),
      ),
      backgroundColor: AppColors.xffF8E1C2,
      title: Row(
        children: [
          Text(title, style: style),
        ],
      ),
      actions: actions,
      automaticallyImplyLeading: true,
      elevation: 0,
    );
  }
}

