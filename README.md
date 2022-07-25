# scroll_cool_widget

|Vertical scroll|Horizontal scroll|
|---|---|
|![vertical](https://raw.githubusercontent.com/InnoFlutter/scroll_cool_widget/main/img/vertical.gif)|![horizontal](https://raw.githubusercontent.com/InnoFlutter/scroll_cool_widget/main/img/horizontal.gif)|

## Getting started

In your pubspec.yaml

```
dependencies:
  scroll_cool_widget: ^0.0.1
```

```dart
import 'package:scroll_cool_widget/scroll_cool_widget.dart';
```

## Usage

### With default settings (without back button)

```dart
ScrollCoolWidget(
  countOfCache: 10,
  height: (MediaQuery.of(context).size.height),
  width: (MediaQuery.of(context).size.width),
  
  createWidget: (index, width, height) {
    return Container(
      width: width,
      height: height,
      color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
      child: Center(
        child: Text('${index + 1}',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  },
)
```

### With custom settings (with back button)

```dart
ScrollCoolWidget(
  countOfCache: 10,
  height: (MediaQuery.of(context).size.height),
  width: (MediaQuery.of(context).size.width),
  scrollDirection: Axis.vertical,
  buttonPosition: ButtonPosition.topLeft,
  buttonColor: Colors.blueAccent,
  buttonIconColor: Colors.white,
  
  createWidget: (index, width, height) {
    return Container(
      width: width,
      height: height,
      color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
      child: Center(
        child: Text('${index + 1}',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  },
)
```

## Parameters

|Parameters|Description|
|---|---|
|`Widget Function(int index, double width, double height) createWidget`|Function for creating new widgets by index|
|`int countOfCache`|Count of widgets which will be loaded in advance|
|`double width`|Width of page|
|`double height`|Height of page|
|`Axis scrollDirection`|Direction of scrolling|
|`ButtonPosition buttonPosition`|Position of button for back|
|`Color buttonColor`|Color of button for back|
|`Color buttonIconColor`|Color of icon in button for back|

### ButtonPosition

Available values:

* `ButtonPosition.none` - default
* `ButtonPosition.topLeft`
* `ButtonPosition.topRight`
* `ButtonPosition.bottomLeft`
* `ButtonPosition.bottomRight`

## License

Here is using [MIT license](./LICENSE).