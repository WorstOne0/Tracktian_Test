// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
// Models
import 'package:tracktian_test/models/company.dart';
// Services
import '/services/api_provider.dart';
import '/services/secure_storage.dart';

// My Controller are a mix between the Controller and Repository from the
// Riverpod Architecture (https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)
// It handles the management of the widget state (Riverpod Controller's job)
// It handles the data parsing and serialilzation from api's (Riverpod Repository's job)

@immutable
class CompanyState {
  const CompanyState({required this.companyList, required this.companySelected});

  final List<Company> companyList;
  final Company? companySelected;

  CompanyState copyWith({List<Company>? companyList, Company? companySelected}) {
    return CompanyState(
      companyList: companyList ?? this.companyList,
      companySelected: companySelected ?? this.companySelected,
    );
  }
}

class CompanyController extends StateNotifier<CompanyState> {
  CompanyController({required this.ref, required this.apiProvider, required this.storage})
      : super(const CompanyState(companyList: [], companySelected: null));

  Ref ref;
  // Api
  ApiProvider apiProvider;
  SecureStorage storage;

  void selectCompany(Company company) => state = state.copyWith(companySelected: company);

  Future<({bool success, String message})> requestCompanies() async {
    try {
      Response res = await apiProvider.dio.get("/companies");

      if (res.statusCode != 200) {
        return (success: false, message: "");
      }

      List<Company> companyList =
          res.data.map((permission) => Company.fromJson(permission)).whereType<Company>().toList();

      state = state.copyWith(companyList: companyList);

      return (success: true, message: "");
    } catch (error) {
      return (success: false, message: error.toString());
    }
  }
}

final companyProvider = StateNotifierProvider<CompanyController, CompanyState>((ref) {
  return CompanyController(
    ref: ref,
    apiProvider: ref.watch(apiProvider),
    storage: ref.watch(secureStorageProvider),
  );
});
