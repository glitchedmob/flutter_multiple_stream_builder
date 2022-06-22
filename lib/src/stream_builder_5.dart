import 'package:flutter/widgets.dart';
import 'package:multiple_stream_builder/src/multiple_stream_builder.dart';

/// Wrapper for 5 [Stream]s. Intended to be used with [StreamBuilder5]
class StreamTuple5<T1, T2, T3, T4, T5> {
  // returns the first stream of the tuple
  final Stream<T1> stream1;

  // returns the second stream of the tuple
  final Stream<T2> stream2;

  // returns the third stream of the tuple
  final Stream<T3> stream3;

  // returns the fourth stream of the tuple
  final Stream<T4> stream4;

  // returns the fifth stream of the tuple
  final Stream<T5> stream5;

  StreamTuple5(
    this.stream1,
    this.stream2,
    this.stream3,
    this.stream4,
    this.stream5,
  );
}

/// Wrapper for 5 [AsyncSnapshot]s Intended to be used with [StreamBuilder5]
class SnapshotTuple5<T1, T2, T3, T4, T5> {
  // returns the first snapshot of the tuple
  final AsyncSnapshot<T1> snapshot1;

  // returns the second snapshot of the tuple
  final AsyncSnapshot<T2> snapshot2;

  // returns the third snapshot of the tuple
  final AsyncSnapshot<T3> snapshot3;

  // returns the fourth snapshot of the tuple
  final AsyncSnapshot<T4> snapshot4;

  // returns the fifth snapshot of the tuple
  final AsyncSnapshot<T5> snapshot5;

  SnapshotTuple5(
    this.snapshot1,
    this.snapshot2,
    this.snapshot3,
    this.snapshot4,
    this.snapshot5,
  );
}

/// Wrapper for 5 `initialData` values for [StreamBuilder5]
class InitialDataTuple5<T1, T2, T3, T4, T5> {
  // returns the first item of the tuple
  final T1? data1;

  // returns the second item of the tuple
  final T2? data2;

  // returns the third item of the tuple
  final T3? data3;

  // returns the fourth item of the tuple
  final T4? data4;

  // returns the fifth item of the tuple
  final T5? data5;

  InitialDataTuple5([
    this.data1,
    this.data2,
    this.data3,
    this.data4,
    this.data5,
  ]);
}

/// A variant of [AsyncWidgetBuilder] that uses [SnapshotTuple5]
typedef AsyncWidgetBuilder5<T1, T2, T3, T4, T5> = Widget Function(
  BuildContext context,
  SnapshotTuple5<T1, T2, T3, T4, T5> snapshots,
);

/// Wraps the normal [StreamBuilder] widget to allow 5 streams in
/// in the form of a [StreamTuple5]. Can also accept multiple values for
/// [initialData] using a [InitialDataTuple5].
class StreamBuilder5<T1, T2, T3, T4, T5> extends StatelessWidget {
  final StreamTuple5<T1, T2, T3, T4, T5> streams;
  final AsyncWidgetBuilder5<T1, T2, T3, T4, T5> builder;
  final InitialDataTuple5<T1, T2, T3, T4, T5>? initialData;

  const StreamBuilder5({
    Key? key,
    this.initialData,
    required this.streams,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return MultipleStreamBuilder<T1, T2, T3, T4, T5, dynamic, dynamic, dynamic,
        dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>(
      streams: StreamTuple(
        streams.stream1,
        streams.stream2,
        streams.stream3,
        streams.stream4,
        streams.stream5,
      ),
      initialData: InitialDataTuple(
        initialData?.data1,
        initialData?.data2,
        initialData?.data3,
        initialData?.data4,
        initialData?.data5,
      ),
      builder: (context, snapshots) {
        return builder(
          context,
          SnapshotTuple5(
            snapshots.snapshot1!,
            snapshots.snapshot2!,
            snapshots.snapshot3!,
            snapshots.snapshot4!,
            snapshots.snapshot5!,
          ),
        );
      },
    );
  }
}
