import 'package:flutter/material.dart';

class WidgetPage extends StatefulWidget {
  const WidgetPage({super.key});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            onEditingComplete: () {
              setState(() {});
            },
          ),
          Text(controller.text),
          // Checkbox(
          //   tristate: true,
          //   value: isChecked,
          //   onChanged: (bool? value) {
          //     setState(() {
          //       isChecked = value ?? false;
          //     });
          //   },
          // ),
          CheckboxListTile(
            tristate: true,
            title: const Text("Accept Terms and Conditions"),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          ),
          // Switch(
          //   value: isSwitched,
          //   onChanged: (bool value) {
          //     setState(() {
          //       isSwitched = value;
          //     });
          //   },
          // ),
          SwitchListTile(
            title: const Text("Enable Notifications"),
            value: isSwitched,
            onChanged: (bool value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
