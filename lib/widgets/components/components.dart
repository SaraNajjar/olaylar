
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:olaylar/helpers/color_helper.dart';

void NavigatorTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
      builder: (context) => widget),
);

void NavigateAnfFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
      builder: (context) => widget
  ),
      (rout) => false,
);


Widget D_TextFromField({
  required TextEditingController controller,
  String? label,
  required IconData prefixIcon,
  required TextInputType keyboardType,
  String? Function(String?)? validator,
  Function()? onTap,
  String? Function(String?)? onChange,
  String? Function(String?)? onSubmitted,
  TextStyle? labelStyle,
  TextStyle? styleOutDecoration,
  String? hintText,
  double hintStyleFS = 15,
  double borderSideWidth = 1,
  double borderRadiusCircular = 20,
  Color? prefixIconColor,
  IconData? suffixIcon,
  Function()? suffixPressed,
  bool isobscureText = false,
  String? InitialValue
}) =>
    TextFormField(
      initialValue: InitialValue,
      validator: validator,
      controller: controller,
      onTap: onTap,
      onChanged: onChange,
      onFieldSubmitted: onSubmitted,
      keyboardType: keyboardType,
      style: styleOutDecoration,
      obscureText: isobscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: hintStyleFS,
          color: Colors.grey,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: prefixIconColor,
        ),
        label: Text(label!),
        labelStyle: labelStyle,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: borderSideWidth, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusCircular)),
        ),
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffixIcon),
        ),
      ),
    );

Widget D_MaterialButton(
    {
      required Function() onPressed,
      bool isUpperCase = true,
      required Widget child,
      Color textColor = Colors.white,
      double paddingSpace = 16.0,
      double raduis = 12.0,
      required double width,
      Color? color,
      Color colorb = Colors.transparent,
      double elevation = 0,
      double?height = 55
    }) =>
    Material(
      elevation: elevation,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.circular(raduis),
      child: Container(
        height: height,
        width: width,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: colorb,
            width: 0.5
          )
        ),
        child: MaterialButton(
          color: color,
          onPressed: onPressed,
          height: height,
          child: child,
          elevation: elevation,
          ),
      ),
    );

Widget D_TextButton ({
  required Function() onPressed,
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) => TextButton(
  onPressed: onPressed,
  child: Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,

    ),
  ),
);


Widget MyDivided ({required Color color, double? withOpacity}) => Container(
  width: double.infinity,
  height: 1,
  color: color,
);

void printFullText(String text){

  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}


//
// Widget textFormFailed({
//   String? initialValue,
//   String? hintText,
//   IconData? prefixIcon,
//   Widget? suffixIcon,
//   String? Function(String?)? onSaved,
//   required TextInputType keyboardType,
//   required TextEditingController textEditingController,
//   required String? Function(String?)? validator,
//   Future<String?> Function(String?)? onSubmit,
//   Function(String?)? onChanged,
//   bool isobscureText = false,
//   Color? color = Colors.white,
//   double radius = 10,
//   Color? prefixIconColor = Colors.grey,
//   int maxline = 1,
//   double width = double.infinity,
//
// }){
//   return Container(
//     width: width,
//     decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(radius),
//         border: Border.all(
//         width: 1,
//       color: ColorManager.greyBorder
//     )
//     ),
//     clipBehavior: Clip.antiAliasWithSaveLayer,
//     child: TextFormField(
//
//       onFieldSubmitted: onSubmit,
//       onChanged: onChanged,
//       initialValue: initialValue,
//       maxLines: maxline,
//       decoration: InputDecoration(
//         focusColor: Colors.cyan,
//         border: InputBorder.none,
//         hintText: hintText,
//         hintStyle: TextStyle(color: ColorManager.greyBorder),
//         prefixIcon: Icon(prefixIcon,color: prefixIconColor,size: 14,),
//         suffixIcon: suffixIcon,
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.red),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.red),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//       ),
//
//       keyboardType: keyboardType,
//       controller: textEditingController,
//       onSaved :onSaved,
//       validator: validator,
//       obscureText: isobscureText,
//       style: TextStyle(
//         color: Colors.black,
//         fontWeight: FontWeight.normal,
//       ),
//
//     ),
//   );
// }

AppBar customAppBar(
    {
     Color cbg =  Colors.black,
     Color sbg =  Colors.black,
    }
    ){
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: cbg,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: sbg,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}