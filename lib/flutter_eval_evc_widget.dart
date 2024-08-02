import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eval/flutter_eval.dart';
import 'package:flutter_eval/widgets.dart';

class FlutterEvalEVCExample extends StatelessWidget {
  const FlutterEvalEVCExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.maxFinite,
      child: HotSwap(
        id: '#myHomePage',
        args: [
          $BuildContext.wrap(context),
          $Function((runtime, target, args) {
            print("hot reload function ");

            Widget widget = (args.last)!.$value as Widget;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(
                        appBar: AppBar(
                          backgroundColor: Colors.green,
                          title: const Text("Remote Screen"),
                        ),
                      )),
            );
            return null;
          })
        ],
        childBuilder: (context) => Container(
          color: Colors.blue,
          height: 40,
          child: const Center(child: Text("Local Widget")),
        ),
      ),
    );
  }
}
