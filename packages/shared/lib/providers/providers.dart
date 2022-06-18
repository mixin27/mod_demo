import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/config/app_const.dart';

final dioProvider = Provider(
  (ref) => Dio()
    ..options = BaseOptions(
      baseUrl: AppConst.baseUrl,
      contentType: 'application/json',
    ),
);
