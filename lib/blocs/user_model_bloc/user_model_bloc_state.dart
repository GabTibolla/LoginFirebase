part of 'user_model_bloc_bloc.dart';

sealed class UserModelBlocState extends Equatable {
  const UserModelBlocState();
  
  @override
  List<Object> get props => [];
}

final class UserModelBlocInitial extends UserModelBlocState {}
