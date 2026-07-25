import 'package:flutter/material.dart';

/// Action configuration for a floating toolbar button.
///
/// Supports both icon-only and labeled actions with full accessibility.
class M3FloatingToolbarAction {
  const M3FloatingToolbarAction({
    required this.semanticLabel,
    required this.onPressed,
    this.icon,
    this.label,
    this.tooltip,
    this.selected = false,
  }) : assert(
         icon != null || label != null,
         'M3FloatingToolbarAction requires an icon, a label, or both',
       );

  /// Optional icon to display for this action
  ///
  /// If null, the action displays as a label-only button and [label] must be
  /// provided.
  final IconData? icon;

  /// Optional text label to display alongside the icon
  /// If null, displays as icon-only button
  final String? label;

  /// Semantic label for accessibility (required)
  final String semanticLabel;

  /// Optional tooltip text to show on hover/long press
  final String? tooltip;

  /// Whether this action is currently selected (default: false)
  ///
  /// Selected actions are rendered as toggle buttons using the selected
  /// color roles of the toolbar's variant.
  final bool selected;

  /// Callback when the action is pressed
  final VoidCallback onPressed;
}
