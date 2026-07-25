import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:m3_floating_toolbar/m3_floating_toolbar_action.dart';

Widget m3FloatingToolbarBottomCenterPreviewWrapper(Widget child) {
  return MaterialApp(
    home: SizedBox.expand(
      child: Scaffold(
        body: SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: child,
            ),
          ),
        ),
      ),
    ),
  );
}

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

  @Preview(
    name: 'M3FloatingToolbar preview',
    size: Size(390, 400),
    wrapper: m3FloatingToolbarBottomCenterPreviewWrapper,
  )
  factory M3FloatingToolbar.preview() => M3FloatingToolbar(
    actions: [
      M3FloatingToolbarAction(
        icon: Icons.home,
        semanticLabel: 'Home',
        tooltip: 'Home',
        // ignore: no-empty-block
        onPressed: () {},
      ),
      M3FloatingToolbarAction(
        icon: Icons.explore,
        label: 'Explore',
        semanticLabel: 'Explore',
        // ignore: no-empty-block
        onPressed: () {},
      ),
    ],
  );

  @Preview(
    name: 'M3FloatingToolbar with FAB',
    size: Size(390, 400),
    wrapper: m3FloatingToolbarBottomCenterPreviewWrapper,
  )
  factory M3FloatingToolbar.previewWithFab() => M3FloatingToolbar(
    actions: [
      M3FloatingToolbarAction(
        icon: Icons.home,
        semanticLabel: 'Home',
        tooltip: 'Home',
        // ignore: no-empty-block
        onPressed: () {},
      ),
      M3FloatingToolbarAction(
        icon: Icons.explore,
        semanticLabel: 'Explore',
        tooltip: 'Explore',
        // ignore: no-empty-block
        onPressed: () {},
      ),
      M3FloatingToolbarAction(
        icon: Icons.person,
        semanticLabel: 'Profile',
        tooltip: 'Profile',
        // ignore: no-empty-block
        onPressed: () {},
      ),
    ],
    floatingActionButton: FloatingActionButton(
      // ignore: no-empty-block
      onPressed: () {},
      child: const Icon(Icons.add_box),
    ),
  );

  @Preview(
    name: 'M3FloatingToolbar all icons',
    size: Size(390, 400),
    wrapper: m3FloatingToolbarBottomCenterPreviewWrapper,
  )
  factory M3FloatingToolbar.previewAllIcons() => M3FloatingToolbar(
    actions: [
      M3FloatingToolbarAction(
        icon: Icons.home,
        semanticLabel: 'Home',
        tooltip: 'Home',
        // ignore: no-empty-block
        onPressed: () {},
      ),
      M3FloatingToolbarAction(
        icon: Icons.explore,
        semanticLabel: 'Explore',
        tooltip: 'Explore',
        // ignore: no-empty-block
        onPressed: () {},
      ),
      M3FloatingToolbarAction(
        icon: Icons.add_box,
        semanticLabel: 'Post',
        tooltip: 'Post',
        // ignore: no-empty-block
        onPressed: () {},
      ),
      M3FloatingToolbarAction(
        icon: Icons.notifications,
        semanticLabel: 'Notifications',
        tooltip: 'Notifications',
        // ignore: no-empty-block
        onPressed: () {},
      ),
      M3FloatingToolbarAction(
        icon: Icons.person,
        semanticLabel: 'Profile',
        tooltip: 'Profile',
        // ignore: no-empty-block
        onPressed: () {},
      ),
    ],
  );

  @Preview(
    name: 'M3FloatingToolbar all icons with text',
    size: Size(390, 400),
    wrapper: m3FloatingToolbarBottomCenterPreviewWrapper,
  )
  factory M3FloatingToolbar.previewAllIconsWithText() => M3FloatingToolbar(
    actions: [
      M3FloatingToolbarAction(
        icon: Icons.home,
        label: 'Home',
        semanticLabel: 'Home',
        tooltip: 'Home',
        // ignore: no-empty-block
        onPressed: () {},
      ),
      M3FloatingToolbarAction(
        icon: Icons.explore,
        label: 'Explore',
        semanticLabel: 'Explore',
        tooltip: 'Explore',
        // ignore: no-empty-block
        onPressed: () {},
      ),
      M3FloatingToolbarAction(
        icon: Icons.person,
        label: 'Profile',
        semanticLabel: 'Profile',
        tooltip: 'Profile',
        // ignore: no-empty-block
        onPressed: () {},
      ),
    ],
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

    final backgroundColor = color ?? _containerColor(colorScheme);
    final textColor = foregroundColor ?? _contentColor(colorScheme);
    final resolvedElevation =
        elevation ?? (floatingActionButton == null ? 0.0 : 1.0);

    final toolbarWidget = Material(
      key: toolbarKey,
      elevation: resolvedElevation,
      color: backgroundColor,
      shape: const StadiumBorder(),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: _kContainerHeight),
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
        const SizedBox(width: _kToolbarToFabGap),
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

  Widget _buildActionButton(M3FloatingToolbarAction action, Color textColor) {
    // If action has a label, use TextButton.icon
    if (action.label != null) {
      final button = TextButton.icon(
        onPressed: action.onPressed,
        icon: Icon(action.icon, size: _kIconSize),
        label: Text(action.label!),
        style: TextButton.styleFrom(
          foregroundColor: textColor,
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
        child: action.tooltip != null
            ? Tooltip(message: action.tooltip!, child: button)
            : button,
      );
    }

    // Icon-only button
    final iconButton = IconButton(
      onPressed: action.onPressed,
      icon: Icon(action.icon, size: _kIconSize),
      color: textColor,
      constraints: const BoxConstraints(
        minWidth: _kMinTouchTargetSize,
        minHeight: _kMinTouchTargetSize,
      ),
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
