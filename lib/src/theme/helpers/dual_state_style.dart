class DualStateStyle<T> {
  const DualStateStyle(this.truth, this.lie);
  final T truth;
  final T lie;

  T of(final bool condition) => condition ? truth : lie;
}
