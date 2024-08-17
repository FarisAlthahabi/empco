part of 'permissions_cubit.dart';

@immutable
abstract class PermissionsState {}

class PermissionsInitial extends PermissionsState {}

class PermissionsResult extends PermissionsState {
  PermissionsResult(this.permission);

  final Permission permission;
}

class PermissionsGranted extends PermissionsResult {
  PermissionsGranted(super.permission);
}

class PermissionsDenied extends PermissionsResult {
  PermissionsDenied(super.permission, {this.isPermanent = false});

  final bool isPermanent;
}
