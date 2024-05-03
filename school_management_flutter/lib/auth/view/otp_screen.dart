import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:school_management_flutter/auth/vm/otp_screen.vm.dart';
import 'package:school_management_flutter/auth/widget.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/widget/dot_animation.dart';
import 'package:school_management_flutter/widget/reactangular_text_feild.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class OtpScreen extends StatelessView<OtpVM> {
  const OtpScreen({super.key});

  @override
  ViewModelProvider<OtpVM> get vm => otpVmProvider;

  @override
  Widget render(BuildContext context, OtpVM vm, ref) {
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
                      "OTP screen",
                      style: context.theme.textTheme.titleMedium!.copyWith(
                          fontSize: 24.spMin,
                          color: AppColors.textColorBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              OtpScreenView(
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

class OtpScreenView extends StatelessWidget {
  final OtpVM vm;
  const OtpScreenView({super.key, required this.vm});

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
            'Secret Code Validation: Confirm Your One-Time Password',
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
            label: 'Enter The Otp',
            controller: vm.userNameController,
            hintText: 'Enter Your Otp Here',
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
                        'Verify And Reset',
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
                  text: 'already have an account ? ',
                  style: context.theme.textTheme.titleMedium!.copyWith(
                    color: const Color(0xFF929292),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'Resend Now',
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
