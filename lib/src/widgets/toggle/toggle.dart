import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class SSWitchStyle {}

class SToggle extends StatefulWidget {
  const SToggle({required this.value, this.isDisabled = false, this.onChanged, super.key});

  final bool value;

  final ValueChanged<bool>? onChanged;

  final bool isDisabled;

  @override
  State<SToggle> createState() => _SToggleState();
}

class _SToggleState extends State<SToggle> {
  late final style = STheme.of(context).toggleStyle;

  // late final notifier = ValueNotifier<bool>(widget.value);

  @override
  void didUpdateWidget(final SToggle oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if (notifier.value != widget.value) {
    //   notifier.value = widget.value;
    // }
  }

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: widget.isDisabled
          ? null
          : () {
              // notifier.value = !notifier.value;
              widget.onChanged?.call(!widget.value);
            },
      child: Container(
        width: 42,
        height: 26,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: widget.isDisabled
              ? style.bgDisabled.of(widget.value)
              : style.bgEnabled.of(widget.value),
          borderRadius: BorderRadius.circular(SRadii.max),
        ),
        child: AnimatedAlign(
          alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeIn,
          child: Container(
            decoration: BoxDecoration(
              color: widget.isDisabled
                  ? style.handleDisabled.of(widget.value)
                  : style.handleEnabled.of(widget.value),
              borderRadius: BorderRadius.circular(SRadii.max),
            ),
            height: 22,
            width: 22,
          ),
        ),
      ),
    );
  }
}
