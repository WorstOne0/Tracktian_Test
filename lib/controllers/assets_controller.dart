// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
// Models
import 'package:tracktian_test/models/assets.dart';
// Services
import '/services/api_provider.dart';
import '/services/secure_storage.dart';

// My Controller are a mix between the Controller and Repository from the
// Riverpod Architecture (https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)
// It handles the management of the widget state (Riverpod Controller's job)
// It handles the data parsing and serialilzation from api's (Riverpod Repository's job)

@immutable
class AssetsState {
  const AssetsState({
    required this.assetsList,
  });

  final List<Assets> assetsList;

  AssetsState copyWith({List<Assets>? assetsList}) {
    return AssetsState(assetsList: assetsList ?? this.assetsList);
  }
}

class PermissionController extends StateNotifier<AssetsState> {
  PermissionController({required this.ref, required this.apiProvider, required this.storage})
      : super(
          const AssetsState(assetsList: []),
        );

  Ref ref;
  // Api
  ApiProvider apiProvider;
  SecureStorage storage;

  Future<({bool success, String message})> getCompanyPermissions() async {
    try {
      // Response res = await apiProvider.dio.get("/permissoes");

      // if (res.data["status"] != 200) {
      //   return (success: false, message: res.data["error"] as String);
      // }

      // List<MyPermission> permissionList = res.data["payload"]
      //     .map((permission) => MyPermission.fromJson(permission))
      //     .whereType<MyPermission>()
      //     .toList();

      // state = state.copyWith(permissionList: permissionList);

      return (success: true, message: "");
    } catch (error) {
      return (success: false, message: error.toString());
    }
  }
}

final assetsProvider = StateNotifierProvider<PermissionController, AssetsState>((ref) {
  return PermissionController(
    ref: ref,
    apiProvider: ref.watch(apiProvider),
    storage: ref.watch(secureStorageProvider),
  );
});
