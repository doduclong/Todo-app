// import 'package:flutter/material.dart';
//
// class MyTextField extends StatelessWidget {
//   final String label;
//   final IconData? icon;
//   final bool isPassword;
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final TextInputType keyboardType;
//
//   const MyTextField({
//     super.key,
//     required this.label,
//     required this.controller,
//     this.icon,
//     this.isPassword = false,
//     this.validator,
//     this.keyboardType = TextInputType.text,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       obscureText: isPassword,
//       validator: validator,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: icon != null ? Icon(icon) : null,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     );
//   }
// }
