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

  SIconVariant get defIcon => switch (this) {
    SAlertStatus.info => SIconVariant.package(icon: SIcons.check),
    SAlertStatus.danger => SIconVariant.package(
      icon: SIcons.dangerTriangle,
      style: SIconStyles.filled,
    ),
    SAlertStatus.warning => SIconVariant.package(
      icon: SIcons.shieldWarning,
      style: SIconStyles.filled,
    ),
    SAlertStatus.success => SIconVariant.package(icon: SIcons.check, style: SIconStyles.filled),
  };

  ///Костыль
  SIconStyles get defIconStyles => switch (this) {
    SAlertStatus.info => SIconStyles.outlined,
    SAlertStatus.danger => SIconStyles.filled,
    SAlertStatus.warning => SIconStyles.filled,
    SAlertStatus.success => SIconStyles.filled,
  };
}

class SAlert extends StatelessWidget {
  const SAlert(this.text, this.status, {this.icon, this.hasBorder = false, super.key});

  final String text;
  final SAlertStatus status;
  final SIconVariant? icon;
  final bool hasBorder;

  @override
  Widget build(final BuildContext context) {
    final theme = context.theme;

    final color = status.when(
      onInfo: () => theme.colors.service.primary,
      onDanger: () => theme.colors.service.danger,
      onWarning: () => theme.colors.service.warning,
      onSuccess: () => theme.colors.service.success,
    );
    final bgColor = status.when(
      onInfo: () => theme.colors.service.primary.light,
      onDanger: () => theme.colors.service.danger.light,
      onWarning: () => theme.colors.service.warning.light,
      onSuccess: () => theme.colors.service.success.light,
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
                style: theme.styles.body2(color: color),
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
