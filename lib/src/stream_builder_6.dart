import 'package:flutter/widgets.dart';
import 'package:multiple_stream_builder/src/multiple_stream_builder.dart';

class StreamTuple6<T1, T2, T3, T4, T5, T6> {
  final Stream<T1> stream1;
  final Stream<T2> stream2;
  final Stream<T3> stream3;
  final Stream<T4> stream4;
  final Stream<T5> stream5;
  final Stream<T6> stream6;

  StreamTuple6(
    this.stream1,
    this.stream2,
    this.stream3,
    this.stream4,
    this.stream5,
    this.stream6,
  );
}

class SnapshotTuple6<T1, T2, T3, T4, T5, T6> {
  final AsyncSnapshot<T1> snapshot1;
  final AsyncSnapshot<T2> snapshot2;
  final AsyncSnapshot<T3> snapshot3;
  final AsyncSnapshot<T4> snapshot4;
  final AsyncSnapshot<T5> snapshot5;
  final AsyncSnapshot<T6> snapshot6;

  SnapshotTuple6(
    this.snapshot1,
    this.snapshot2,
    this.snapshot3,
    this.snapshot4,
    this.snapshot5,
    this.snapshot6,
  );
}

class InitialDataTuple6<T1, T2, T3, T4, T5, T6> {
  final T1? data1;
  final T2? data2;
  final T3? data3;
  final T4? data4;
  final T5? data5;
  final T6? data6;

  InitialDataTuple6([
    this.data1,
    this.data2,
    this.data3,
    this.data4,
    this.data5,
    this.data6,
  ]);
}

typedef AsyncWidgetBuilder6<T1, T2, T3, T4, T5, T6> = Widget Function(
  BuildContext context,
  SnapshotTuple6<T1, T2, T3, T4, T5, T6> snapshots,
);

/// Wraps the normal [StreamBuilder] widget to allow 6 streams in
/// in the form of a [StreamTuple6]. Can also accept multiple values for
/// [initialData] using a [InitialDataTuple6].
class StreamBuilder6<T1, T2, T3, T4, T5, T6> extends StatelessWidget {
  final StreamTuple6<T1, T2, T3, T4, T5, T6> streams;
  final AsyncWidgetBuilder6<T1, T2, T3, T4, T5, T6> builder;
  final InitialDataTuple6<T1, T2, T3, T4, T5, T6>? initialData;

  const StreamBuilder6({
    Key? key,
    this.initialData,
    required this.streams,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return MultipleStreamBuilder<T1, T2, T3, T4, T5, T6, dynamic, dynamic,
        dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>(
      streams: StreamTuple(
        streams.stream1,
        streams.stream2,
        streams.stream3,
        streams.stream4,
        streams.stream5,
        streams.stream6,
      ),
      initialData: InitialDataTuple(
        initialData?.data1,
        initialData?.data2,
        initialData?.data3,
        initialData?.data4,
        initialData?.data5,
        initialData?.data6,
      ),
      builder: (context, snapshots) {
        return builder(
          context,
          SnapshotTuple6(
            snapshots.snapshot1!,
            snapshots.snapshot2!,
            snapshots.snapshot3!,
            snapshots.snapshot4!,
            snapshots.snapshot5!,
            snapshots.snapshot6!,
          ),
        );
      },
    );
  }
}
