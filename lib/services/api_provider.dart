// ignore_for_file: constant_identifier_names

// Flutter Packages
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_dio_adapter/native_dio_adapter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
// Services
import '/services/secure_storage.dart';

enum APIEnviroment { PROD, DESENV, LOCAL }

String baseUrlOnEnviroment(APIEnviroment enviroment) {
  return switch (enviroment) {
    APIEnviroment.PROD => "https://api-v2.wikidados.com.br",
    APIEnviroment.DESENV => "https://integracaohomologacao.wikidados.com.br",
    APIEnviroment.LOCAL => "http://10.0.0.173:3010",
  };
}

// Dio's Third-Party Plugins (https://github.com/cfug/dio/issues/347)
class ApiProvider {
  final Dio dio = Dio();

  Ref ref;
  SecureStorage secureStorage;

  ApiProvider({required this.ref, required this.secureStorage}) {
    // Basic Config
    BaseOptions defaultOptions = BaseOptions(
      baseUrl: baseUrlOnEnviroment(APIEnviroment.PROD),
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(minutes: 2),
      sendTimeout: const Duration(minutes: 2),
      receiveDataWhenStatusError: true,
      persistentConnection: true,
      contentType: "application/json",
    );

    dio.options = defaultOptions;
    // Better Conection established (DNS Lookup and SSL Handshake)
    // (https://pub.dev/packages/native_dio_adapter)
    dio.httpClientAdapter = NativeAdapter();

    // *** Interceptors ***

    // Cache (https://pub.dev/packages/dio_cache_interceptor)
    dioCacheConfig().then(
      (options) => dio.interceptors.add(DioCacheInterceptor(options: options)),
    );
  }

  Future<CacheOptions> dioCacheConfig() async {
    var tempDir = await getTemporaryDirectory();

    // Global options
    final options = CacheOptions(
      // A default store is required for interceptor.
      store: HiveCacheStore(tempDir.path),
      // Overrides any HTTP directive to delete entry past this duration.
      // Useful only when origin server has no cache config or custom behaviour is desired.
      // Defaults to [null].
      maxStale: const Duration(days: 7),
    );

    return options;
  }
}

final apiProvider = Provider<ApiProvider>(
  (ref) => ApiProvider(
    ref: ref,
    secureStorage: ref.watch(secureStorageProvider),
  ),
);
