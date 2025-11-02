import 'package:flutter/material.dart';

class SelectLanguagePage extends StatefulWidget {
  const SelectLanguagePage({Key? key}) : super(key: key);

  @override
  State<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
  String selectedLang = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: ['English', 'Bahasa Indonesia', 'Spanish', 'French']
            .map((lang) => RadioListTile<String>(
          title: Text(lang),
          value: lang,
          groupValue: selectedLang,
          activeColor: Colors.orange,
          onChanged: (value) {
            setState(() => selectedLang = value!);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Language changed to $value')),
            );
          },
        ))
            .toList(),
      ),
    );
  }
}
