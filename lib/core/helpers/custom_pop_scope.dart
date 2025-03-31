import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPopScope extends StatelessWidget {
  const CustomPopScope({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) async {
        if (didPop) return;

        final shouldExit = await _showExitConfirmation(context);
        if (shouldExit) {
          SystemNavigator.pop();
        }
      },
      child: child,
    );
  }

  Future<bool> _showExitConfirmation(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Exit News 24?'),
                content: const Text('Do you want to exit?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Yes'),
                  ),
                ],
              ),
        ) ??
        false;
  }
}
