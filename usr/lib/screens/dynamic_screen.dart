import 'package:flutter/material.dart';
import '../data/screen_definitions.dart';

class DynamicScreen extends StatelessWidget {
  const DynamicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as int? ?? 1;
    final screenDef = screenDefinitions.firstWhere(
      (def) => def['id'] == args,
      orElse: () => screenDefinitions[0],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              screenDef['title'] as String,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            ...(screenDef['blocks'] as List).map((block) {
              final b = block as Map<String, dynamic>;
              switch (b['type']) {
                case 'text':
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(b['value'] as String),
                  );
                case 'image':
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Image.network(
                      b['value'] as String,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  );
                case 'button':
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          final action = b['action'] as Map<String, dynamic>;
                          if (action['type'] == 'navigate') {
                            Navigator.of(context).pushNamed(action['route'] as String);
                          } else if (action['type'] == 'alert') {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(action['title'] ?? 'Info'),
                                content: Text(action['message'] ?? ''),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1877F2),
                        ),
                        child: Text(
                          b['value'] as String,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                default:
                  return const SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}