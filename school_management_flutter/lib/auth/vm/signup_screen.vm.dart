import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_management_flutter/mixin/validator.dart';
import 'package:school_management_flutter/router/route_handle_2.0.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class SignupVm extends ViewModel {
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  late final TextEditingController conPasswordController;

  final formKey = GlobalKey<FormState>();
  bool isPasswordError = false;
  bool isConPasswordError = false;
  bool isUserNameError = false;
  bool isLoading = false;
  bool fullScreen = false;
  bool isPasswordVisible = false;
  bool isConPasswordVisible = false;
  bool isChecked = false;
  late bool isTrue;

  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    conPasswordController = TextEditingController();
    super.initState();
  }

  void passwordVisiblity() {
    isPasswordVisible = !isPasswordVisible;
    setState(() {});
  }

  void conPasswordVisiblity() {
    isConPasswordVisible = !isConPasswordVisible;
    setState(() {});
  }

  void toggleCheckBox(bool value) {
    isChecked = value;
    setState(() {});
  }

  signup() async {
    if (formKey.currentState!.validate() && isChecked == true) {
      try {
        isLoading = true;
        setState(() {});
        var loginUser = {
          "email": userNameController.text.trim(),
          "password": passwordController.text.trim()
        };
        await Future.delayed(Duration(seconds: 1));
      } catch (e, stackTrace) {
      } finally {
        isLoading = false;
        setState(() {});
      }
    }
  }

  navigateToForgetPasswordScreen() {
    context.push(CustomNavigationHelper.forgotPassword);
  }

  String? passwordValidator() {
    return FieldValidator.checkNullEmptyValidation(
        passwordController.text.trim(), "Password", hasError: (bool error) {
      if (error) {
        isPasswordError = true;
      } else {
        isPasswordError = false;
      }
      setState(() {});
    });
  }

  String? userNameValidator() {
    return FieldValidator.checkNullEmptyValidation(
        userNameController.text.trim(), "Username", hasError: (bool error) {
      if (error) {
        isUserNameError = true;
      } else {
        isUserNameError = false;
      }
      setState(() {});
    });
  }
}

final signupVmProvider = ViewModelProviderFactory.create((ref) {
  return SignupVm();
});
