import 'package:flutter/material.dart';
import 'package:m3_floating_toolbar/m3_floating_toolbar_action.dart';

/// Material Design 3 floating toolbar container height.
const double _kContainerHeight = 64;

/// Material Design 3 floating toolbar spacing between the toolbar and an
/// adjacent floating action button.
const double _kToolbarToFabGap = 8;

/// Minimum accessible touch target size for toolbar actions.
const double _kMinTouchTargetSize = 48;

/// Default Material Design 3 icon size for toolbar actions.
const double _kIconSize = 24;

/// Color configurations defined by the Material Design 3 toolbar specs.
enum M3FloatingToolbarVariant {
  /// Surface container based coloring (default).
  standard,

  /// Primary container based coloring.
  vibrant,
}

/// A floating pill-style Material Design 3 toolbar.
///
/// Displays a row of actions in a rounded container following the Material
/// Design 3 toolbar specs. Supports mixed usage of icon-only and labeled
/// buttons.
///
/// ## Usage
///
/// ```dart
/// M3FloatingToolbar(
///   actions: [
///     M3FloatingToolbarAction(
///       icon: Icons.share,
///       semanticLabel: 'Share post',
///       tooltip: 'Share',
///       onPressed: () => _sharePost(),
///     ),
///     M3FloatingToolbarAction(
///       icon: Icons.bookmark,
///       label: 'Save',
///       semanticLabel: 'Bookmark post',
///       onPressed: () => _bookmarkPost(),
///     ),
///   ],
/// )
/// ```
///
/// ## FloatingActionButton Integration
///
/// An optional [floatingActionButton] can be provided to display alongside
/// the toolbar actions. When present, the FAB will be positioned at the end
/// of the toolbar after all actions, separated by the configured spacing.
///
/// ```dart
/// M3FloatingToolbar(
///   actions: [...],
///   floatingActionButton: FloatingActionButton(
///     onPressed: () => _primaryAction(),
///     child: Icon(Icons.add),
///   ),
/// )
/// ```
///
/// ## Empty Actions Contract
///
/// If [actions] is empty:
/// - In debug mode: Throws an assertion error
/// - In release mode: Returns [SizedBox.shrink] (no visual output)
class M3FloatingToolbar extends StatelessWidget {
  const M3FloatingToolbar({
    required this.actions,
    this.direction = Axis.horizontal,
    this.variant = M3FloatingToolbarVariant.standard,
    this.elevation,
    this.internalPadding = const EdgeInsets.all(8),
    this.spacing = 4,
    this.color,
    this.foregroundColor,
    this.floatingActionButton,
    super.key,
    this.toolbarKey,
  });

  /// List of actions to display in the toolbar
  final List<M3FloatingToolbarAction> actions;

  /// Layout direction of the toolbar (default: horizontal)
  final Axis direction;

  /// Color configuration of the toolbar (default: standard)
  final M3FloatingToolbarVariant variant;

  /// Elevation of the toolbar container.
  ///
  /// Defaults to 0, or 1 when a [floatingActionButton] is provided.
  final double? elevation;

  /// Internal padding inside the toolbar (default: 8 on all sides)
  final EdgeInsets internalPadding;

  /// Spacing between action buttons (default: 4)
  final double spacing;

  /// Background color override.
  ///
  /// Defaults to the color role of the selected [variant]: surfaceContainer
  /// for [M3FloatingToolbarVariant.standard] and primaryContainer for
  /// [M3FloatingToolbarVariant.vibrant].
  final Color? color;

  /// Foreground color override.
  ///
  /// Defaults to the content color role of the selected [variant]: onSurface
  /// for [M3FloatingToolbarVariant.standard] and onPrimaryContainer for
  /// [M3FloatingToolbarVariant.vibrant].
  final Color? foregroundColor;

  /// Optional key for the toolbar container
  final Key? toolbarKey;

  /// Optional FloatingActionButton to display at the end of the toolbar.
  ///
  /// When provided, the FAB will be positioned after all actions with
  /// the configured spacing. The FAB maintains its standard appearance
  /// and behavior while being integrated into the toolbar layout.
  final FloatingActionButton? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    // Handle empty actions: assert in debug, return empty in release
    assert(
      actions.isNotEmpty,
      'M3FloatingToolbar requires at least one action',
    );
    if (actions.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final backgroundColor = color ?? _containerColor(colorScheme);
    final textColor = foregroundColor ?? _contentColor(colorScheme);
    final resolvedElevation =
        elevation ?? (floatingActionButton == null ? 0.0 : 1.0);
    final isHorizontal = direction == Axis.horizontal;

    final children = <Widget>[
      for (int i = 0; i < actions.length; i++) ...[
        if (i > 0)
          SizedBox(
            width: isHorizontal ? spacing : null,
            height: isHorizontal ? null : spacing,
          ),
        _buildActionButton(actions[i], textColor, colorScheme),
      ],
    ];

    final toolbarWidget = Material(
      key: toolbarKey,
      elevation: resolvedElevation,
      color: backgroundColor,
      shape: const StadiumBorder(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: isHorizontal ? 0 : _kContainerHeight,
          minHeight: isHorizontal ? _kContainerHeight : 0,
        ),
        child: Padding(
          padding: internalPadding,
          child: isHorizontal
              ? Row(mainAxisSize: MainAxisSize.min, children: children)
              : Column(mainAxisSize: MainAxisSize.min, children: children),
        ),
      ),
    );

    // If no FAB is provided, return just the toolbar
    if (floatingActionButton == null) {
      return toolbarWidget;
    }

    // Position FAB outside the pill shape
    return isHorizontal
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              toolbarWidget,
              const SizedBox(width: _kToolbarToFabGap),
              floatingActionButton!,
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              toolbarWidget,
              const SizedBox(height: _kToolbarToFabGap),
              floatingActionButton!,
            ],
          );
  }

  Color _containerColor(ColorScheme colorScheme) => switch (variant) {
    M3FloatingToolbarVariant.standard => colorScheme.surfaceContainer,
    M3FloatingToolbarVariant.vibrant => colorScheme.primaryContainer,
  };

  Color _contentColor(ColorScheme colorScheme) => switch (variant) {
    M3FloatingToolbarVariant.standard => colorScheme.onSurface,
    M3FloatingToolbarVariant.vibrant => colorScheme.onPrimaryContainer,
  };

  Color _selectedContainerColor(ColorScheme colorScheme) => switch (variant) {
    M3FloatingToolbarVariant.standard => colorScheme.secondaryContainer,
    M3FloatingToolbarVariant.vibrant => colorScheme.surfaceContainer,
  };

  Color _selectedContentColor(ColorScheme colorScheme) => switch (variant) {
    M3FloatingToolbarVariant.standard => colorScheme.onSecondaryContainer,
    M3FloatingToolbarVariant.vibrant => colorScheme.onSurface,
  };

  Widget _buildActionButton(
    M3FloatingToolbarAction action,
    Color textColor,
    ColorScheme colorScheme,
  ) {
    final backgroundColor = action.selected
        ? _selectedContainerColor(colorScheme)
        : null;
    final contentColor = action.selected
        ? _selectedContentColor(colorScheme)
        : textColor;

    // If action has a label, use TextButton.icon
    if (action.label != null) {
      final button = TextButton.icon(
        onPressed: action.onPressed,
        icon: Icon(action.icon, size: _kIconSize),
        label: Text(action.label!),
        style: TextButton.styleFrom(
          foregroundColor: contentColor,
          backgroundColor: backgroundColor,
          // Meets the minimum accessible touch target height.
          minimumSize: const Size(0, _kMinTouchTargetSize),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      );

      // Wrap in Semantics for accessibility
      return Semantics(
        label: action.semanticLabel,
        button: true,
        selected: action.selected,
        child: action.tooltip != null
            ? Tooltip(message: action.tooltip!, child: button)
            : button,
      );
    }

    // Icon-only button
    final iconButton = IconButton(
      onPressed: action.onPressed,
      icon: Icon(action.icon, size: _kIconSize),
      color: contentColor,
      constraints: const BoxConstraints(
        minWidth: _kMinTouchTargetSize,
        minHeight: _kMinTouchTargetSize,
      ),
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );

    // Always wrap icon buttons in Tooltip and Semantics
    return Tooltip(
      message: action.tooltip ?? action.semanticLabel,
      child: Semantics(
        label: action.semanticLabel,
        button: true,
        selected: action.selected,
        child: iconButton,
      ),
    );
  }
}
