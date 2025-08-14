enum InteractionBuilderStates {
  enabled,
  pressed,
  disabled;

  const InteractionBuilderStates();

  T when<T>({required final T enabled, required final T pressed, required final T disabled}) =>
      switch (this) {
        InteractionBuilderStates.enabled => enabled,
        InteractionBuilderStates.pressed => pressed,
        InteractionBuilderStates.disabled => disabled,
      };
}
