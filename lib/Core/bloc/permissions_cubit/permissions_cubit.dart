import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permissions_state.dart';

@injectable
class PermissionsCubit extends Cubit<PermissionsState> {
  PermissionsCubit() : super(PermissionsInitial());

  Future<void> requestPermission(Permission permission) async {
    final result = await permission.request();
    if (result == PermissionStatus.granted) {
      emit(PermissionsGranted(permission));
    } else if (result == PermissionStatus.denied) {
      emit(PermissionsDenied(permission));
    } else if (result == PermissionStatus.permanentlyDenied) {
      emit(PermissionsDenied(permission, isPermanent: true));
    }
  }
}
