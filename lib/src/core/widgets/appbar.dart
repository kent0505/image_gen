import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import '../utils.dart';
import 'button.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({
    super.key,
    this.title = '',
    this.right,
    this.child,
  });

  final String title;
  final Widget? right;
  final Widget? child;

  final appBarSize = Constants.appBarHeight;

  @override
  Size get preferredSize => Size.fromHeight(appBarSize);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Container(
      height: appBarSize + statusBarHeight,
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Row(
            children: [
              Button(
                minSize: appBarSize,
                onPressed: () {
                  try {
                    context.pop();
                  } catch (e) {
                    logger(e);
                  }
                },
                child: const Icon(Icons.arrow_back),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: AppFonts.w700,
                      height: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(width: appBarSize)
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            height: appBarSize,
            width: appBarSize,
            child: right,
          ),
        ],
      ),
    );
  }
}
