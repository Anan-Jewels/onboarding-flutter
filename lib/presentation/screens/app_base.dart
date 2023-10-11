import 'package:anan_onboarding/store/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
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
        body: RefreshIndicator(
          onRefresh: () async {
            store.init();
          },
          child: Observer(builder: (context) {
            return Container();
          }),
        ),
      ),
    );
  }

  getIcon(String icon) {
    return SvgPicture.asset('assets/svg/$icon.svg');
  }
}
