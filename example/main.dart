import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiple Stream Builder Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Multiple Stream Builder Example'),
        ),
        body: const ExampleScreen(),
      ),
    );
  }
}

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  var stream1 = Stream<int>.periodic(const Duration(seconds: 1), (x) => x);
  var stream2 = Stream<int>.periodic(const Duration(seconds: 2), (x) => x);
  var stream3 = Stream<int>.periodic(const Duration(seconds: 3), (x) => x);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder3<int, int, int>(
      streams: StreamTuple3(stream1, stream2, stream3),
      initialData: InitialDataTuple3(0, 0, 0),
      builder: (context, snapshots) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('stream1: ${snapshots.snapshot1.data}'),
              Text('stream2: ${snapshots.snapshot2.data}'),
              Text('stream3: ${snapshots.snapshot3.data}'),
            ],
          ),
        );
      },
    );
  }
}
