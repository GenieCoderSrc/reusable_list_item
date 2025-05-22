import 'package:flutter/material.dart';

class AppListTitle extends StatelessWidget {
  final String? title;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final bool border;
  final TextStyle? textStyle;

  const AppListTitle({
    super.key,
    this.title,
    this.trailing,
    this.onPressed,
    this.border = true,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: border
              ? Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  title!,
                  style: textStyle ?? Theme.of(context).textTheme.titleMedium,
                ),
              ),
            if (trailing != null)
            trailing ?? Container()
            // if (trailing != null)
            //   trailing.call()
          ],
        ),
      ),
    );
  }
}
