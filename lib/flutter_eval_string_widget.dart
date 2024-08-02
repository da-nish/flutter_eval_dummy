import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eval/flutter_eval.dart';

class FlutterEvalStringExample extends StatelessWidget {
  const FlutterEvalStringExample({super.key});

  void navi() {
    print(":::::Navigation Working....");
  }

  @override
  Widget build(BuildContext context) {
    // Navigator.pushNamed(context, '/second');

    return EvalWidget(
        packages: const {
          'example': {
            'main.dart': '''
    import 'package:flutter/material.dart';

    class MyWidget extends StatelessWidget {
      MyWidget(this.name, this.onTap);
      final String name;
      final Function(Widget) onTap;

      @override
      Widget build(BuildContext context) {
        return Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          ElevatedButton(onPressed: (){
          print("inside remote call");
            Widget widget = Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.green,
                title: const Text("Remote Screen"),
              ),
            );
            onTap(widget);
            }, child: Text('Click Here')),
          

              
            ],
            
          )
        );
      }
    }''',
          }
        },
        assetPath: 'assets/program.evc',
        library: 'package:example/main.dart',
        function: 'MyWidget.',
        args: [
          $String('Example name'),
          $Function((runtime, target, args) {
            print("hot reload function ");
            Widget widget = (args.last)!.$value as Widget;
            // Get.to(() => widget, id: NavigationKey.dashboard);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget),
            );

            return null;
          })
        ]);
  }
}
