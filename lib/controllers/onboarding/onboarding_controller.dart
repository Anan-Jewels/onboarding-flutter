import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:onboarding_project/models/onboarding/onboarding_model.dart';
import '../../network_services/api_services.dart';

class OnboardingController extends GetxController {
  List<OnboardingModel>? onBoardingModelList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getOnboardingDataApi();
  }

  void updateOnboardingItemSelectionStatus(int index) {
    if (onBoardingModelList?.elementAt(index).isSelected ?? false) {
      onBoardingModelList?.elementAt(index).isSelected = false;
    } else {
      onBoardingModelList?.elementAt(index).isSelected = true;
    }
    update();
  }

  Future<void> getOnboardingDataApi() async {
    try {
      final response = await ApiService.get("designstyles");
      if (kDebugMode) {
        print(response);
      }
      onBoardingModelList = (response as List)
          .map((entry) =>
              OnboardingModel.fromJson(entry as Map<String, dynamic>))
          .toList();
      update();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      throw error.toString();
    }
  }
}
