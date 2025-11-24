# M3 Floating Toolbar

A Flutter package that provides a Material Design 3 [floating pill-style toolbar](https://m3.material.io/components/toolbars/overview) widget. Perfect for creating action bars with icon-only or labeled buttons that follow Material You design principles.

## Features

- 🎨 Material Design 3 styling with automatic theming
- 🔘 Support for both icon-only and labeled action buttons
- ♿ Built-in accessibility with semantic labels and tooltips
- 🎯 Optional FloatingActionButton integration
- ⚙️ Customizable elevation, padding, spacing, and colors
- 📱 Responsive layout that adapts to content

[![example screenshot](https://raw.githubusercontent.com/abraham/m3_floating_toolbar/refs/heads/main/screenshot.png)](https://raw.githubusercontent.com/abraham/m3_floating_toolbar/refs/heads/main/screenshot.png)

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
      icon: Icons.share,
      semanticLabel: 'Share',
      tooltip: 'Share',
      onPressed: () => print('Share pressed'),
    ),
    M3FloatingToolbarAction(
      icon: Icons.favorite,
      semanticLabel: 'Like',
      tooltip: 'Like',
      onPressed: () => print('Like pressed'),
    ),
    M3FloatingToolbarAction(
      icon: Icons.bookmark,
      semanticLabel: 'Bookmark',
      tooltip: 'Bookmark',
      onPressed: () => print('Bookmark pressed'),
    ),
  ],
)
```

### Toolbar with labeled buttons

```dart
M3FloatingToolbar(
  actions: [
    M3FloatingToolbarAction(
      icon: Icons.share,
      label: 'Share',
      semanticLabel: 'Share post',
      onPressed: () => print('Share pressed'),
    ),
    M3FloatingToolbarAction(
      icon: Icons.bookmark,
      label: 'Save',
      semanticLabel: 'Bookmark post',
      onPressed: () => print('Bookmark pressed'),
    ),
  ],
)
```

### With FloatingActionButton

```dart
M3FloatingToolbar(
  actions: [
    M3FloatingToolbarAction(
      icon: Icons.share,
      semanticLabel: 'Share',
      onPressed: () => print('Share pressed'),
    ),
    M3FloatingToolbarAction(
      icon: Icons.bookmark,
      semanticLabel: 'Bookmark',
      onPressed: () => print('Bookmark pressed'),
    ),
  ],
  floatingActionButton: FloatingActionButton(
    onPressed: () => print('FAB pressed'),
    child: Icon(Icons.add),
  ),
)
```

### Customization

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

To report issues or contribute to this package, visit the [GitHub repository](https://github.com/abraham/m3_floating_toolbar).
