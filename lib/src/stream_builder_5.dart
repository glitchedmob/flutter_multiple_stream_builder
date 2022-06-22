import 'package:flutter/widgets.dart';
import 'package:multiple_stream_builder/src/multiple_stream_builder.dart';

class StreamTuple5<T1, T2, T3, T4, T5> {
  final Stream<T1> stream1;
  final Stream<T2> stream2;
  final Stream<T3> stream3;
  final Stream<T4> stream4;
  final Stream<T5> stream5;

  StreamTuple5(
    this.stream1,
    this.stream2,
    this.stream3,
    this.stream4,
    this.stream5,
  );
}

class SnapshotTuple5<T1, T2, T3, T4, T5> {
  final AsyncSnapshot<T1> snapshot1;
  final AsyncSnapshot<T2> snapshot2;
  final AsyncSnapshot<T3> snapshot3;
  final AsyncSnapshot<T4> snapshot4;
  final AsyncSnapshot<T5> snapshot5;

  SnapshotTuple5(
    this.snapshot1,
    this.snapshot2,
    this.snapshot3,
    this.snapshot4,
    this.snapshot5,
  );
}

class InitialDataTuple5<T1, T2, T3, T4, T5> {
  final T1? data1;
  final T2? data2;
  final T3? data3;
  final T4? data4;
  final T5? data5;

  InitialDataTuple5([
    this.data1,
    this.data2,
    this.data3,
    this.data4,
    this.data5,
  ]);
}

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
