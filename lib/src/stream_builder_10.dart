import 'package:flutter/widgets.dart';
import 'package:multiple_stream_builder/src/multiple_stream_builder.dart';

class StreamTuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> {
  final Stream<T1> stream1;
  final Stream<T2> stream2;
  final Stream<T3> stream3;
  final Stream<T4> stream4;
  final Stream<T5> stream5;
  final Stream<T6> stream6;
  final Stream<T7> stream7;
  final Stream<T8> stream8;
  final Stream<T9> stream9;
  final Stream<T10> stream10;

  StreamTuple10(
    this.stream1,
    this.stream2,
    this.stream3,
    this.stream4,
    this.stream5,
    this.stream6,
    this.stream7,
    this.stream8,
    this.stream9,
    this.stream10,
  );
}

class SnapshotTuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> {
  final AsyncSnapshot<T1> snapshot1;
  final AsyncSnapshot<T2> snapshot2;
  final AsyncSnapshot<T3> snapshot3;
  final AsyncSnapshot<T4> snapshot4;
  final AsyncSnapshot<T5> snapshot5;
  final AsyncSnapshot<T6> snapshot6;
  final AsyncSnapshot<T7> snapshot7;
  final AsyncSnapshot<T8> snapshot8;
  final AsyncSnapshot<T9> snapshot9;
  final AsyncSnapshot<T10> snapshot10;

  SnapshotTuple10(
    this.snapshot1,
    this.snapshot2,
    this.snapshot3,
    this.snapshot4,
    this.snapshot5,
    this.snapshot6,
    this.snapshot7,
    this.snapshot8,
    this.snapshot9,
    this.snapshot10,
  );
}

class InitialDataTuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> {
  final T1? data1;
  final T2? data2;
  final T3? data3;
  final T4? data4;
  final T5? data5;
  final T6? data6;
  final T7? data7;
  final T8? data8;
  final T9? data9;
  final T10? data10;

  InitialDataTuple10([
    this.data1,
    this.data2,
    this.data3,
    this.data4,
    this.data5,
    this.data6,
    this.data7,
    this.data8,
    this.data9,
    this.data10,
  ]);
}

typedef AsyncWidgetBuilder10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> = Widget
    Function(
  BuildContext context,
  SnapshotTuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> snapshots,
);

/// Wraps the normal [StreamBuilder] widget to allow 10 streams in
/// in the form of a [StreamTuple10]. Can also accept multiple values for
/// [initialData] using a [InitialDataTuple10].
class StreamBuilder10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>
    extends StatelessWidget {
  final StreamTuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> streams;
  final AsyncWidgetBuilder10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> builder;
  final InitialDataTuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>?
      initialData;

  const StreamBuilder10({
    Key? key,
    this.initialData,
    required this.streams,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return MultipleStreamBuilder<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10,
        dynamic, dynamic, dynamic, dynamic, dynamic>(
      streams: StreamTuple(
        streams.stream1,
        streams.stream2,
        streams.stream3,
        streams.stream4,
        streams.stream5,
        streams.stream6,
        streams.stream7,
        streams.stream8,
        streams.stream9,
        streams.stream10,
      ),
      builder: (context, snapshots) {
        return builder(
          context,
          SnapshotTuple10(
            snapshots.snapshot1!,
            snapshots.snapshot2!,
            snapshots.snapshot3!,
            snapshots.snapshot4!,
            snapshots.snapshot5!,
            snapshots.snapshot6!,
            snapshots.snapshot7!,
            snapshots.snapshot8!,
            snapshots.snapshot9!,
            snapshots.snapshot10!,
          ),
        );
      },
    );
  }
}
