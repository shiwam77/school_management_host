// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);
//
// class CreateUserModel {
//   String? email;
//   String? password;
//
//   CreateUserModel({
//     this.email,
//     this.password,
//   });
//
//   factory CreateUserModel.fromJson(Map<String, dynamic> json) =>
//       CreateUserModel(
//         email: json["email"],
//         password: json["password"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "email": email,
//         "password": password,
//       };
// }
//
// class User {
//   String? otpVerified;
//   String? userType;
//   String? email;
//   DateTime? registrationDate;
//   String? companyName;
//   int? notificationCount;
//   List<String>? permissions;
//   String? access;
//   String? refresh;
//
//   User({
//     this.otpVerified,
//     this.userType,
//     this.email,
//     this.registrationDate,
//     this.companyName,
//     this.notificationCount,
//     this.permissions,
//     this.access,
//     this.refresh,
//   });
//
//   User copyWith({
//     String? otpVerified,
//     String? userType,
//     String? email,
//     DateTime? registrationDate,
//     String? companyName,
//     int? notificationCount,
//     List<String>? permissions,
//     String? access,
//     String? refresh,
//   }) =>
//       User(
//         otpVerified: otpVerified ?? this.otpVerified,
//         userType: userType ?? this.userType,
//         email: email ?? this.email,
//         registrationDate: registrationDate ?? this.registrationDate,
//         companyName: companyName ?? this.companyName,
//         notificationCount: notificationCount ?? this.notificationCount,
//         permissions: permissions ?? this.permissions,
//         access: access ?? this.access,
//         refresh: refresh ?? this.refresh,
//       );
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//         otpVerified: json["otp_verified"],
//         userType: json["user_type"],
//         email: json["email"],
//         registrationDate: json["registration_date"] == null
//             ? null
//             : DateTime.parse(json["registration_date"]),
//         companyName: json["company_name"],
//         notificationCount: json["notification_count"],
//         permissions: json["permissions"] == null
//             ? []
//             : List<String>.from(json["permissions"]!.map((x) => x)),
//         access: json["access"],
//         refresh: json["refresh"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "otp_verified": otpVerified,
//         "user_type": userType,
//         "email": email,
//         "registration_date":
//             "${registrationDate!.year.toString().padLeft(4, '0')}-${registrationDate!.month.toString().padLeft(2, '0')}-${registrationDate!.day.toString().padLeft(2, '0')}",
//         "company_name": companyName,
//         "notification_count": notificationCount,
//         "permissions": permissions == null
//             ? []
//             : List<dynamic>.from(permissions!.map((x) => x)),
//         "access": access,
//         "refresh": refresh,
//       };
// }
