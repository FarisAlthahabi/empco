// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class RegisterState extends GeneralAuthState {}

final class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
   final TokenModel token;
  RegisterSuccess({
    required this.token,
  });
}

class RegisterFail extends RegisterState {
  final String error;

  RegisterFail(this.error);
 
}
