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



  /////////////////////////////////////////////////////////////////
  //validtion conditons for Name

    // validator: (value) {
    //                 if (value!.isEmpty) {
    //                   return 'Please enter a username';
    //                 }
    //                 return null;
    //               },