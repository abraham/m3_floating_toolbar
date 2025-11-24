import 'package:flutter/material.dart';

/// Action configuration for a floating toolbar button.
///
/// Supports both icon-only and labeled actions with full accessibility.
class M3FloatingToolbarAction {
  const M3FloatingToolbarAction({
    required this.icon,
    required this.semanticLabel,
    required this.onPressed,
    this.label,
    this.tooltip,
  });

  /// The icon to display for this action
  final IconData icon;

  /// Optional text label to display alongside the icon
  /// If null, displays as icon-only button
  final String? label;

  /// Semantic label for accessibility (required)
  final String semanticLabel;

  /// Optional tooltip text to show on hover/long press
  final String? tooltip;

  /// Callback when the action is pressed
  final VoidCallback onPressed;
}
