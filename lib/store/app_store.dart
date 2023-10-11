import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:anan_onboarding/helper/flash_helper.dart';
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
        final jsonResp = [
          {
            "createdAt": "2023-10-10T02:27:34.318Z",
            "name": "name 1",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "1"
          },
          {
            "createdAt": "2023-10-09T20:05:05.496Z",
            "name": "name 2",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "2"
          },
          {
            "createdAt": "2023-10-09T14:19:43.910Z",
            "name": "name 3",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "3"
          },
          {
            "createdAt": "2023-10-10T01:42:54.318Z",
            "name": "name 4",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "4"
          },
          {
            "createdAt": "2023-10-09T20:52:29.765Z",
            "name": "name 5",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "5"
          },
          {
            "createdAt": "2023-10-10T07:40:01.033Z",
            "name": "name 6",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "6"
          },
          {
            "createdAt": "2023-10-10T06:58:53.696Z",
            "name": "name 7",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "7"
          },
          {
            "createdAt": "2023-10-10T06:29:06.258Z",
            "name": "name 8",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "8"
          },
          {
            "createdAt": "2023-10-10T09:57:27.599Z",
            "name": "name 9",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "9"
          },
          {
            "createdAt": "2023-10-10T02:27:34.318Z",
            "name": "name 1",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "1"
          },
          {
            "createdAt": "2023-10-09T20:05:05.496Z",
            "name": "name 2",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "2"
          },
          {
            "createdAt": "2023-10-09T14:19:43.910Z",
            "name": "name 3",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "3"
          },
          {
            "createdAt": "2023-10-10T01:42:54.318Z",
            "name": "name 4",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "4"
          },
          {
            "createdAt": "2023-10-09T20:52:29.765Z",
            "name": "name 5",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "5"
          },
          {
            "createdAt": "2023-10-10T07:40:01.033Z",
            "name": "name 6",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "6"
          },
          {
            "createdAt": "2023-10-10T06:58:53.696Z",
            "name": "name 7",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "7"
          },
          {
            "createdAt": "2023-10-10T06:29:06.258Z",
            "name": "name 8",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "8"
          },
          {
            "createdAt": "2023-10-10T09:57:27.599Z",
            "name": "name 9",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "9"
          },
          {
            "createdAt": "2023-10-10T02:27:34.318Z",
            "name": "name 1",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "1"
          },
          {
            "createdAt": "2023-10-09T20:05:05.496Z",
            "name": "name 2",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "2"
          },
          {
            "createdAt": "2023-10-09T14:19:43.910Z",
            "name": "name 3",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "3"
          },
          {
            "createdAt": "2023-10-10T01:42:54.318Z",
            "name": "name 4",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "4"
          },
          {
            "createdAt": "2023-10-09T20:52:29.765Z",
            "name": "name 5",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "5"
          },
          {
            "createdAt": "2023-10-10T07:40:01.033Z",
            "name": "name 6",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "6"
          },
          {
            "createdAt": "2023-10-10T06:58:53.696Z",
            "name": "name 7",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "7"
          },
          {
            "createdAt": "2023-10-10T06:29:06.258Z",
            "name": "name 8",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "8"
          },
          {
            "createdAt": "2023-10-10T09:57:27.599Z",
            "name": "name 9",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "9"
          },
          {
            "createdAt": "2023-10-10T02:27:34.318Z",
            "name": "name 1",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "1"
          },
          {
            "createdAt": "2023-10-09T20:05:05.496Z",
            "name": "name 2",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "2"
          },
          {
            "createdAt": "2023-10-09T14:19:43.910Z",
            "name": "name 3",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "3"
          },
          {
            "createdAt": "2023-10-10T01:42:54.318Z",
            "name": "name 4",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "4"
          },
          {
            "createdAt": "2023-10-09T20:52:29.765Z",
            "name": "name 5",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "5"
          },
          {
            "createdAt": "2023-10-10T07:40:01.033Z",
            "name": "name 6",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "6"
          },
          {
            "createdAt": "2023-10-10T06:58:53.696Z",
            "name": "name 7",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "7"
          },
          {
            "createdAt": "2023-10-10T06:29:06.258Z",
            "name": "name 8",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "8"
          },
          {
            "createdAt": "2023-10-10T09:57:27.599Z",
            "name": "name 9",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "9"
          },
          {
            "createdAt": "2023-10-10T02:27:34.318Z",
            "name": "name 1",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "1"
          },
          {
            "createdAt": "2023-10-09T20:05:05.496Z",
            "name": "name 2",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "2"
          },
          {
            "createdAt": "2023-10-09T14:19:43.910Z",
            "name": "name 3",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "3"
          },
          {
            "createdAt": "2023-10-10T01:42:54.318Z",
            "name": "name 4",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "4"
          },
          {
            "createdAt": "2023-10-09T20:52:29.765Z",
            "name": "name 5",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "5"
          },
          {
            "createdAt": "2023-10-10T07:40:01.033Z",
            "name": "name 6",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "6"
          },
          {
            "createdAt": "2023-10-10T06:58:53.696Z",
            "name": "name 7",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "7"
          },
          {
            "createdAt": "2023-10-10T06:29:06.258Z",
            "name": "name 8",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "8"
          },
          {
            "createdAt": "2023-10-10T09:57:27.599Z",
            "name": "name 9",
            "image": "https://loremflickr.com/640/480/abstract",
            "id": "9"
          }
        ];
        // final jsonResp = json.decode(resp.body);
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
