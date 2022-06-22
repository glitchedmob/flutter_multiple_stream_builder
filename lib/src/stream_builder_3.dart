import 'package:flutter/widgets.dart';
import 'package:multiple_stream_builder/src/multiple_stream_builder.dart';

class StreamTuple3<T1, T2, T3> {
  final Stream<T1> stream1;
  final Stream<T2> stream2;
  final Stream<T3> stream3;

  StreamTuple3(
    this.stream1,
    this.stream2,
    this.stream3,
  );
}

class SnapshotTuple3<T1, T2, T3> {
  final AsyncSnapshot<T1> snapshot1;
  final AsyncSnapshot<T2> snapshot2;
  final AsyncSnapshot<T3> snapshot3;

  SnapshotTuple3(
    this.snapshot1,
    this.snapshot2,
    this.snapshot3,
  );
}

class InitialDataTuple3<T1, T2, T3> {
  final T1? data1;
  final T2? data2;
  final T3? data3;

  InitialDataTuple3([
    this.data1,
    this.data2,
    this.data3,
  ]);
}

typedef AsyncWidgetBuilder3<T1, T2, T3> = Widget Function(
  BuildContext context,
  SnapshotTuple3<T1, T2, T3> snapshots,
);

/// Wraps the normal [StreamBuilder] widget to allow 3 streams in
/// in the form of a [StreamTuple3]. Can also accept multiple values for
/// [initialData] using a [InitialDataTuple3].
class StreamBuilder3<T1, T2, T3> extends StatelessWidget {
  final StreamTuple3<T1, T2, T3> streams;
  final AsyncWidgetBuilder3<T1, T2, T3> builder;
  final InitialDataTuple3<T1, T2, T3>? initialData;

  const StreamBuilder3({
    Key? key,
    this.initialData,
    required this.streams,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return MultipleStreamBuilder<T1, T2, T3, dynamic, dynamic, dynamic, dynamic,
        dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>(
      streams: StreamTuple(
        streams.stream1,
        streams.stream2,
        streams.stream3,
      ),
      builder: (context, snapshots) {
        return builder(
          context,
          SnapshotTuple3(
            snapshots.snapshot1!,
            snapshots.snapshot2!,
            snapshots.snapshot3!,
          ),
        );
      },
    );
  }
}
