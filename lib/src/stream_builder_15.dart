import 'package:flutter/widgets.dart';
import 'package:multiple_stream_builder/src/multiple_stream_builder.dart';

/// Wrapper for 15 [Stream]s. Intended to be used with [StreamBuilder15]
class StreamTuple15<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14,
    T15> {
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

  /// returns the eleventh stream of the tuple
  final Stream<T11> stream11;

  /// returns the twelfth stream of the tuple
  final Stream<T12> stream12;

  /// returns the thirteenth stream of the tuple
  final Stream<T13> stream13;

  /// returns the fourteenth stream of the tuple
  final Stream<T14> stream14;

  /// returns the fifteenth stream of the tuple
  final Stream<T15> stream15;

  StreamTuple15(
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
    this.stream11,
    this.stream12,
    this.stream13,
    this.stream14,
    this.stream15,
  );
}

/// Wrapper for 15 [AsyncSnapshot]s Intended to be used with [StreamBuilder15]
class SnapshotTuple15<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13,
    T14, T15> {
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

  /// returns the eleventh snapshot of the tuple
  final AsyncSnapshot<T11> snapshot11;

  /// returns the twelfth snapshot of the tuple
  final AsyncSnapshot<T12> snapshot12;

  /// returns the thirteenth snapshot of the tuple
  final AsyncSnapshot<T13> snapshot13;

  /// returns the fourteenth snapshot of the tuple
  final AsyncSnapshot<T14> snapshot14;

  /// returns the fifteenth snapshot of the tuple
  final AsyncSnapshot<T15> snapshot15;

  SnapshotTuple15(
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
    this.snapshot11,
    this.snapshot12,
    this.snapshot13,
    this.snapshot14,
    this.snapshot15,
  );
}

/// Wrapper for 15 `initialData` values for [StreamBuilder15]
class InitialDataTuple15<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13,
    T14, T15> {
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

  /// returns the eleventh item of the tuple
  final T11? data11;

  /// returns the twelfth item of the tuple
  final T12? data12;

  /// returns the thirteenth item of the tuple
  final T13? data13;

  /// returns the fourteenth item of the tuple
  final T14? data14;

  /// returns the fifteenth item of the tuple
  final T15? data15;

  InitialDataTuple15([
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
    this.data11,
    this.data12,
    this.data13,
    this.data14,
    this.data15,
  ]);
}

/// A variant of [AsyncWidgetBuilder] that uses [SnapshotTuple15]
typedef AsyncWidgetBuilder15<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12,
        T13, T14, T15>
    = Widget Function(
  BuildContext context,
  SnapshotTuple15<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14,
          T15>
      snapshots,
);

/// Wraps the normal [StreamBuilder] widget to allow 15 streams in
/// in the form of a [StreamTuple15]. Can also accept multiple values for
/// [initialData] using a [InitialDataTuple15].
class StreamBuilder15<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13,
    T14, T15> extends StatelessWidget {
  final StreamTuple15<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13,
      T14, T15> streams;
  final AsyncWidgetBuilder15<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12,
      T13, T14, T15> builder;
  final InitialDataTuple15<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12,
      T13, T14, T15>? initialData;

  const StreamBuilder15({
    Key? key,
    this.initialData,
    required this.streams,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return MultipleStreamBuilder<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11,
        T12, T13, T14, T15>(
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
        streams.stream11,
        streams.stream12,
        streams.stream13,
        streams.stream14,
        streams.stream15,
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
        initialData?.data11,
        initialData?.data12,
        initialData?.data13,
        initialData?.data14,
        initialData?.data15,
      ),
      builder: (context, snapshots) {
        return builder(
          context,
          SnapshotTuple15(
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
            snapshots.snapshot11!,
            snapshots.snapshot12!,
            snapshots.snapshot13!,
            snapshots.snapshot14!,
            snapshots.snapshot15!,
          ),
        );
      },
    );
  }
}
