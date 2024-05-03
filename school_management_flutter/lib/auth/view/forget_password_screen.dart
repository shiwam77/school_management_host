import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school_management_flutter/auth/vm/forget_password_screen.vm.dart';
import 'package:school_management_flutter/auth/widget.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/widget/dot_animation.dart';
import 'package:school_management_flutter/widget/reactangular_text_feild.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class ForgotPasswordScreen extends StatelessView<ForgetPasswordVm> {
  const ForgotPasswordScreen({super.key});

  @override
  ViewModelProvider<ForgetPasswordVm> get vm => forgetPasswordVmProvider;

  @override
  Widget render(BuildContext context, ForgetPasswordVm vm, ref) {
    return Scaffold(
      body: AuthBodyView(
        child: Padding(
          padding: EdgeInsets.only(left: 70.w, right: 100.w),
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              InkWell(
                onTap: () {
                  context.pop();
                },
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Forgot screen",
                      style: context.theme.textTheme.titleMedium!.copyWith(
                          fontSize: 24.spMin,
                          color: AppColors.textColorBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ForgetPasswordView(
                vm: vm,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordView extends StatelessWidget {
  final ForgetPasswordVm vm;
  const ForgetPasswordView({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: vm.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Unlock Your Account: Reset Your Password',
            style: context.theme.textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontSize: 36.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 32.sp),
          Text(
            'Enter your email address to get an otp for resetting your password',
            style: context.theme.textTheme.titleMedium!.copyWith(
              color: const Color(0xFF929292),
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 81.h,
          ),
          RectangularTextField(
            label: 'Enter You Email Address',
            controller: vm.userNameController,
            hintText: '@gmail.com',
            isPrimary: true,
            isError: vm.isUserNameError,
            suffixIcon: const SizedBox.shrink(),
            validator: (value) {
              return vm.userNameValidator();
            },
          ),
          SizedBox(
            height: 35.h,
          ),
          GestureDetector(
            onTap: () async {
              vm.forgetPassword();
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
                        'Get otp',
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
            height: 35.h,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Get Back To? ',
                  style: context.theme.textTheme.titleMedium!.copyWith(
                    color: const Color(0xFF929292),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'Log In',
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
        ],
      ),
    );
  }
}
