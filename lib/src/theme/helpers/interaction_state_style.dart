import 'package:shoshi_ui/shoshi_ui.dart';

class InteractionStateStyle<T> {
  const InteractionStateStyle(this.enabled, this.pressed, this.disabled);
  final T enabled;
  final T pressed;
  final T disabled;

  T of(final InteractionBuilderStates state) => switch (state) {
    InteractionBuilderStates.enabled => enabled,
    InteractionBuilderStates.pressed => pressed,
    InteractionBuilderStates.disabled => disabled,
  };
}
