import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:m3_floating_toolbar/m3_floating_toolbar_action.dart';

void main() {
  group('M3FloatingToolbarAction', () {
    test('creates instance with required parameters', () {
      const action = M3FloatingToolbarAction(
        icon: Icons.share,
        semanticLabel: 'Share',
        onPressed: _mockCallback,
      );

      expect(action.icon, equals(Icons.share));
      expect(action.semanticLabel, equals('Share'));
      expect(action.onPressed, equals(_mockCallback));
      expect(action.label, isNull);
      expect(action.tooltip, isNull);
    });

    test('creates instance with all parameters', () {
      const action = M3FloatingToolbarAction(
        icon: Icons.bookmark,
        label: 'Save',
        semanticLabel: 'Bookmark post',
        tooltip: 'Add to bookmarks',
        onPressed: _mockCallback,
      );

      expect(action.icon, equals(Icons.bookmark));
      expect(action.label, equals('Save'));
      expect(action.semanticLabel, equals('Bookmark post'));
      expect(action.tooltip, equals('Add to bookmarks'));
      expect(action.onPressed, equals(_mockCallback));
    });

    test('creates instance with label but no tooltip', () {
      const action = M3FloatingToolbarAction(
        icon: Icons.edit,
        label: 'Edit',
        semanticLabel: 'Edit content',
        onPressed: _mockCallback,
      );

      expect(action.icon, equals(Icons.edit));
      expect(action.label, equals('Edit'));
      expect(action.semanticLabel, equals('Edit content'));
      expect(action.tooltip, isNull);
      expect(action.onPressed, equals(_mockCallback));
    });

    test('creates instance with tooltip but no label', () {
      const action = M3FloatingToolbarAction(
        icon: Icons.delete,
        semanticLabel: 'Delete item',
        tooltip: 'Delete this item permanently',
        onPressed: _mockCallback,
      );

      expect(action.icon, equals(Icons.delete));
      expect(action.label, isNull);
      expect(action.semanticLabel, equals('Delete item'));
      expect(action.tooltip, equals('Delete this item permanently'));
      expect(action.onPressed, equals(_mockCallback));
    });

    test('allows different icon types', () {
      const action1 = M3FloatingToolbarAction(
        icon: Icons.favorite,
        semanticLabel: 'Like',
        onPressed: _mockCallback,
      );

      const action2 = M3FloatingToolbarAction(
        icon: Icons.star_border,
        semanticLabel: 'Star',
        onPressed: _mockCallback,
      );

      expect(action1.icon, equals(Icons.favorite));
      expect(action2.icon, equals(Icons.star_border));
      expect(action1.icon, isNot(equals(action2.icon)));
    });

    test('allows different callback functions', () {
      void callback1() {}
      void callback2() {}

      final action1 = M3FloatingToolbarAction(
        icon: Icons.share,
        semanticLabel: 'Share',
        onPressed: callback1,
      );

      final action2 = M3FloatingToolbarAction(
        icon: Icons.share,
        semanticLabel: 'Share',
        onPressed: callback2,
      );

      expect(action1.onPressed, equals(callback1));
      expect(action2.onPressed, equals(callback2));
      expect(action1.onPressed, isNot(equals(action2.onPressed)));
    });

    test('creates const instances correctly', () {
      // Test that the constructor is const and can be used in const contexts
      const action = M3FloatingToolbarAction(
        icon: Icons.home,
        semanticLabel: 'Home',
        onPressed: _mockCallback,
      );

      expect(action.icon, equals(Icons.home));
      expect(action.semanticLabel, equals('Home'));
    });
  });
}

// Mock callback for testing
void _mockCallback() {
  // Mock implementation
}
