import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;

  SignUpBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignUpBlocInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpProgress());
      try {
        UserModel user = await _userRepository.signUp(event.userModel, event.password);

        if (user == UserModel.empty) {
          emit(const SignUpFailure(message: "e-mail already in use or is invalid"));
          return;
        }

        await _userRepository.setUserData(user);
        emit(SignUpSuccess());
      } catch (e) {
        emit(const SignUpFailure());
      }
    });
  }
}
