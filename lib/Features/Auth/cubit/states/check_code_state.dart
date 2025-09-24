part of '../auth_cubit.dart';

class CheckCodeState extends GeneralAuthState{}

class CheckCodeInitialState extends CheckCodeState{}

class CheckCodeLoadingState extends CheckCodeState{}

class CheckCodeSuccessState extends CheckCodeState{}

class CheckCodeFailState extends CheckCodeState{
  final String error;

  CheckCodeFailState(this.error);
}
