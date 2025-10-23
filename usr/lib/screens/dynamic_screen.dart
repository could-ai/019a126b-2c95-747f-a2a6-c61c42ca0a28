import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/screen_definition_model.dart';
import 'package:couldai_user_app/data/screen_definitions.dart';

class DynamicScreen extends StatelessWidget {
  const DynamicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final screenId = args?['screenId'] as int? ?? 1;
    final def = screenDefinitions.firstWhere((d) => d.id == screenId, orElse: () => screenDefinitions.first);

    return Scaffold(
      appBar: AppBar(
        title: Text(def.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: def.blocks.map((block) {
            if (block.type == 'text') {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(block.value),
              );
            }
            if (block.type == 'image') {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(block.value),
                ),
              );
            }
            if (block.type == 'button') {
              return ElevatedButton(
                onPressed: () {
                  if (block.action?.type == 'navigate') {
                    Navigator.of(context).pushNamed(block.action!.route);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1877F2),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: Text(block.value, style: const TextStyle(color: Colors.white)),
              );
            }
            return const SizedBox.shrink();
          }).toList(),
        ),
      ),
    );
  }
}
