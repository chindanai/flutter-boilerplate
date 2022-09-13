import 'package:flutter_boilerplate/modules/main/views/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:formz/formz.dart';
import 'package:flutter_boilerplate/modules/common/widgets/red_rounded_button.dart';
import 'package:flutter_boilerplate/modules/common/widgets/screen_wrapper.dart';
import 'package:flutter_boilerplate/modules/login/bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const String route = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bool _enableSocailLogin = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        switch (state.status) {
          case FormzStatus.submissionInProgress:
            EasyLoading.show(status: 'common.loading'.tr());
            break;
          default:
            EasyLoading.dismiss();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(MainScreen.route, (route) => false);
            break;
        }
      },
      child: ScreenWrapper(
        backgroundColor: Theme.of(context).backgroundColor,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.transparent,
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'login.phone_number_title',
                            style: Theme.of(context).textTheme.headline1,
                          ).tr(),
                          const SizedBox(
                            height: 8,
                          ),
                          TextField(
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.phone,
                            onChanged: (value) =>
                                BlocProvider.of<LoginBloc>(context)
                                    .add(LoginEventPhoneNumberChannged(value)),
                            decoration: InputDecoration(
                              hintText: 'login.phone_number_hint'.tr(),
                              hintStyle: const TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          RedRoundedButton(
                            onPressed: () => BlocProvider.of<LoginBloc>(context)
                                .add(const LoginEventSubmitted()),
                            title: 'login.login_button_title'.tr(),
                          ),
                          if (_enableSocailLogin)
                            Column(
                              children: const [
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
