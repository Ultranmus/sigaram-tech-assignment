import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../maps/color_map.dart';
import '../providers.dart';

class ToggleButton extends ConsumerWidget {
  final String text;
  final StateProvider provider;
  const ToggleButton({
    super.key,
    required this.text,
    required this.provider,
  });

  Color getColor(String text) {
    if (colorMap.containsKey(text)) {
      return colorMap[text]!;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool selected = ref.watch(provider) == text;
    return GestureDetector(
      onTap: () {
        ref.read(provider.notifier).update((state) => text);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            color: provider == colorProvider
                ? getColor(text)
                : const Color(0x77d3d3d3),
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
                color: selected ? Colors.lightGreen : Colors.black, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                '$text${provider == colorProvider ? selected ? '(default)' : '' : ''}',
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
            selected
                ? const Icon(Icons.check)
                : const SizedBox(
                    width: 20,
                  ),
          ],
        ),
      ),
    );
  }
}
