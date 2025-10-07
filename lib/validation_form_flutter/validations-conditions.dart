//password and confirm password validation




// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: PasswordValidationScreen(),
//     ),
//   );
// }

// class PasswordValidationScreen extends StatefulWidget {
//   const PasswordValidationScreen({super.key});

//   @override
//   State<PasswordValidationScreen> createState() =>
//       _PasswordValidationScreenState();
// }

// class _PasswordValidationScreenState extends State<PasswordValidationScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('✅ Password Matched Successfully!')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Password Validation Example")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter password';
//                   }
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   if (!RegExp(
//                     r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{6,}$',
//                   ).hasMatch(value)) {
//                     return 'Use at least 1 capital, 1 number, 1 special char';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: _confirmPasswordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Confirm Password',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please confirm password';
//                   }
//                   if (value != _passwordController.text) {
//                     return 'Passwords do not match';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                 ),
//                 child: const Text("Submit"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





// validations form key declear or //validation that connect with name or pass or email


// final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   void _sginupForm() {
//     if (_formkey.currentState!.validate()) {}
//   }



//Number Validations conditions

// String _validatenumber(value) {
//   if (value == null || value.isEmpty) {
//     return 'Please enter a number';
//   }
//   // Regular expression to match only digits
//   if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
//     return 'Please enter only digits';
//   }
//   return null; // Return null if the input is valid
// }


////////////////////////////////////////////////////////////////////////////

  //email validation conditions
  // String? _validateEmail(value) {
  //   if (value!.isEmpty) {
  //     return 'Please enter an email';
  //   }
  //   RegExp emailRegex = RegExp(
  //     r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  //   );
  //   if (!emailRegex.hasMatch(value)) {
  //     return 'Please enter a valid email';
  //   }
  //   return null;
  // }

///////////////////////////////////////////////////////////////////////////////

//in stf
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _confirmPasswordController =
  //     TextEditingController();


  //password validation
  // String? _validatePassword(value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter a password.';
  //   }
  //   if (value.length < 8) {
  //     return 'Password must be at least 8 characters long.';
  //   }
  //   if (!RegExp(r'[A-Z]').hasMatch(value)) {
  //     return 'Password must contain at least one uppercase letter.';
  //   }
  //   if (!RegExp(r'[a-z]').hasMatch(value)) {
  //     return 'Password must contain at least one lowercase letter.';
  //   }
  //   if (!RegExp(r'[0-9]').hasMatch(value)) {
  //     return 'Password must contain at least one digit.';
  //   }
  //   if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
  //     return 'Password must contain at least one special character.';
  //   }
  //   return null; // Return null if the password is valid
  // }


  //confirm password validator
  // String? _validateConfirmpassword(value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please confirm password';
  //   }
  //   if (value != _passwordController.text) {
  //     return 'Passwords do not match';
  //   }
  //   return null;
  // }


  /////////////////////////////////////////////////////////////////
  //validtion conditons for Name

    // validator: (value) {
    //                 if (value!.isEmpty) {
    //                   return 'Please enter a username';
    //                 }
    //                 return null;
    //               },






//////////////////////////////////////////////////////
// final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  // void _sginupForm() {
  //   if (_formkey.currentState!.validate()) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('✅ Password Matched Successfully!')),
  //     );
  //   }
  // }



  ////////////////////////////////////////////////////////////////////
   //validation of Sign up
  // void _signupform() {
  //   if (_formkey.currentState!.validate()) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('✅ Password Matched Successfully!')),
  //     );
  //   }
  //   setState(() {
  //     if (_formkey.currentState!.validate()) {
  //       // ✅ All fields valid → go to next page
  //       Navigator.pushNamed(context, Signup2screen.id);
  //     } else {
  //       // ❌ Some fields invalid → show message
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text("Please correct all fields")),
  //       );
  //     }
  //   });
  // }