import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:m3_floating_toolbar/m3_floating_toolbar.dart';
import 'package:m3_floating_toolbar/m3_floating_toolbar_action.dart';

/// Size of the preview viewport used by every preview.
const Size kPreviewSize = Size(390, 400);

/// Size of the color swatch buttons in the theme colors preview.
const double _kSwatchSize = 48;

/// Builds the [MaterialApp] shell shared by the preview wrappers.
///
/// The brightness is read from the ambient [MediaQuery], which the widget
/// previewer updates when the light/dark mode toggle is used. The theme is
/// then passed explicitly so it is not overridden by the [MaterialApp]'s own
/// view based [MediaQuery].
Widget _previewWrapper({
  required Alignment alignment,
  required EdgeInsets padding,
  required Widget child,
}) {
  return Builder(
    builder: (context) {
      final brightness = MediaQuery.platformBrightnessOf(context);

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: brightness),
        home: SizedBox.expand(
          child: Scaffold(
            body: SafeArea(
              child: Align(
                alignment: alignment,
                child: Padding(padding: padding, child: child),
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget m3FloatingToolbarBottomCenterPreviewWrapper(Widget child) {
  return _previewWrapper(
    alignment: Alignment.bottomCenter,
    padding: const EdgeInsets.only(bottom: 16),
    child: child,
  );
}

Widget m3FloatingToolbarEndCenterPreviewWrapper(Widget child) {
  return _previewWrapper(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 16),
    child: child,
  );
}

/// Basic preview where tapping an action selects it.
@Preview(
  name: 'M3FloatingToolbar preview',
  size: kPreviewSize,
  wrapper: m3FloatingToolbarBottomCenterPreviewWrapper,
)
Widget m3FloatingToolbarPreview() => const _M3FloatingToolbarBasicPreview();

@Preview(
  name: 'M3FloatingToolbar with FAB',
  size: kPreviewSize,
  wrapper: m3FloatingToolbarBottomCenterPreviewWrapper,
)
Widget m3FloatingToolbarWithFabPreview() => M3FloatingToolbar(
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
  size: kPreviewSize,
  wrapper: m3FloatingToolbarBottomCenterPreviewWrapper,
)
Widget m3FloatingToolbarAllIconsPreview() => M3FloatingToolbar(
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
  size: kPreviewSize,
  wrapper: m3FloatingToolbarBottomCenterPreviewWrapper,
)
Widget m3FloatingToolbarAllIconsWithTextPreview() => M3FloatingToolbar(
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
      selected: true,
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

@Preview(
  name: 'M3FloatingToolbar vertical',
  size: kPreviewSize,
  wrapper: m3FloatingToolbarEndCenterPreviewWrapper,
)
Widget m3FloatingToolbarVerticalPreview() => M3FloatingToolbar(
  direction: Axis.vertical,
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
  name: 'M3FloatingToolbar vertical with FAB',
  size: kPreviewSize,
  wrapper: m3FloatingToolbarEndCenterPreviewWrapper,
)
Widget m3FloatingToolbarVerticalWithFabPreview() => M3FloatingToolbar(
  direction: Axis.vertical,
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

/// Preview that themes the toolbar from a selection of bright colors.
@Preview(
  name: 'M3FloatingToolbar theme colors',
  size: kPreviewSize,
  wrapper: m3FloatingToolbarBottomCenterPreviewWrapper,
)
Widget m3FloatingToolbarThemeColorsPreview() =>
    const _M3FloatingToolbarThemeColorsPreview();

class _M3FloatingToolbarBasicPreview extends StatefulWidget {
  const _M3FloatingToolbarBasicPreview();

  @override
  State<_M3FloatingToolbarBasicPreview> createState() =>
      _M3FloatingToolbarBasicPreviewState();
}

class _M3FloatingToolbarBasicPreviewState
    extends State<_M3FloatingToolbarBasicPreview> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    const items = [
      (icon: Icons.home, label: 'Home'),
      (icon: Icons.explore, label: 'Explore'),
      (icon: Icons.person, label: 'Profile'),
    ];

    return M3FloatingToolbar(
      actions: [
        for (var i = 0; i < items.length; i++)
          M3FloatingToolbarAction(
            icon: items[i].icon,
            label: i == _selectedIndex ? items[i].label : null,
            semanticLabel: items[i].label,
            tooltip: items[i].label,
            selected: i == _selectedIndex,
            onPressed: () => setState(() => _selectedIndex = i),
          ),
      ],
    );
  }
}

/// Bright seed colors offered by the theme selection preview.
const List<({String name, Color color})> _kPreviewThemeColors = [
  (name: 'Red', color: Color(0xFFFF1744)),
  (name: 'Orange', color: Color(0xFFFF9100)),
  (name: 'Green', color: Color(0xFF00E676)),
  (name: 'Blue', color: Color(0xFF00B0FF)),
  (name: 'Purple', color: Color(0xFFD500F9)),
];

class _M3FloatingToolbarThemeColorsPreview extends StatefulWidget {
  const _M3FloatingToolbarThemeColorsPreview();

  @override
  State<_M3FloatingToolbarThemeColorsPreview> createState() =>
      _M3FloatingToolbarThemeColorsPreviewState();
}

class _M3FloatingToolbarThemeColorsPreviewState
    extends State<_M3FloatingToolbarThemeColorsPreview> {
  Color _seedColor = _kPreviewThemeColors.first.color;
  M3FloatingToolbarVariant _variant = M3FloatingToolbarVariant.vibrant;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final option in _kPreviewThemeColors) _buildSwatch(option),
          ],
        ),
        const SizedBox(height: 16),
        SegmentedButton<M3FloatingToolbarVariant>(
          segments: const [
            ButtonSegment(
              value: M3FloatingToolbarVariant.standard,
              label: Text('Standard'),
            ),
            ButtonSegment(
              value: M3FloatingToolbarVariant.vibrant,
              label: Text('Vibrant'),
            ),
          ],
          selected: {_variant},
          onSelectionChanged: (selection) =>
              setState(() => _variant = selection.first),
        ),
        const SizedBox(height: 16),
        Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: _seedColor,
              brightness: Theme.of(context).brightness,
            ),
          ),
          child: M3FloatingToolbar(
            variant: _variant,
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
                tooltip: 'Explore',
                selected: true,
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
          ),
        ),
      ],
    );
  }

  Widget _buildSwatch(({String name, Color color}) option) {
    final isSelected = option.color == _seedColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Tooltip(
        message: '${option.name} theme',
        child: Semantics(
          label: '${option.name} theme',
          button: true,
          selected: isSelected,
          child: InkWell(
            onTap: () => setState(() => _seedColor = option.color),
            customBorder: const CircleBorder(),
            child: Container(
              width: _kSwatchSize,
              height: _kSwatchSize,
              decoration: BoxDecoration(
                color: option.color,
                shape: BoxShape.circle,
                border: isSelected
                    ? Border.all(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 3,
                      )
                    : null,
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 20)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
