import 'dart:convert';

class SignUpuser {
  String? name, email, countryCode, phone, address, password, userId, confirm;

  SignUpuser(
      {required this.name,
      required this.countryCode,
      required this.userId,
      required this.email,
      required this.address,
      required this.password,
      required this.confirm,
      required this.phone});

  Map<String, dynamic> toMap() {
    return {
      "Name": name,
      "userId": userId,
      "countryCode": countryCode,
      "Email": email,
      "Passowrd": password,
      "Confirm": confirm,
      "Phone": phone,
      "Address": address,
    };
  }

  factory SignUpuser.fromJson(Map<String, dynamic> jason) {
    return SignUpuser(
        name: jason['Name'],
        userId: jason['userId'],
        email: jason['Email'],
        countryCode: jason[''],
        address: jason['Address'],
        password: jason['Passowrd'],
        confirm: jason['Confirm'],
        phone: jason['Phone']);
  }
}
