import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/strings.dart';
import 'package:prasada_political_portfolio/app/modules/login/controller/login_controller.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/widgets/custom_widget.dart';

FocusNode emailFocusNode = FocusNode();
FocusNode passwordFocusNode = FocusNode();
FocusNode loginFocusNode = FocusNode();

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 180,
                    child: Image.asset("assets/images/ivin_logo.png")),
                Text(
                  AppStrings.login,
                  style: AppStyles.tsSecondaryRegular18
                      .copyWith(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Please sign in to continue',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff7A7A7A)),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: AppStyles.tsSecondaryRegular18,
                        decoration: InputDecoration(
                            // errorText: "Please Enter valid email",
                            hintText: AppStrings.enterYourEmail,
                            labelText: AppStrings.email,
                            prefixIcon: Icon(
                              Icons.email,
                              // color: AppColors.greyColor,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: controller.passwordController,
                          obscureText: controller.isObscurePassword.value,
                          focusNode: passwordFocusNode,
                          obscuringCharacter: '*',
                          style: AppStyles.tsSecondaryRegular18,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: InkWell(
                                onTap: () => controller.handelObscurePassword(),
                                child: Icon(controller.isObscurePassword.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility)),
                            hintText: AppStrings.enterPassword,
                            labelText: AppStrings.password,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      CustomButton(
                        buttonName: 'Login',
                        icon: Icons.arrow_forward,
                        onTap: () => controller.login(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
