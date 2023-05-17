import 'package:flutter/material.dart';

class WebConstrainedBox extends StatelessWidget {
  const WebConstrainedBox({Key? key, required this.child}) : super(key: key);

  final Widget child;

  static BoxConstraints currentConstraint =
      const BoxConstraints(maxWidth: maxPageWidth);
  static const double maxPageWidth = 480;
  static const double minPageHeight = 600;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return MediaQuery(
      data: mediaQueryData.copyWith(
        textScaleFactor: mediaQueryData.textScaleFactor.clamp(0.7, 1.8),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.antiAlias,
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            color: const Color(0xffd0c6d4),
          ),
          Center(
            child: ConstrainedBox(
              constraints: currentConstraint.copyWith(
                  maxHeight: MediaQuery.of(context).size.height),
              child: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
