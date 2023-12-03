import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:onboarding_project/mixins/base_mixin.dart';
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

  final List<OnboardingModel> _selectedItemsList = [];
String getSelectedItems(){
  String items="" ;
  for(int i = 0 ; i <getSelectedItemsList.length;i++){
    items = "$items${getSelectedItemsList.elementAt(i).name} ,";
  }
  items = items.substring(0, items.length - 2);
  return items ;
}

  List<OnboardingModel> get getSelectedItemsList => _selectedItemsList;

  void updateOnboardingItemSelectionStatus(int index) {
    if (onBoardingModelList?.elementAt(index).isSelected ?? false) {
      onBoardingModelList?.elementAt(index).isSelected = false;
      _selectedItemsList.removeWhere(
        (element) => element.id == onBoardingModelList?.elementAt(index).id,
      );
    } else {
      onBoardingModelList?.elementAt(index).isSelected = true;
      _selectedItemsList.add(onBoardingModelList!.elementAt(index));
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
