import 'package:flutter/material.dart' show IconData;
import 'package:shoshi_ui/shoshi_ui.dart';

sealed class SIconVariant {
  const SIconVariant();

  ///Icon from string with svg
  const factory SIconVariant.svg({required final String svg}) = SIconSVG._;

  ///Icon from this package
  const factory SIconVariant.package({required final SIcons? icon, final SIconStyles style}) =
      SIconPackage._;

  ///Icon from material library
  const factory SIconVariant.material({required final IconData icon}) = SIconMaterial._;

  T when<T>({
    required final T Function(String value) svg,
    required final T Function(SIcons? value, SIconStyles style) package,
    required final T Function(IconData value) material,
  });
}

final class SIconSVG extends SIconVariant {
  const SIconSVG._({required this.svg});

  final String svg;

  @override
  T when<T>({
    required final T Function(String value) svg,
    required final T Function(SIcons? value, SIconStyles style) package,
    required final T Function(IconData value) material,
  }) => svg(this.svg);
}

final class SIconPackage extends SIconVariant {
  const SIconPackage._({required this.icon, this.style = SIconStyles.outlined});

  final SIcons? icon;
  final SIconStyles style;
  @override
  T when<T>({
    required final T Function(String value) svg,
    required final T Function(SIcons? value, SIconStyles style) package,
    required final T Function(IconData value) material,
  }) => package(icon, style);
}

final class SIconMaterial extends SIconVariant {
  const SIconMaterial._({required this.icon});

  final IconData icon;

  @override
  T when<T>({
    required final T Function(String value) svg,
    required final T Function(SIcons? value, SIconStyles style) package,
    required final T Function(IconData value) material,
  }) => material(icon);
}
