import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
import 'package:tuple/tuple.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Multiple Stream Builder Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Multiple Stream Builder Example'),
        ),
        body: ExampleScreen(),
      ),
    );
  }
}

class ExampleScreen extends StatefulWidget {
  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  var stream1 = Stream<int>.periodic(Duration(seconds: 1), (x) => x);
  var stream2 = Stream<int>.periodic(Duration(seconds: 2), (x) => x);
  var stream3 = Stream<int>.periodic(Duration(seconds: 3), (x) => x);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder3<int, int, int>(
      streams: Tuple3(stream1, stream2, stream3),
      initialData: Tuple3(0, 0, 0),
      builder: (context, snapshots) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('stream1: ${snapshots.item1.data}'),
              Text('stream2: ${snapshots.item2.data}'),
              Text('stream3: ${snapshots.item3.data}'),
            ],
          ),
        );
      },
    );
  }
}
