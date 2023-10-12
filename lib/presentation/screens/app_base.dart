import 'package:anan_onboarding/helper/Helper.dart';
import 'package:anan_onboarding/helper/flash_helper.dart';
import 'package:anan_onboarding/main.dart';
import 'package:anan_onboarding/presentation/widgets/header.dart';
import 'package:anan_onboarding/presentation/widgets/prev_next_button.dart';
import 'package:anan_onboarding/presentation/widgets/style_card.dart';
import 'package:anan_onboarding/store/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AppBase extends StatefulWidget {
  const AppBase({super.key});

  @override
  State<AppBase> createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> {
  late AppStore store;

  Future<bool> _onBackPressed() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('You want to exit App'),
          actions: <Widget>[
            OutlinedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            OutlinedButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    store = context.watch<AppStore>();
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          height: 100.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const PrevNextButton(
                allowSelection: false,
                isPrevious: true,
                onTap: null,
              ),
              Observer(builder: (context) {
                return PrevNextButton(
                  allowSelection: store.selectedStyles.isNotEmpty,
                  isPrevious: false,
                  onTap: () {
                    if (store.selectedStyles.isEmpty) {
                      FlashHelper.errorBar(
                        message: 'Please select at least one style to proceed!',
                      );
                    } else {
                      store.submitStyles();
                    }
                  },
                );
              }),
            ],
          ),
        ),
        body: SafeArea(
          child: Observer(
            builder: (context) => store.styles == null
                ? loadingIcon(color: context.primaryColor(), isFull: true)
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Header(),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Flexible(
                        flex: 10,
                        child: SingleChildScrollView(
                          child: Center(
                            child: Wrap(
                              runSpacing: 20.0,
                              spacing: 18.0,
                              children: [
                                ...store.styles!
                                    .map(
                                      (style) => StyleCard(
                                        style: style,
                                        isSelected: store.selectedStyles
                                            .contains(style),
                                        onTap: () {
                                          setState(() {
                                            store.selectStyle(style: style);
                                          });
                                        },
                                      ),
                                    )
                                    .toList()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
