# multiple_stream_builder

Flutter widgets to replace multiple nested StreamBuilder widgets

## Installing
To add use this package in your Flutter project add this to your `pubspec.yml`
```yml
dependencies:
  multiple_stream_builder: ^3.0.0
```

## Usage example

```dart
var stream1 = Stream<int>.periodic(Duration(seconds: 1), (x) => x);
var stream2 = Stream<int>.periodic(Duration(seconds: 2), (x) => x);
var stream3 = Stream<int>.periodic(Duration(seconds: 3), (x) => x);

// Instead of writing out nested StreamBuilders
Widget build(BuildContext context) {
  return StreamBuilder<int>(
    stream: stream1,
    initialData: 0,
    builder: (context, snapshot1) {
      return StreamBuilder<int>(
        stream: stream2,
        initialData: 0,
        builder: (context, snapshot2) {
          return StreamBuilder<int>(
            stream: stream3,
            initialData: 0,
            builder: (context, snapshot3) {
              return Text(
                'stream1: ${snapshot1.data} - stream2: ${snapshot2.data} - stream3: ${snapshot3.data}',
              );
            },
          );
        },
      );
    },
  );
}

// Pass multiple streams into a single StreamBuilder
Widget build(BuildContext context) {
  return StreamBuilder3<int, int, int>(
    streams: StreamTuple3(stream1, stream2, stream3),
    initialData: InitialDataTuple3(0, 0, 0),
    builder: (context, snapshots) {
      return Text(
        'stream1: ${snapshots.snapshot1.data} - stream2: ${snapshots.snapshot2.data} - stream3: ${snapshots.snapshot3.data}',
      );
    },
  );
}
```
