import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:anan_onboarding/models/design_styles.dart';
import 'package:anan_onboarding/services/services.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = AppBase with _$AppStore;

abstract class AppBase with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableList<DesignStyles>? styles;

  @action
  Future<void> init() async {
    getDesignStyles();
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
        if (design != null && design.isNotEmpty) {}
      }
    } catch (e) {
      log('getDesignStyles exception -> $e');
      isLoading = false;
      styles ??= ObservableList<DesignStyles>();
    }
  }
}
