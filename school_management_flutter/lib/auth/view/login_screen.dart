import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_flutter/auth/vm/login_screen.vm.dart';
import 'package:school_management_flutter/auth/widget.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/const/app_image.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/widget/dot_animation.dart';
import 'package:school_management_flutter/widget/reactangular_text_feild.dart';
import 'package:school_management_flutter/widget/widget.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

import '../../widget/scroll_column_expandable.dart';

class LoginScreen extends StatelessView<LoginVm> {
  const LoginScreen({super.key});

  @override
  ViewModelProvider<LoginVm> get vm => loginVMProvider;

  @override
  Widget render(BuildContext context, LoginVm vm, ref) {
    return Scaffold(
      body: AuthBodyView(
        child: LoginForm(
          vm: vm,
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final LoginVm vm;
  const LoginForm({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 70.w, right: 100.w),
      child: Form(
        key: vm.formKey,
        child: ScrollColumnExpandable(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              "School Management",
              style: context.theme.textTheme.titleMedium!.copyWith(
                  fontSize: 24.spMin,
                  color: AppColors.textColorBlack,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(
              'Where Ideas Meet Execution - Login to Make it Happen',
              style: context.theme.textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontSize: 36.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(
              'Enter your email and password to start using the application',
              style: context.theme.textTheme.titleMedium!.copyWith(
                color: Color(0xFF929292),
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 81.h,
            ),
            RectangularTextField(
              label: 'Enter You Email',
              controller: vm.userNameController,
              hintText: 'Username',
              isPrimary: true,
              isError: vm.isUserNameError,
              suffixIcon: const SizedBox.shrink(),
              validator: (value) {
                return vm.userNameValidator();
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            RectangularTextField(
              label: 'Enter You Password',
              controller: vm.passwordController,
              hintText: 'Password',
              isPrimary: true,
              isError: vm.isPasswordError,
              obscureText: !vm.isPasswordVisible,
              suffixIcon: GestureDetector(
                onTap: () {
                  vm.passwordVisiblity();
                },
                child: Icon(
                  vm.isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
              validator: (value) {
                return vm.passwordValidator();
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  vm.navigateToForgetPasswordScreen();
                },
                child: Text(
                  'Forgot your password ?',
                  style: context.theme.textTheme.titleMedium!.copyWith(
                    color: const Color(0xFF181EB5),
                    fontSize: 18.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: vm.isChecked,
                  activeColor: Colors.white, // Set to white
                  checkColor: Colors.white, // Set to white
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        // If the checkbox is checked, return white
                        return AppColors.btnColor;
                      }
                      // Otherwise, return null (default fill color)
                      return Colors.white;
                    },
                  ),
                  onChanged: (bool? value) {
                    vm.toggleCheckBox(value!);
                  },
                  visualDensity: VisualDensity.compact,
                  hoverColor: Colors.black.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: Colors.black), // Set border color to black
                    borderRadius: BorderRadius.circular(
                        4.0), // Adjust border radius as needed
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                SizedBox(
                  width: 28.w,
                ),
                Expanded(
                  child: Text(
                    'Terms and Conditions: Guidelines for product use, covering conduct, privacy, and more',
                    style: TextStyle(
                      color: const Color(0xFF6F6F6F),
                      fontSize: 20.sp,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            GestureDetector(
              onTap: () async {
                vm.login();
              },
              child: Container(
                height: 57.h,
                decoration: ShapeDecoration(
                  color: AppColors.btnColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: vm.isLoading
                      ? const RotatingDots(
                          size: 30,
                          color: Color(0xFF5342F0),
                        )
                      : Text(
                          'Sign In',
                          textAlign: TextAlign.center,
                          style: context.theme.textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 23.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                divider(),
                Text(
                  'OR',
                  style: TextStyle(
                    color: Color(0xFF838383),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                divider()
              ],
            ),
            SizedBox(height: 15.h),
            ContinueWithButton(
              label: 'Continue with google',
              iconSvg: AppImage.googleIcon,
              onTap: () {
                // vm.signInWithGoogle();
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account ? ",
                      style: context.theme.textTheme.titleMedium!.copyWith(
                        color: const Color(0xFF929292),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          vm.navigateToSignupScreen();
                        },
                      style: context.theme.textTheme.titleMedium!.copyWith(
                        color: const Color(0xFF181EB5),
                        fontSize: 20.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 45.h,
            ),
          ],
        ),
      ),
    );
  }
}

Widget divider() {
  return Container(
    width: 135.w,
    decoration: const ShapeDecoration(
      color: Color(0xFF7F7F7F),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.50,
          strokeAlign: BorderSide.strokeAlignCenter,
          color: Color(0xFF838383),
        ),
      ),
    ),
  );
}
