import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

enum SAlertStatus {
  info,
  danger,
  warning,
  success;

  const SAlertStatus();

  T when<T>({
    required final T Function() onInfo,
    required final T Function() onDanger,
    required final T Function() onWarning,
    required final T Function() onSuccess,
  }) => switch (this) {
    SAlertStatus.info => onInfo.call(),
    SAlertStatus.danger => onDanger.call(),
    SAlertStatus.warning => onWarning.call(),
    SAlertStatus.success => onSuccess.call(),
  };

  SIconData get defIcon => switch (this) {
    SAlertStatus.info => SIconsOutlined.check,
    SAlertStatus.danger => SIconsFilled.dangerTriangle,
    SAlertStatus.warning => SIconsFilled.shieldWarning,
    SAlertStatus.success => SIconsFilled.success,
  };
}

class SAlert extends StatelessWidget {
  const SAlert(this.text, this.status, {this.icon, this.hasBorder = false, super.key});

  final String text;
  final SAlertStatus status;
  final SIconData? icon;
  final bool hasBorder;

  @override
  Widget build(final BuildContext context) {
    final theme = context.theme;

    final color = status.when(
      onInfo: () => theme.colors.serviceColors.primary,
      onDanger: () => theme.colors.serviceColors.danger,
      onWarning: () => theme.colors.serviceColors.warning,
      onSuccess: () => theme.colors.serviceColors.success,
    );
    final bgColor = status.when(
      onInfo: () => theme.colors.serviceColors.primary.light,
      onDanger: () => theme.colors.serviceColors.danger.light,
      onWarning: () => theme.colors.serviceColors.warning.light,
      onSuccess: () => theme.colors.serviceColors.success.light,
    );

    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        // gradient: LinearGradient(colors: [color, theme.bgColors.secondary]),
        borderRadius: BorderRadius.circular(SRadii.s08),
      ),
      child: Container(
        padding: EdgeInsets.all(SSpacings.s08),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(SRadii.s08),
          border: hasBorder ? Border.all(color: color, width: 0.75) : null,
        ),
        child: Row(
          spacing: SSpacings.s08,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SIcon(icon: icon ?? status.defIcon, size: 20, color: color),
            ),
            Expanded(
              child: Text(
                text,
                style: theme.textStyles.body2(color: color),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
