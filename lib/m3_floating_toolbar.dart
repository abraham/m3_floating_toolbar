import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:m3_floating_toolbar/m3_floating_toolbar_action.dart';

/// A floating pill-style Material Design 3 toolbar.
///
/// Displays a row of actions in a rounded container with primaryContainer
/// theming. Supports mixed usage of icon-only and labeled buttons.
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
    this.elevation = 2,
    this.internalPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.spacing = 8,
    this.color,
    this.foregroundColor,
    this.floatingActionButton,
    super.key,
    this.toolbarKey,
  });

  /// List of actions to display in the toolbar
  final List<M3FloatingToolbarAction> actions;

  /// Elevation of the toolbar container (default: 2)
  final double elevation;

  /// Internal padding inside the toolbar (default: horizontal 16, vertical 8)
  final EdgeInsets internalPadding;

  /// Spacing between action buttons (default: 8)
  final double spacing;

  /// Background color override (defaults to theme's primaryContainer)
  final Color? color;

  /// Foreground color override (defaults to theme's onPrimaryContainer)
  final Color? foregroundColor;

  /// Optional key for the toolbar container
  final Key? toolbarKey;

  /// Optional FloatingActionButton to display at the end of the toolbar.
  ///
  /// When provided, the FAB will be positioned after all actions with
  /// the configured spacing. The FAB maintains its standard appearance
  /// and behavior while being integrated into the toolbar layout.
  final FloatingActionButton? floatingActionButton;

  @Preview(name: 'M3FloatingToolbar preview')
  factory M3FloatingToolbar.preview() => M3FloatingToolbar(
    actions: [
      M3FloatingToolbarAction(
        icon: Icons.share,
        semanticLabel: 'Share post',
        tooltip: 'Share',
        // ignore: no-empty-block
        onPressed: () {},
      ),
      M3FloatingToolbarAction(
        icon: Icons.bookmark,
        label: 'Save',
        semanticLabel: 'Bookmark post',
        // ignore: no-empty-block
        onPressed: () {},
      ),
    ],
  );

  @Preview(name: 'M3FloatingToolbar with FAB')
  factory M3FloatingToolbar.previewWithFab() => M3FloatingToolbar(
    actions: [
      M3FloatingToolbarAction(
        icon: Icons.reply,
        semanticLabel: 'Reply',
        tooltip: 'Reply',
        // ignore: no-empty-block
        onPressed: () {},
      ),
      M3FloatingToolbarAction(
        icon: Icons.favorite,
        semanticLabel: 'Like',
        tooltip: 'Like',
        // ignore: no-empty-block
        onPressed: () {},
      ),
      M3FloatingToolbarAction(
        icon: Icons.repeat,
        semanticLabel: 'Repost',
        tooltip: 'Repost',
        // ignore: no-empty-block
        onPressed: () {},
      ),
    ],
    floatingActionButton: FloatingActionButton(
      // ignore: no-empty-block
      onPressed: () {},
      child: const Icon(Icons.add),
    ),
  );

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

    final backgroundColor = color ?? colorScheme.primaryContainer;
    final textColor = foregroundColor ?? colorScheme.onPrimaryContainer;

    final toolbarWidget = Material(
      key: toolbarKey,
      elevation: elevation,
      color: backgroundColor,
      shape: const StadiumBorder(),
      child: Padding(
        padding: internalPadding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < actions.length; i++) ...[
              if (i > 0) SizedBox(width: spacing),
              _buildActionButton(actions[i], textColor),
            ],
          ],
        ),
      ),
    );

    // If no FAB is provided, return just the toolbar
    if (floatingActionButton == null) {
      return toolbarWidget;
    }

    // Position FAB outside the pill shape
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        toolbarWidget,
        SizedBox(width: spacing),
        floatingActionButton!,
      ],
    );
  }

  Widget _buildActionButton(M3FloatingToolbarAction action, Color textColor) {
    // If action has a label, use TextButton.icon
    if (action.label != null) {
      final button = TextButton.icon(
        onPressed: action.onPressed,
        icon: Icon(action.icon),
        label: Text(action.label!),
        style: TextButton.styleFrom(
          foregroundColor: textColor,
          minimumSize: const Size(0, 32), // Minimal height for accessibility
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      );

      // Wrap in Semantics for accessibility
      return Semantics(
        label: action.semanticLabel,
        button: true,
        child: action.tooltip != null
            ? Tooltip(message: action.tooltip!, child: button)
            : button,
      );
    }

    // Icon-only button
    final iconButton = IconButton(
      onPressed: action.onPressed,
      icon: Icon(action.icon),
      color: textColor,
      constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
      style: IconButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );

    // Always wrap icon buttons in Tooltip and Semantics
    return Tooltip(
      message: action.tooltip ?? action.semanticLabel,
      child: Semantics(
        label: action.semanticLabel,
        button: true,
        child: iconButton,
      ),
    );
  }
}
