import 'package:dio/dio.dart';
import 'package:empco/Core/dio/dio_client.dart';
import 'package:empco/Core/dio/exceptions.dart';
import 'package:empco/Core/models/licence_status_model/licence_status_model.dart';
import 'package:empco/Core/models/upload_licence_response_model/upload_licence_response_model.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

part 'http_licence_repo.dart';

abstract class LicenceRepo {
  Future<LicenceStatusModel> getLicenceStatus();

  Future<UploadLicenceResponseModel> uploadLicence(String file);
}