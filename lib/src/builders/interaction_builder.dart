import 'package:flutter/material.dart';
import 'package:shoshi_ui/src/consts/interaction_builder_states.dart';

class SInteractionBuilder extends StatefulWidget {
  const SInteractionBuilder({
    required this.builder,
    this.isDisabled = false,
    this.onTap,
    super.key,
  });

  final Widget Function(BuildContext context, InteractionBuilderStates state) builder;
  final VoidCallback? onTap;
  final bool isDisabled;

  @override
  State<SInteractionBuilder> createState() => _SInteractionBuilderState();
}

class _SInteractionBuilderState extends State<SInteractionBuilder> {
  late InteractionBuilderStates _state = widget.isDisabled
      ? InteractionBuilderStates.disabled
      : InteractionBuilderStates.enabled;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: widget.isDisabled ? null : widget.onTap,
      onTapDown: (_) =>
          widget.isDisabled ? null : setState(() => _state = InteractionBuilderStates.pressed),
      onTapUp: (_) =>
          widget.isDisabled ? null : setState(() => _state = InteractionBuilderStates.enabled),
      onTapCancel: () =>
          widget.isDisabled ? null : setState(() => _state = InteractionBuilderStates.enabled),
      child: widget.builder.call(context, _state),
    );
  }
}
