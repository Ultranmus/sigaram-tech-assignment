import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigaram_tech_assignment/widgets/toggle_button.dart';
import '../firebase.dart';
import '../providers.dart';

class Section extends ConsumerWidget {
  final StateProvider provider;
  const Section(this.provider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          provider == languageProvider ? 'Select Language' : 'Select Color',
          style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder(
            future: provider == languageProvider
                ? ref.read(firebaseProvider).fetchLanguages()
                : ref.read(firebaseProvider).fetchColors(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data available.'));
              } else {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 40,
                      childAspectRatio: 4 // Number of columns
                      ),
                  itemCount: snapshot.data!.length,
                  // Number of items
                  itemBuilder: (BuildContext context, int index) {
                    return ToggleButton(
                        text: snapshot.data![index], provider: provider);
                  },
                );
              }
            }),
      ],
    );
  }
}
