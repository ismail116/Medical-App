import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sleuth/core/services/auth_service.dart';
import 'package:sleuth/core/services/validation_service.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    if (event is OnTextChangeEvent) {
      if (isButtonEnabled != _checkIfSignInButtonEnabled()) {
        isButtonEnabled = _checkIfSignInButtonEnabled();
        yield SignInButtonEnableChangedState(isEnabled: isButtonEnabled);
      }
    } else if (event is SignInTappedEvent) {
      if (_checkValidatorsOfTextField()) {
        try {
          yield LoadingState();
          await AuthService.signIn(
              emailController.text, passwordController.text);
          yield NextTabBarPageState();
          print("Go to the next page");
        } catch (e) {
          print('E to tstrng: ' + e.toString());
          yield ErrorState(message: e.toString());
        }
      } else {
        yield ShowErrorState();
      }
    } else if (event is ForgotPasswordTappedEvent) {
      yield NextForgotPasswordPageState();
    } else if (event is SignUpTappedEvent) {
      yield NextSignUpPageState();
    }
  }

  bool _checkIfSignInButtonEnabled() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  bool _checkValidatorsOfTextField() {
    return ValidationService.email(emailController.text) &&
        ValidationService.password(passwordController.text);
  }
}
