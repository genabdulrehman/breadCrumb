import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:provider_app/breadCrumb.dart';

class BreadCrumbWidget extends StatelessWidget {
  final UnmodifiableListView<BreadCrumb> breadCrumb;
  BreadCrumbWidget({
    Key? key,
    required this.breadCrumb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: breadCrumb.map((breadCrumb) {
      return Text(
        breadCrumb.title,
        style: TextStyle(
          color: breadCrumb.isActive ? Colors.blue : Colors.black,
        ),
      );
    }).toList());
  }
}
