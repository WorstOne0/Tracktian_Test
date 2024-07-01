// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
// Controllers
import '/controllers/company_controller.dart';
// Models
import '/models/asset.dart';
import '/models/company.dart';
import '/models/location.dart';
// Services
import '/services/api_provider.dart';
import '/services/secure_storage.dart';

// My Controller are a mix between the Controller and Repository from the
// Riverpod Architecture (https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)
// It handles the management of the widget state (Riverpod Controller's job)
// It handles the data parsing and serialilzation from api's (Riverpod Repository's job)

@immutable
class AssetsState {
  const AssetsState({required this.assetList, required this.locationList});

  final List<Location> locationList;
  final List<Asset> assetList;

  AssetsState copyWith({List<Asset>? assetList, List<Location>? locationList}) {
    return AssetsState(
      assetList: assetList ?? this.assetList,
      locationList: locationList ?? this.locationList,
    );
  }
}

class CompanyController extends StateNotifier<AssetsState> {
  CompanyController({required this.ref, required this.apiProvider, required this.storage})
      : super(const AssetsState(assetList: [], locationList: []));

  Ref ref;
  // Api
  ApiProvider apiProvider;
  SecureStorage storage;

  Future<({bool success, String message})> requestLocations() async {
    try {
      Company company = ref.read(companyProvider).companySelected!;
      Response res = await apiProvider.dio.get("/companies/${company.id}/locations");

      if (res.statusCode != 200) {
        return (success: false, message: "");
      }

      List<Location> locationList = res.data
          .map((permission) => Location.fromJson(permission))
          .whereType<Location>()
          .toList();

      state = state.copyWith(locationList: locationList);

      return (success: true, message: "");
    } catch (error) {
      return (success: false, message: error.toString());
    }
  }

  Future<({bool success, String message})> requestAssets() async {
    try {
      Company company = ref.read(companyProvider).companySelected!;
      Response res = await apiProvider.dio.get("/companies/${company.id}/assets");

      if (res.statusCode != 200) {
        return (success: false, message: "");
      }

      List<Asset> assetList =
          res.data.map((permission) => Asset.fromJson(permission)).whereType<Asset>().toList();

      state = state.copyWith(assetList: assetList);

      return (success: true, message: "");
    } catch (error) {
      return (success: false, message: error.toString());
    }
  }
}

final assetsProvider = StateNotifierProvider<CompanyController, AssetsState>((ref) {
  return CompanyController(
    ref: ref,
    apiProvider: ref.watch(apiProvider),
    storage: ref.watch(secureStorageProvider),
  );
});
