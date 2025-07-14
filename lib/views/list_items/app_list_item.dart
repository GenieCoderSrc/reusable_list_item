import 'package:flutter/material.dart';

class AppListTitle extends StatelessWidget {
  const AppListTitle({
    super.key,
    this.title,
    this.subtitle,
    this.trailing,
    this.onPressed,
    this.border = true,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
  });

  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onPressed;

  final bool border;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border:
              border
                  ? Border(bottom: BorderSide(color: theme.dividerColor))
                  : null,
        ),
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: titleTextStyle ?? theme.textTheme.titleMedium,
                    ),
                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        subtitle!,
                        style:
                            subtitleTextStyle ??
                            theme.textTheme.bodySmall?.copyWith(
                              color: theme.hintColor,
                            ),
                      ),
                    ),
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
