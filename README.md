# FMagus

![logotipo-readme-1](https://user-images.githubusercontent.com/92796645/213310862-93355a74-4c93-44f2-bcbb-e3e9956116e0.jpg)

> Dart package to automate the boring work, like creating assets, folder structures, importing packages etc for Flutter via CLI.

### Go To:
  - [How to Use](#-how-to-use)
  - [Version History](#-version-history)
  - [License](#-license)

---

## 🤓 How to Use

First of all, run this command in your project's root directory:

```
flutter pub add -d fmagus
```

It'll add FMagus as a dev dependency to your pubspec.yaml file. You can see more details in [Installing](INSTALL.md).

FMagus is a package wich helps with through CLI commands to automate the boring work.
You run it with the command in your flutter project's root directory:

```
flutter pub run fmagus:<command>
```

Substitute `<command>` with the command you want to run. For example:

```
flutter pub run fmagus:help
```

### Commands

| Command 	| Details 	|
|---	|---	|
| `help` 	| Displays a table with all FMagus commands. 	|
| `build` 	| It builds your project.<br><br>Arguments:<br>--target="platform": android, ios, web, windows, linux or macos.<br><br>--type="output": apk or appbundle in case of android,<br>canvaskit or html in case of web. Others only have one option.<br>Defaults to: AppBundle (android) or CanvasKit(Web).<br><br>--obfuscate="option": true for obfuscate your code or false to not to.<br>Defaults to: true.<br><br>--debugInfo="directory": The directory for debug info in case of<br>code obfuscating. Defaults to: projectRoot/debug. 	|
| `clean` 	| Cleans Flutter cache and downloads the packages and plugins again. 	|
| `generate_image_asset` 	| Generate image assets of all sizes (4.0x, 3.0x, 2.0x, 1.5x, 1.0x, 0.75x)<br>from a given image. The 4.0x asset will be the same size as the given image,<br>the others will be scaled proportionally.<br><br>Arguments:<br>--path="resource_path": The path to the image that will<br>serve as the resource.<br><br>--assetName="name": The name the asset will have<br>after the creation (without the extension). 	|
| `route_generator` 	| Creates a RouteGenerator. 	|
| `provider_scope` 	| Creates a custom MultiProvider widget. 	|
| `theme_configs` 	| Creates a basic file with some configs to App Theme (Material 3). 	|
| `hive` 	| Imports all the Hive Packages necessary to Flutter.<br><br>Arguments:<br>--generator="option": true to import the code generator for<br>custom Hive Objects, false to not. Defaults to: false. 	|
| `hive_configs` 	| Creates a basic file with some initial configs to use Hive. 	|
| `hive_settings_repository` 	| Creates a basic file based on repository pattern to store<br>app settings with Hive. 	|
| `firebase` 	| Imports some basic Firebase packages. 	|
| `mobx` 	| Imports all the MobX packages necessary to Flutter. 	|
| `mvc` 	| Creates a basic directory structure for MVC Design Pattern, with some extras. 	|

## 🕰️ Version History
See the [Version History](CHANGELOG.md) file for more details.

## 📝 License
This project is under license. See the [License](LICENSE) file for more details.
