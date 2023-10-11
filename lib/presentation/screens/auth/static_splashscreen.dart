import 'package:after_layout/after_layout.dart';
import 'package:anan_onboarding/routes/route_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StaticSplashScreen extends StatefulWidget {
  final String imagePath;
  final String? onNextScreen;
  final int? duration;
  final bool isSvg;
  final bool isLottie;
  const StaticSplashScreen({
    Key? key,
    this.imagePath = '',
    this.onNextScreen,
    this.duration = 2500,
    this.isSvg = false,
    this.isLottie = false,
  }) : super(key: key);

  @override
  _StaticSplashScreenState createState() => _StaticSplashScreenState();
}

class _StaticSplashScreenState extends State<StaticSplashScreen>
    with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(milliseconds: widget.duration!), () {
      Navigator.of(context).pushReplacementNamed(widget.onNextScreen!);
    });
  }

  String onNextScreen() {
    return RouteList.home;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.imagePath.startsWith('http')
                  ? Image.network(
                      widget.imagePath,
                      fit: BoxFit.contain,
                    )
                  : widget.isSvg
                      ? Center(
                          child: SvgPicture.asset(
                            widget.imagePath,
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                        )
                      : Center(
                          child: Image.asset(
                            widget.imagePath,
                            gaplessPlayback: true,
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.7,
                            fit: BoxFit.contain,
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
