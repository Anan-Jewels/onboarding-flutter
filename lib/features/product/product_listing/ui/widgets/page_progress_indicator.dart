import 'package:flutter/material.dart';

class PageProgressIndicator extends StatelessWidget {
  const PageProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.0,
      width: MediaQuery.of(context).size.width - 16,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 8.0,
          width: (MediaQuery.of(context).size.width - 16) * .3,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}
