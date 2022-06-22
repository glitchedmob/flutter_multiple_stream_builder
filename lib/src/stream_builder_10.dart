import 'package:flutter/widgets.dart';
import 'package:multiple_stream_builder/src/multiple_stream_builder.dart';

/// Wrapper for 10 [Stream]s. Intended to be used with [StreamBuilder10]
class StreamTuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> {
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

  // returns the sixth stream of the tuple
  final Stream<T6> stream6;

  // returns the seventh stream of the tuple
  final Stream<T7> stream7;

  // returns the eighth stream of the tuple
  final Stream<T8> stream8;

  // returns the ninth stream of the tuple
  final Stream<T9> stream9;

  /// returns the tenth stream of the tuple
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

/// Wrapper for 10 [AsyncSnapshot]s Intended to be used with [StreamBuilder10]
class SnapshotTuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> {
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

  // returns the sixth snapshot of the tuple
  final AsyncSnapshot<T6> snapshot6;

  // returns the seventh snapshot of the tuple
  final AsyncSnapshot<T7> snapshot7;

  // returns the eighth snapshot of the tuple
  final AsyncSnapshot<T8> snapshot8;

  // returns the ninth snapshot of the tuple
  final AsyncSnapshot<T9> snapshot9;

  /// returns the tenth snapshot of the tuple
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

/// Wrapper for 10 `initialData` values for [StreamBuilder10]
class InitialDataTuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> {
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

  // returns the sixth item of the tuple
  final T6? data6;

  // returns the seventh item of the tuple
  final T7? data7;

  // returns the eighth item of the tuple
  final T8? data8;

  // returns the ninth item of the tuple
  final T9? data9;

  /// returns the tenth item of the tuple
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

/// A variant of [AsyncWidgetBuilder] that uses [SnapshotTuple10]
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
      initialData: InitialDataTuple(
        initialData?.data1,
        initialData?.data2,
        initialData?.data3,
        initialData?.data4,
        initialData?.data5,
        initialData?.data6,
        initialData?.data7,
        initialData?.data8,
        initialData?.data9,
        initialData?.data10,
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
