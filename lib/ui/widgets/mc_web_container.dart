import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class McWebContainer extends StatelessWidget {
  const McWebContainer({super.key, required this.child});

  final Widget child;

  double screenWidth(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    var size = w * .4;

    if (w > 600 && size > 315) return size;

    return double.infinity;
  }

  @override
  Widget build(BuildContext context) {
    try {
      if (!kIsWeb) return child;

      // limit screen size on web
      return Center(
        child: ClipRect(
          child: SizedBox(
            width: screenWidth(context),
            child: child,
          ),
        ),
      );
    } catch (e) {
      return child;
    }
  }
}
