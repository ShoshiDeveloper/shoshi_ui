import 'dart:async';
import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';
import 'package:shoshi_ui/src/extension/context_x.dart';

class SPageIndicator extends StatefulWidget {
  const SPageIndicator({required this.count, required this.currentIndex, super.key})
    : assert(count > currentIndex);

  final int count;
  final int currentIndex;

  @override
  State<SPageIndicator> createState() => _SPageIndicatorState();
}

class _SPageIndicatorState extends State<SPageIndicator> {
  @override
  Widget build(final BuildContext context) {
    return AnimatedContainer(
      duration: Durations.medium1,
      child: Row(
        spacing: 4,
        children: List.generate(widget.count, (final index) {
          final current = index == widget.currentIndex;
          final before = index < widget.currentIndex;

          return Container(
            width: current ? 16 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: current || before
                  ? context.theme.colors.service.primary
                  : context.theme.colors.background.secondary,
              borderRadius: BorderRadius.circular(SRadii.max),
            ),
          );
        }),
      ),
    );
  }
}

class LightController<T> extends ChangeNotifier {
  LightController(this.value);

  T value;

  void emit(final T value) {
    this.value = value;
    notifyListeners();
  }

  void listen(final void Function(T value) listener) => addListener(() {
    listener(value);
  });
}

class LightControllerBuilder<T> extends StatefulWidget {
  const LightControllerBuilder({required this.listenable, required this.builder, super.key});

  final LightController<T> listenable;
  final Widget Function(BuildContext context, T value) builder;

  @override
  State<LightControllerBuilder> createState() => _LightControllerBuilderState<T>();
}

class _LightControllerBuilderState<T> extends State<LightControllerBuilder> {
  @override
  void initState() {
    super.initState();

    _subscribe();
  }

  @override
  Widget build(final BuildContext context) {
    return widget.builder(context, widget.listenable.value);
  }

  void _subscribe() {
    widget.listenable.listen((final value) {
      setState(() {});
    });
  }
}
