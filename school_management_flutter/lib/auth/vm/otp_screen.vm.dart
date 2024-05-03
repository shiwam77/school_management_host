import 'package:flutter/material.dart';
import 'package:school_management_flutter/mixin/validator.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class OtpVM extends ViewModel {
  late final TextEditingController userNameController;
  bool isUserNameError = false;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userNameController = TextEditingController();
    super.initState();
  }

  forgetPassword() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading = true;
        setState(() {});
        var loginUser = {
          "email": userNameController.text.trim(),
        };
        await Future.delayed(Duration(seconds: 1));
      } catch (e, stackTrace) {
      } finally {
        isLoading = false;
        setState(() {});
      }
    }
  }

  String? userNameValidator() {
    return FieldValidator.validateEmail(userNameController.text.trim(),
        hasError: (bool error) {
      if (error) {
        isUserNameError = true;
      } else {
        isUserNameError = false;
      }
      setState(() {});
    });
  }
}

final otpVmProvider = ViewModelProviderFactory.create((ref) {
  return OtpVM();
});
