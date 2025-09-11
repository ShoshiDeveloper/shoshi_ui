import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SAppBarTrailing {
  const SAppBarTrailing({required this.icon, this.onTap});
  final SIconData icon;
  final VoidCallback? onTap;
}

class SAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SAppBar({super.key, this.leading, this.onTapLeading, this.title, this.trailing})
    : isPop = false;
  const SAppBar.pop({super.key, this.leading, this.title, this.trailing})
    : onTapLeading = null,
      isPop = true;

  final SIconData? leading;
  final VoidCallback? onTapLeading;
  final String? title;
  final List<SAppBarTrailing>? trailing;

  final bool isPop;

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        color: context.theme.bgColors.primary,
        child: Row(
          spacing: SSpacings.s08,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 56,
              alignment: Alignment.centerLeft,
              child: leading != null || isPop
                  ? GestureDetector(
                      onTap: isPop ? context.pop : onTapLeading,
                      child: SIcon(icon: leading ?? SIconsOutlined.leftChevron),
                    )
                  : null,
            ),
            if (title != null)
              Center(
                child: Text(
                  title!,
                  style: context.theme.textStyles.t1(weight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            SizedBox(
              width: 56,
              child: trailing != null
                  ? Row(
                      spacing: SSpacings.s08,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: trailing!
                          .map(
                            (final e) => GestureDetector(
                              onTap: e.onTap,
                              child: SIcon(icon: e.icon),
                            ),
                          )
                          .toList(),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45);
}
