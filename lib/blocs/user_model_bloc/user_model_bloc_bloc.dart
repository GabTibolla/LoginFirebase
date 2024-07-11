import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_model_bloc_event.dart';
part 'user_model_bloc_state.dart';

class UserModelBlocBloc extends Bloc<UserModelBlocEvent, UserModelBlocState> {
  UserModelBlocBloc() : super(UserModelBlocInitial()) {
    on<UserModelBlocEvent>((event, emit) {});
  }
}
