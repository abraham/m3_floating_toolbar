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
  String _currentTab = 'Home';
  String _lastAction = 'No action yet';

  void _goToHome() {
    setState(() {
      _currentTab = 'Home';
      _lastAction = 'Opened Home feed';
    });
  }

  void _goToExplore() {
    setState(() {
      _currentTab = 'Explore';
      _lastAction = 'Exploring trending posts';
    });
  }

  void _goToProfile() {
    setState(() {
      _currentTab = 'Profile';
      _lastAction = 'Opened profile';
    });
  }

  void _openNotifications() {
    setState(() {
      _lastAction = 'Viewed notifications';
    });
  }

  void _createPost() {
    setState(() {
      _lastAction = 'Opened post composer';
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
                'Icon-only app nav:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              M3FloatingToolbar(
                actions: [
                  M3FloatingToolbarAction(
                    icon: Icons.home,
                    semanticLabel: 'Home',
                    tooltip: 'Home',
                    onPressed: _goToHome,
                  ),
                  M3FloatingToolbarAction(
                    icon: Icons.explore,
                    semanticLabel: 'Explore',
                    tooltip: 'Explore',
                    onPressed: _goToExplore,
                  ),
                  M3FloatingToolbarAction(
                    icon: Icons.person,
                    semanticLabel: 'Profile',
                    tooltip: 'Profile',
                    onPressed: _goToProfile,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Example 2: Mixed icon and labeled buttons
              const Text(
                'Labeled app nav:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              M3FloatingToolbar(
                actions: [
                  M3FloatingToolbarAction(
                    icon: Icons.home,
                    label: 'Home',
                    semanticLabel: 'Home',
                    onPressed: _goToHome,
                  ),
                  M3FloatingToolbarAction(
                    icon: Icons.explore,
                    label: 'Explore',
                    semanticLabel: 'Explore',
                    onPressed: _goToExplore,
                  ),
                  M3FloatingToolbarAction(
                    icon: Icons.person,
                    label: 'Profile',
                    semanticLabel: 'Profile',
                    onPressed: _goToProfile,
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
                    icon: Icons.home,
                    semanticLabel: 'Home',
                    tooltip: 'Home',
                    onPressed: _goToHome,
                  ),
                  M3FloatingToolbarAction(
                    icon: Icons.explore,
                    semanticLabel: 'Explore',
                    tooltip: 'Explore',
                    onPressed: _goToExplore,
                  ),
                  M3FloatingToolbarAction(
                    icon: Icons.notifications,
                    semanticLabel: 'Notifications',
                    tooltip: 'Notifications',
                    onPressed: _openNotifications,
                  ),
                ],
                floatingActionButton: FloatingActionButton(
                  onPressed: _createPost,
                  child: const Icon(Icons.add_box),
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
                      'Current tab: $_currentTab',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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
