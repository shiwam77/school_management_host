import 'package:school_management_flutter/auth/model/permission_model.dart';

class LoginUserModel {
  String? email;
  String? password;

  LoginUserModel({
    this.email,
    this.password,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

class User {
  String? id;
  String? otpVerified;
  dynamic userType;
  String? email;
  DateTime? registrationDate;
  String? companyName;
  String? notificationCount;
  String? companyAddress;
  List<AdminMenuItem>? permissions;

  User({
    this.id,
    this.otpVerified,
    this.userType,
    this.email,
    this.registrationDate,
    this.companyName,
    this.notificationCount,
    this.companyAddress,
    this.permissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        otpVerified: json["otp_verified"],
        userType: json["user_type"],
        email: json["email"],
        registrationDate: json["registration_date"] == null
            ? null
            : DateTime.parse(json["registration_date"]),
        companyName: json["company_name"],
        companyAddress: json["company_address"],
        notificationCount: json["notification_count"].toString(),
        permissions: json["permissions"] == null
            ? []
            : List<AdminMenuItem>.from(
                json["permissions"]!.map((x) => AdminMenuItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "otp_verified": otpVerified,
        "id": id,
        "user_type": userType,
        "email": email,
        "registration_date":
            "${registrationDate!.year.toString().padLeft(4, '0')}-${registrationDate!.month.toString().padLeft(2, '0')}-${registrationDate!.day.toString().padLeft(2, '0')}",
        "company_name": companyName,
        "company_address": companyAddress,
        "notification_count": notificationCount,
        "permissions": permissions == null
            ? []
            : List<AdminMenuItem>.from(permissions!.map((x) => x.toJson())),
      };
}
