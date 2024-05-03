import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_management_flutter/mixin/validator.dart';
import 'package:school_management_flutter/router/route_handle_2.0.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class ForgetPasswordVm extends ViewModel {
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
        await Future.delayed(const Duration(seconds: 1));
        navigateToOtpScreen();
      } catch (e, stackTrace) {
      } finally {
        isLoading = false;
        setState(() {});
      }
    }
  }

  navigateToOtpScreen() {
    context.push(CustomNavigationHelper.otpscreen);
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

final forgetPasswordVmProvider = ViewModelProviderFactory.create((ref) {
  return ForgetPasswordVm();
});
