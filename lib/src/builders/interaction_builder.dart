import 'package:flutter/material.dart';

enum SInteractionBuilderStates {
  enabled,
  pressed,
  disabled,
  focused,
  hovered;

  const SInteractionBuilderStates();

  T when<T>({
    required final T enabled,
    required final T pressed,
    required final T disabled,
    final T? focused,
    final T? hovered,
  }) => switch (this) {
    SInteractionBuilderStates.enabled => enabled,
    SInteractionBuilderStates.pressed => pressed,
    SInteractionBuilderStates.disabled => disabled,
    SInteractionBuilderStates.focused => focused ?? enabled,
    SInteractionBuilderStates.hovered => hovered ?? enabled,
  };
}

class SInteractionBuilder extends StatefulWidget {
  const SInteractionBuilder({
    this.builder,
    this.listener,
    this.isDisabled = false,
    this.onTap,
    this.focus,
    super.key,
  });

  final Widget Function(BuildContext context, SInteractionBuilderStates state)?
  builder;
  final void Function(BuildContext context, SInteractionBuilderStates state)?
  listener;
  final VoidCallback? onTap;
  final bool isDisabled;
  final FocusNode? focus;

  @override
  State<SInteractionBuilder> createState() => _SInteractionBuilderState();
}

class _SInteractionBuilderState extends State<SInteractionBuilder> {
  late SInteractionBuilderStates _state = widget.isDisabled
      ? SInteractionBuilderStates.disabled
      : SInteractionBuilderStates.enabled;

  bool isHovered = false;
  bool get isFocused => widget.focus?.hasFocus ?? false;

  void setStateOnFocusChange(final bool value) {
    final state = value
        ? SInteractionBuilderStates.focused
        : SInteractionBuilderStates.enabled;
    setState(() {
      _state = state;
    });
  }

  void setStateOnHovered(final bool value) {
    final state = value
        ? SInteractionBuilderStates.hovered
        : (isFocused
              ? SInteractionBuilderStates.focused
              : SInteractionBuilderStates.enabled);
    setState(() {
      isHovered = value;
      _state = state;
    });
  }

  void setStateOnPressed(final bool value) {
    final state = value
        ? SInteractionBuilderStates.pressed
        : (isHovered
              ? SInteractionBuilderStates.hovered
              : (isFocused
                    ? SInteractionBuilderStates.focused
                    : SInteractionBuilderStates.enabled));

    setState(() {
      _state = state;
    });
  }

  @override
  Widget build(final BuildContext context) {
    if (widget.isDisabled) {
      return widget.builder?.call(context, _state) ?? SizedBox.shrink();
    }

    return Focus(
      focusNode: widget.focus,
      onFocusChange: setStateOnFocusChange,
      child: MouseRegion(
        onEnter: (_) => setStateOnHovered(true),
        onHover: (_) => setStateOnHovered(true),
        onExit: (_) => setStateOnHovered(false),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: widget.onTap,
          onTapDown: (_) => setStateOnPressed(true),
          onTapUp: (_) => setStateOnPressed(false),
          onTapCancel: () => setStateOnPressed(false),
          child: widget.builder?.call(context, _state),
        ),
      ),
    );
  }
}

class SInteractionBuilderListener extends StatefulWidget {
  const SInteractionBuilderListener({
    required this.child,
    this.listener,
    this.isDisabled = false,
    this.onTap,
    this.focus,
    super.key,
  });

  final Widget child;
  final void Function(BuildContext context, SInteractionBuilderStates state)?
  listener;
  final VoidCallback? onTap;
  final bool isDisabled;
  final FocusNode? focus;

  @override
  State<SInteractionBuilderListener> createState() =>
      _SInteractionBuilderListenerState();
}

class _SInteractionBuilderListenerState
    extends State<SInteractionBuilderListener> {
  bool isHovered = false;
  bool get isFocused => widget.focus?.hasFocus ?? false;

  SInteractionBuilderStates getStateOnFocusChange(final bool value) => value
      ? SInteractionBuilderStates.focused
      : SInteractionBuilderStates.enabled;

  SInteractionBuilderStates getStateOnHovered(final bool value) {
    isHovered = value;
    return value
        ? SInteractionBuilderStates.hovered
        : (isFocused
              ? SInteractionBuilderStates.focused
              : SInteractionBuilderStates.enabled);
  }

  SInteractionBuilderStates getStateOnPressed(final bool value) => value
      ? SInteractionBuilderStates.pressed
      : (isHovered
            ? SInteractionBuilderStates.hovered
            : (isFocused
                  ? SInteractionBuilderStates.focused
                  : SInteractionBuilderStates.enabled));

  @override
  Widget build(final BuildContext context) {
    if (widget.isDisabled) return widget.child;

    return Focus(
      focusNode: widget.focus,
      onFocusChange: (final value) =>
          widget.listener?.call(context, getStateOnFocusChange(value)),
      child: MouseRegion(
        onEnter: (_) => widget.listener?.call(context, getStateOnHovered(true)),
        onHover: (_) => widget.listener?.call(context, getStateOnHovered(true)),
        onExit: (_) => widget.listener?.call(context, getStateOnHovered(false)),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: widget.onTap,
          onTapDown: (_) =>
              widget.listener?.call(context, getStateOnPressed(true)),
          onTapUp: (_) =>
              widget.listener?.call(context, getStateOnPressed(false)),
          onTapCancel: () =>
              widget.listener?.call(context, getStateOnPressed(false)),
          child: widget.child,
        ),
      ),
    );
  }
}
