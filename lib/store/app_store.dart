import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:anan_onboarding/helper/flash_helper.dart';
import 'package:anan_onboarding/injection.dart';
import 'package:anan_onboarding/models/design_styles.dart';
import 'package:anan_onboarding/presentation/widgets/processing_dialog.dart';
import 'package:anan_onboarding/services/navigation_service.dart';
import 'package:anan_onboarding/services/services.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = AppBase with _$AppStore;

abstract class AppBase with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableList<DesignStyles>? styles;

  @observable
  ObservableList<DesignStyles> selectedStyles = ObservableList<DesignStyles>();

  @action
  Future<void> init() async {
    getDesignStyles();
  }

  @action
  Future<void> selectStyle({required DesignStyles style}) async {
    if (selectedStyles.contains(style)) {
      selectedStyles.remove(style);
    } else {
      selectedStyles.add(style);
    }
  }

  @action
  Future<void> submitStyles() async {
    locator<NavigationService>().showLoadingDialog(
        child: const ProcessingDialog(message: 'Please wait...'));
    await Services().submitStyles();
    locator<NavigationService>().goBack();
    selectedStyles.clear();
    FlashHelper.successBar(
        message: 'You have successfully saved classic, modern');
  }

  @action
  Future<void> getDesignStyles() async {
    try {
      isLoading = true;
      styles = null;
      final resp = await Services().getDesignStyles();
      isLoading = false;
      styles ??= ObservableList<DesignStyles>();
      if (resp.statusCode < 400) {
        final jsonResp = json.decode(resp.body);
        List<DesignStyles>? design = jsonResp != null
            ? List.from(jsonResp.map((e) => DesignStyles.fromJson(e)))
            : null;
        if (design != null && design.isNotEmpty) {
          styles!.addAll(design);
        }
      }
    } catch (e) {
      log('getDesignStyles exception -> $e');
      isLoading = false;
      styles ??= ObservableList<DesignStyles>();
    }
  }
}
