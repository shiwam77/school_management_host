import 'package:school_management_flutter/auth/model/permission_model.dart';

class UserConst {
  UserConst._();
  static late String? access;
  static late String? id;
  static late String? refresh;
  static late String? otpVerified;
  static late String? userType;
  static late String? subscriptionExpiryDate;
  static late String? email;
  static late String? registrationDate;
  static late String? companyName;
  static late String? companyAddress;
  static late String? notificationCount;
  static List<AdminMenuItem>? permissions = [
    AdminMenuItem(
      title: 'Academic',
      children: [
        AdminMenuItem(
          title: 'Section',
          route: 'section',
        ),
        AdminMenuItem(
          title: 'Class',
          route: 'class',
        ),
        AdminMenuItem(
          title: 'Subject',
          route: 'subject',
        ),
        AdminMenuItem(
          title: 'Subject Group',
          route: 'SubjectGroup',
        ),
        AdminMenuItem(
          title: 'Promote Student',
          route: 'promoteStudent',
        ),
        AdminMenuItem(
          title: 'Assign Class Teacher',
          route: 'assignClassTeacher',
        ),
        AdminMenuItem(
          title: 'Teacher TimeTable',
          route: 'teacherTimeTable',
        ),
        AdminMenuItem(
          title: 'Class TimeTable',
          route: 'classTimeTable',
        ),
      ],
    )
  ];
}
