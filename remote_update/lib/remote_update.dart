library remote_update;

import 'package:eval_annotation/eval_annotation.dart';
import 'package:flutter/material.dart';

@RuntimeOverride('#myHomePage')
Widget myHomePageUpdate(BuildContext context, Function(Widget) onTap) {
  return Scaffold(
    body: Container(
      height: 100,
      // width: double.maxFinite,
      color: Colors.green,
      child: GestureDetector(
          onTap: () {
            print("inside remote call");
            Widget widget = Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.green,
                title: const Text("Remote Screen"),
              ),
            );
            onTap(widget);
            // Navigator.push(context, route)
          },
          child: const Center(child: Text("Remote Widget"))),
    ),
  );
}
