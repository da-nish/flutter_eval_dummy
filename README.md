# Implement flutter_eval using 2 ways

1. Remote widget string
   
   `Pass widget code as a string from API`

   `Install dependencies and add FlutterEvalStringExample() widget`

3. Server update.evc file
   
   `follow below steps`

## Implement remote widget via .evc file

1. Add dependencies in main project
   
    `flutter_eval: ^0.7.6`
   
    `dart_eval: ^0.7.9`

3. Add HotSwapLoader Root Widget
   ```
    HotSwapLoader(
      uri: 'asset:packages/update.evc',
      child: GetMaterialApp()
    )
   ```

    create a folder in root of project and allow access in pubspec.yaml file
    in later steps we will generate update.evc and put inside it


5. Add HotSwap() widget

    Default widget
    >when there is no dynamic widget

    ID 
    >it should match with id of dynamic widget

    Argument that we will pass to dynamic widget
    >we have to preplan this

6. Create a package inside the project
    flutter create --template=package remote_update

7. Download a flutter_eval.json file from the package provider, search in github or pubdev, there should not be more than 1 file
    paste inside
    ```
    remote_update
        ├── .dart_eval
           └── bindings
              └── flutter_eval.json
    ```

8. Add dependency in remote_update repo pubspec.yaml file
    `eval_annotation: ^0.7.0`

9. Add dynamic widget in the remote_update repo 

    ```
    @RuntimeOverride('#myHomePage')
    Widget myHomePageUpdate(BuildContext context) {
        return Scaffold(
            ...
        )
    }
    ```

10. Install dart_eval globally
    `dart pub global activate dart_eval`

11. Generate .evc file, run below command inside "remote_update" package repo, from main repo it will not work

    `dart_eval compile -o any_name.evc`

    search any_name.evc file in remote_update repo and paste in the packages/

    **Now run the project, you will be see the wiget that defined in 9th step
    if you stuck somewhere check the repo code**
