import 'package:provider/provider.dart';

import '../../features/home/provider/home_provider.dart';
import '../../features/network_loader/provider/network_loader_provider.dart';

/// This class manage all the provider and return list of provider.
class Providers {
  /// This is the list of providers to manage and attache with application.
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
    ChangeNotifierProvider<NetworkLoaderProvider>(
        create: (_) => NetworkLoaderProvider()),
  ];
}
