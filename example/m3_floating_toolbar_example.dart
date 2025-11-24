import 'package:flutter/material.dart';
import 'package:m3_floating_toolbar/m3_floating_toolbar.dart';
import 'package:m3_floating_toolbar/m3_floating_toolbar_action.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M3 Floating Toolbar Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FloatingToolbarDemo(),
    );
  }
}

class FloatingToolbarDemo extends StatefulWidget {
  const FloatingToolbarDemo({super.key});

  @override
  State<FloatingToolbarDemo> createState() => _FloatingToolbarDemoState();
}

class _FloatingToolbarDemoState extends State<FloatingToolbarDemo> {
  int _likeCount = 0;
  bool _isBookmarked = false;
  String _lastAction = 'No action yet';

  void _handleShare() {
    setState(() {
      _lastAction = 'Shared!';
    });
  }

  void _handleLike() {
    setState(() {
      _likeCount++;
      _lastAction = 'Liked! Total: $_likeCount';
    });
  }

  void _handleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
      _lastAction = _isBookmarked ? 'Bookmarked!' : 'Bookmark removed';
    });
  }

  void _handleReply() {
    setState(() {
      _lastAction = 'Opened reply dialog';
    });
  }

  void _handleAdd() {
    setState(() {
      _lastAction = 'Add button pressed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('M3 Floating Toolbar Demo'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  'Try out the floating toolbars below!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),

              // Example 1: Icon-only toolbar
              const Text(
                'Icon-only buttons:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              M3FloatingToolbar(
                actions: [
                  M3FloatingToolbarAction(
                    icon: Icons.share,
                    semanticLabel: 'Share post',
                    tooltip: 'Share',
                    onPressed: _handleShare,
                  ),
                  M3FloatingToolbarAction(
                    icon: Icons.favorite,
                    semanticLabel: 'Like post',
                    tooltip: 'Like',
                    onPressed: _handleLike,
                  ),
                  M3FloatingToolbarAction(
                    icon: _isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    semanticLabel: 'Bookmark post',
                    tooltip: 'Bookmark',
                    onPressed: _handleBookmark,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Example 2: Mixed icon and labeled buttons
              const Text(
                'Mixed buttons with labels:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              M3FloatingToolbar(
                actions: [
                  M3FloatingToolbarAction(
                    icon: Icons.reply,
                    semanticLabel: 'Reply',
                    tooltip: 'Reply',
                    onPressed: _handleReply,
                  ),
                  M3FloatingToolbarAction(
                    icon: Icons.favorite,
                    label: 'Like',
                    semanticLabel: 'Like post',
                    onPressed: _handleLike,
                  ),
                  M3FloatingToolbarAction(
                    icon: _isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    label: 'Save',
                    semanticLabel: 'Bookmark post',
                    onPressed: _handleBookmark,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Example 3: Toolbar with FAB
              const Text(
                'With FloatingActionButton:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              M3FloatingToolbar(
                actions: [
                  M3FloatingToolbarAction(
                    icon: Icons.share,
                    semanticLabel: 'Share',
                    tooltip: 'Share',
                    onPressed: _handleShare,
                  ),
                  M3FloatingToolbarAction(
                    icon: Icons.favorite,
                    semanticLabel: 'Like',
                    tooltip: 'Like',
                    onPressed: _handleLike,
                  ),
                ],
                floatingActionButton: FloatingActionButton(
                  onPressed: _handleAdd,
                  child: const Icon(Icons.add),
                ),
              ),
              const SizedBox(height: 32),

              // Status display
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'Last Action:',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _lastAction,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Likes: $_likeCount | Bookmarked: ${_isBookmarked ? "Yes" : "No"}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
