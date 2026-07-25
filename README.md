# M3 Floating Toolbar

A Flutter package that provides a Material Design 3 [floating pill-style toolbar](https://m3.material.io/components/toolbars/overview) widget. Perfect for creating action bars with icon-only or labeled buttons that follow Material You design principles.

## Features

- 🎨 Material Design 3 styling with automatic theming
- 🎛️ Standard and vibrant color configurations
- ↔️ Horizontal and vertical layouts
- 🔘 Support for both icon-only and labeled action buttons
- ♿ Built-in accessibility with semantic labels, tooltips, and 48dp touch targets
- 🎯 Optional FloatingActionButton integration
- ⚙️ Customizable elevation, padding, spacing, and colors
- 📱 Responsive layout that adapts to content

[![examples of icons and selected label, labels and selected icon, and icons with FAB](https://raw.githubusercontent.com/abraham/m3_floating_toolbar/refs/heads/main/screenshot1.png)](https://raw.githubusercontent.com/abraham/m3_floating_toolbar/refs/heads/main/screenshot1.png)

[![examples of all icons, all icons and labels, and vertical icons](https://raw.githubusercontent.com/abraham/m3_floating_toolbar/refs/heads/main/screenshot2.png)](https://raw.githubusercontent.com/abraham/m3_floating_toolbar/refs/heads/main/screenshot2.png)

[![examples of vertical with icons and FAB, icons in dark mode, and colorful versions ](https://raw.githubusercontent.com/abraham/m3_floating_toolbar/refs/heads/main/screenshot3.png)](https://raw.githubusercontent.com/abraham/m3_floating_toolbar/refs/heads/main/screenshot3.png)

## Getting started

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  m3_floating_toolbar: ^0.1.0
```

Then run:

```bash
flutter pub get
```

Import the package in your Dart code:

```dart
import 'package:m3_floating_toolbar/m3_floating_toolbar.dart';
import 'package:m3_floating_toolbar/m3_floating_toolbar_action.dart';
```

## Usage

### Basic toolbar with icon-only buttons

```dart
M3FloatingToolbar(
  actions: [
    M3FloatingToolbarAction(
      icon: Icons.home,
      semanticLabel: 'Home',
      tooltip: 'Home',
      onPressed: () => print('Home pressed'),
    ),
    M3FloatingToolbarAction(
      icon: Icons.explore,
      semanticLabel: 'Explore',
      tooltip: 'Explore',
      onPressed: () => print('Explore pressed'),
    ),
    M3FloatingToolbarAction(
      icon: Icons.person,
      semanticLabel: 'Profile',
      tooltip: 'Profile',
      onPressed: () => print('Profile pressed'),
    ),
  ],
)
```

### Toolbar with labeled buttons

```dart
M3FloatingToolbar(
  actions: [
    M3FloatingToolbarAction(
      icon: Icons.home,
      label: 'Home',
      semanticLabel: 'Home tab',
      onPressed: () => print('Home pressed'),
    ),
    M3FloatingToolbarAction(
      icon: Icons.explore,
      label: 'Explore',
      semanticLabel: 'Explore tab',
      onPressed: () => print('Explore pressed'),
    ),
    M3FloatingToolbarAction(
      icon: Icons.person,
      label: 'Profile',
      semanticLabel: 'Profile tab',
      onPressed: () => print('Profile pressed'),
    ),
  ],
)
```

### With FloatingActionButton

```dart
M3FloatingToolbar(
  actions: [
    M3FloatingToolbarAction(
      icon: Icons.home,
      semanticLabel: 'Home',
      onPressed: () => print('Home pressed'),
    ),
    M3FloatingToolbarAction(
      icon: Icons.explore,
      semanticLabel: 'Explore',
      onPressed: () => print('Explore pressed'),
    ),
    M3FloatingToolbarAction(
      icon: Icons.notifications,
      semanticLabel: 'Notifications',
      onPressed: () => print('Notifications pressed'),
    ),
  ],
  floatingActionButton: FloatingActionButton(
    onPressed: () => print('Create post pressed'),
    child: Icon(Icons.add_box),
  ),
)
```

### Vertical layout

Set `direction` to `Axis.vertical` for the vertical floating toolbar
configuration, typically anchored to a side edge of the screen.

```dart
M3FloatingToolbar(
  direction: Axis.vertical,
  actions: [
    M3FloatingToolbarAction(
      icon: Icons.home,
      semanticLabel: 'Home',
      tooltip: 'Home',
      onPressed: () => print('Home pressed'),
    ),
    M3FloatingToolbarAction(
      icon: Icons.explore,
      semanticLabel: 'Explore',
      tooltip: 'Explore',
      onPressed: () => print('Explore pressed'),
    ),
    M3FloatingToolbarAction(
      icon: Icons.person,
      semanticLabel: 'Profile',
      tooltip: 'Profile',
      onPressed: () => print('Profile pressed'),
    ),
  ],
)
```

When a `floatingActionButton` is provided, it is placed below the toolbar.

### Color variants

The toolbar follows the Material Design 3 toolbar color configurations. The
`standard` variant (default) uses `surfaceContainer`, and `vibrant` uses
`primaryContainer`.

```dart
M3FloatingToolbar(
  variant: M3FloatingToolbarVariant.vibrant,
  actions: [...],
)
```

### Customization

Defaults follow the Material Design 3 specs: 64dp container height, full
(stadium) corner shape, 8dp internal padding, 4dp between items, and a 16dp
minimum margin from the screen edge.

Floating toolbars are elevated by default. Set `elevation: 0` when the content
beneath the toolbar is already visually distinct.

```dart
M3FloatingToolbar(
  actions: [...],
  elevation: 4,
  internalPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
  spacing: 12,
  color: Colors.blue.shade100,
  foregroundColor: Colors.blue.shade900,
)
```

## Additional information

For a complete working example, see the [example](example/) directory.

### VS Code command for Flutter previews

This workspace includes a VS Code launch configuration named **Launch Flutter Previews**.

Open **Run and Debug** and select:

1. `Launch Flutter Previews`
2. Start debugging

This runs:

```bash
flutter widget-preview start
```

To report issues or contribute to this package, visit the [GitHub repository](https://github.com/abraham/m3_floating_toolbar).
