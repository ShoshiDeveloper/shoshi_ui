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
}

class SAlert extends StatelessWidget {
  const SAlert(this.text, this.status, {this.icon, super.key});

  final String text;
  final SAlertStatus status;
  final SIconsFilled? icon;

  @override
  Widget build(final BuildContext context) {
    final theme = context.theme;

    final color = status.when(
      onInfo: () => theme.serviceColors.primary,
      onDanger: () => theme.serviceColors.danger,
      onWarning: () => theme.serviceColors.warning,
      onSuccess: () => theme.serviceColors.success,
    );

    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, theme.bgColors.secondary]),
        borderRadius: BorderRadius.circular(SRadii.s08),
      ),
      child: Container(
        padding: EdgeInsets.all(SSpacings.s08),
        decoration: BoxDecoration(
          color: theme.bgColors.primary,
          borderRadius: BorderRadius.circular(SRadii.s08),
        ),
        child: IntrinsicHeight(
          child: Row(
            spacing: SSpacings.s08,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(minWidth: 4),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(SRadii.s04),
                ),
                child: icon != null
                    ? Center(
                        child: SIcon.filled(
                          icon: icon!,
                          size: 16,
                          color: theme.textColors.inversePrimary,
                        ),
                      )
                    : null,
              ),
              Expanded(
                child: Text(
                  text,
                  style: theme.textStyles.body2(
                    color: theme.textColors.primary,
                    weight: FontWeight.w500,
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
