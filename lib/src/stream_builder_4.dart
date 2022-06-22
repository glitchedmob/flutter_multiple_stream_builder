import 'package:flutter/widgets.dart';
import 'package:multiple_stream_builder/src/multiple_stream_builder.dart';

class StreamTuple4<T1, T2, T3, T4> {
  final Stream<T1> stream1;
  final Stream<T2> stream2;
  final Stream<T3> stream3;
  final Stream<T4> stream4;

  StreamTuple4(
    this.stream1,
    this.stream2,
    this.stream3,
    this.stream4,
  );
}

class SnapshotTuple4<T1, T2, T3, T4> {
  final AsyncSnapshot<T1> snapshot1;
  final AsyncSnapshot<T2> snapshot2;
  final AsyncSnapshot<T3> snapshot3;
  final AsyncSnapshot<T4> snapshot4;

  SnapshotTuple4(
    this.snapshot1,
    this.snapshot2,
    this.snapshot3,
    this.snapshot4,
  );
}

class InitialDataTuple4<T1, T2, T3, T4> {
  final T1? data1;
  final T2? data2;
  final T3? data3;
  final T4? data4;

  InitialDataTuple4([
    this.data1,
    this.data2,
    this.data3,
    this.data4,
  ]);
}

typedef AsyncWidgetBuilder4<T1, T2, T3, T4> = Widget Function(
  BuildContext context,
  SnapshotTuple4<T1, T2, T3, T4> snapshots,
);

/// Wraps the normal [StreamBuilder] widget to allow 4 streams in
/// in the form of a [StreamTuple4]. Can also accept multiple values for
/// [initialData] using a [InitialDataTuple4].
class StreamBuilder4<T1, T2, T3, T4> extends StatelessWidget {
  final StreamTuple4<T1, T2, T3, T4> streams;
  final AsyncWidgetBuilder4<T1, T2, T3, T4> builder;
  final InitialDataTuple4<T1, T2, T3, T4>? initialData;

  const StreamBuilder4({
    Key? key,
    this.initialData,
    required this.streams,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return MultipleStreamBuilder<T1, T2, T3, T4, dynamic, dynamic, dynamic,
        dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>(
      streams: StreamTuple(
        streams.stream1,
        streams.stream2,
        streams.stream3,
        streams.stream4,
      ),
      builder: (context, snapshots) {
        return builder(
          context,
          SnapshotTuple4(
            snapshots.snapshot1!,
            snapshots.snapshot2!,
            snapshots.snapshot3!,
            snapshots.snapshot4!,
          ),
        );
      },
    );
  }
}
