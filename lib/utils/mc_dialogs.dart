import 'package:bw_home_bridge/ui/widgets/mc_button.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class McDialogs {
  McDialogs._();

  static Future<T?> leftSideBarDialog<T>(
    BuildContext context, {
    required Widget child,
    double width = 300,
    EdgeInsetsGeometry? padding,
    void Function()? onConfirm,
    void Function()? onDiscard,
  }) async {
    //
    padding ??= EdgeInsets.all(
      20,
    );
    return showGeneralDialog(
      barrierLabel: 'Barrier',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Material(
            child: Container(
              width: width,
              decoration: const BoxDecoration(
                color: McColors.secondary2,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      padding: padding,
                      child: child,
                    ),
                  ),
                  if (onConfirm != null)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: McColors.secondary2,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              McButton(
                                'Add',
                                textColor: McColors.white,
                                color: McColors.primary,
                                onPressed: onConfirm,
                              ),
                              McButton(
                                'Discard',
                                textColor: McColors.white,
                                color: Colors.transparent,
                                onPressed: () {
                                  if (onDiscard != null) onDiscard();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation1, animation2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(-1, 0), end: const Offset(0, 0))
              .animate(animation1),
          child: child,
        );
      },
    );
  }
}
