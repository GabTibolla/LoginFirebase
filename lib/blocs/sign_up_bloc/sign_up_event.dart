part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpRequired extends SignUpEvent {
  final UserModel userModel;
  final String password;

  const SignUpRequired({required this.userModel, required this.password});
}
