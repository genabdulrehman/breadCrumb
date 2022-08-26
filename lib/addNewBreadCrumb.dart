import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/breadCrumb.dart';
import 'package:provider_app/breadCrumb_provider.dart';

class AddNewBreadCrumb extends StatefulWidget {
  const AddNewBreadCrumb({Key? key}) : super(key: key);

  @override
  State<AddNewBreadCrumb> createState() => _AddNewBreadCrumbState();
}

class _AddNewBreadCrumbState extends State<AddNewBreadCrumb> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Bread Crumb"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Enter new Bread Crumb",
            ),
          ),
          TextButton(
            onPressed: () {
              final breadCrumb =
                  BreadCrumb(name: _controller.text, isActive: false);
              if (_controller.text.isNotEmpty) {
                // This is read method to invoke add method in provider class.
                context.read<BreadCrumbProvider>().add(breadCrumb);
                // Then we are poping the screen user cna actaully emite the new changes.
                Navigator.of(context).pop();
              }
            },
            child: Text("Add "),
          ),
        ],
      ),
    );
  }
}
