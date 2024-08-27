import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbs/controller/auth_controller.dart';
import 'package:mbs/helper/route_helper.dart';
import 'package:mbs/util/dimensiona.dart';
import 'package:mbs/view/widgets/toaster_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key, }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController useremail = TextEditingController();
  TextEditingController userpass = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    useremail.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding:
                                EdgeInsets.all(Dimensions.paddingSizeSmall),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault),
                                color: Theme.of(context)
                                    .hintColor
                                    .withOpacity(0.25)),
                            child: Text(
                              "skip",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: Dimensions.fontSizeDefault,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    
                    SizedBox(
                      child: Text(
                        "mbs",
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                foreground: Paint()
                                  ..shader = LinearGradient(
                                    colors: [
                                      Colors.red,
                                      Theme.of(context).primaryColor
                                    ],
                                  ).createShader(const Rect.fromLTWH(0, 0, 200, 25)),
                                fontSize: Dimensions.fontSizeOverLarge,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeExtraLarge,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text(
                              "Welcome",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      color: Colors.black,
                                      fontSize: Dimensions.fontSizeExtraLarge,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.paddingSizeSmall,
                          ),
                          SizedBox(
                            child: Text(
                              "Please enter your signup details below to start using app",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      color: Theme.of(context).hintColor,
                                      fontSize: Dimensions.fontSizeDefault,
                                      fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomSheet: SizedBox(
          height: Get.height * 0.2,
          child: Column(
            children: [
              const SizedBox(
                height: Dimensions.defaultSpacing,
              ),
              Center(
                child: SizedBox(
                  width: Get.width * 0.95,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Theme.of(context).primaryColor,
                      textStyle: const TextStyle(
                          color: Colors.white, fontStyle: FontStyle.normal),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radiusDefault),
                        ),
                      ),
                      shadowColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () async {
                      Get.toNamed(RouteHelper.dashboard);
                      if (useremail.text.isEmpty) {
                        Toaster(
                                type: ToasterType.error,
                                message: 'Pleaser enter your email')
                            .show(context);
                      } else if (userpass.text.isEmpty) {
                        Toaster(
                                type: ToasterType.error,
                                message: 'Pleaser enter your password')
                            .show(context);
                      } else {
                      
                        authController
                            .login(context,
                                email: useremail.text, password: userpass.text)
                            .then((res) => {
                                  if (res)
                                    {
                                      Toaster(
                                              type: ToasterType.success,
                                              message:
                                                  'User Authenticated Successfuly')
                                          .show(context)
                                    }
                                  else
                                    {
                                      Toaster(
                                              type: ToasterType.error,
                                              message:
                                                  'Wrong email or password')
                                          .show(context)
                                    }
                                });
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Sign In',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              const SizedBox(
                height: Dimensions.defaultSpacing,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                color: Colors.black,
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: 'Sign in',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(RouteHelper.auth);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: Dimensions.defaultSpacing,
              ),
            ],
          ),
        ),
      );
    });
  }
}
