import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../core/core.dart';
import '../provider/network_loader_provider.dart';

class NetworkLoader extends StatelessWidget {
  /// Constructor of the class.
  final Widget child;
  const NetworkLoader({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NetworkLoaderProvider>(builder: (context, __, _) {
      return Stack(
        children: [
          child,
          Visibility(
            visible: __.isLoading,
            child: Container(
              color: blackColor.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
