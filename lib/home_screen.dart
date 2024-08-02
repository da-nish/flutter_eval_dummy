import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eval/flutter_eval.dart';
import 'package:flutter_eval/widgets.dart';
import 'package:flutter_eval_dummy/flutter_eval_string_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlutterEvalStringExample()

          // SizedBox(
          //   height: 100,
          //   width: 100,
          //   child: HotSwap(
          //     id: '#myHomePage',
          //     args: [
          //       $BuildContext.wrap(context),
          //       $Function((runtime, target, args) {
          //         print("hot reload function ");
          //         // print("hot tupe ${args.last.runtimeType}");

          //         Widget widget = (args.last)!.$value as Widget;
          //         // Get.to(() => widget, id: 1);

          //         // Get.to(() => widget, id: NavigationKey.dashboard);
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => Scaffold(
          //                     appBar: AppBar(
          //                       backgroundColor: Colors.green,
          //                       title: const Text("Remote Screen"),
          //                     ),
          //                   )),
          //         );
          //         return null;
          //       })
          //     ],
          //     childBuilder: (context) => Container(
          //       color: Colors.red,
          //       height: 40,
          //       width: 40,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
