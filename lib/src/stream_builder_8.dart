import 'package:flutter/widgets.dart';
import 'package:multiple_stream_builder/src/multiple_stream_builder.dart';

class StreamTuple8<T1, T2, T3, T4, T5, T6, T7, T8> {
  final Stream<T1> stream1;
  final Stream<T2> stream2;
  final Stream<T3> stream3;
  final Stream<T4> stream4;
  final Stream<T5> stream5;
  final Stream<T6> stream6;
  final Stream<T7> stream7;
  final Stream<T8> stream8;

  StreamTuple8(
    this.stream1,
    this.stream2,
    this.stream3,
    this.stream4,
    this.stream5,
    this.stream6,
    this.stream7,
    this.stream8,
  );
}

class SnapshotTuple8<T1, T2, T3, T4, T5, T6, T7, T8> {
  final AsyncSnapshot<T1> snapshot1;
  final AsyncSnapshot<T2> snapshot2;
  final AsyncSnapshot<T3> snapshot3;
  final AsyncSnapshot<T4> snapshot4;
  final AsyncSnapshot<T5> snapshot5;
  final AsyncSnapshot<T6> snapshot6;
  final AsyncSnapshot<T7> snapshot7;
  final AsyncSnapshot<T8> snapshot8;

  SnapshotTuple8(
    this.snapshot1,
    this.snapshot2,
    this.snapshot3,
    this.snapshot4,
    this.snapshot5,
    this.snapshot6,
    this.snapshot7,
    this.snapshot8,
  );
}

class InitialDataTuple8<T1, T2, T3, T4, T5, T6, T7, T8> {
  final T1? data1;
  final T2? data2;
  final T3? data3;
  final T4? data4;
  final T5? data5;
  final T6? data6;
  final T7? data7;
  final T8? data8;

  InitialDataTuple8([
    this.data1,
    this.data2,
    this.data3,
    this.data4,
    this.data5,
    this.data6,
    this.data7,
    this.data8,
  ]);
}

typedef AsyncWidgetBuilder8<T1, T2, T3, T4, T5, T6, T7, T8> = Widget Function(
  BuildContext context,
  SnapshotTuple8<T1, T2, T3, T4, T5, T6, T7, T8> snapshots,
);

/// Wraps the normal [StreamBuilder] widget to allow 8 streams in
/// in the form of a [StreamTuple8]. Can also accept multiple values for
/// [initialData] using a [InitialDataTuple8].
class StreamBuilder8<T1, T2, T3, T4, T5, T6, T7, T8> extends StatelessWidget {
  final StreamTuple8<T1, T2, T3, T4, T5, T6, T7, T8> streams;
  final AsyncWidgetBuilder8<T1, T2, T3, T4, T5, T6, T7, T8> builder;
  final InitialDataTuple8<T1, T2, T3, T4, T5, T6, T7, T8>? initialData;

  const StreamBuilder8({
    Key? key,
    this.initialData,
    required this.streams,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return MultipleStreamBuilder<T1, T2, T3, T4, T5, T6, T7, T8, dynamic,
        dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>(
      streams: StreamTuple(
        streams.stream1,
        streams.stream2,
        streams.stream3,
        streams.stream4,
        streams.stream5,
        streams.stream6,
        streams.stream7,
        streams.stream8,
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
      ),
      builder: (context, snapshots) {
        return builder(
          context,
          SnapshotTuple8(
            snapshots.snapshot1!,
            snapshots.snapshot2!,
            snapshots.snapshot3!,
            snapshots.snapshot4!,
            snapshots.snapshot5!,
            snapshots.snapshot6!,
            snapshots.snapshot7!,
            snapshots.snapshot8!,
          ),
        );
      },
    );
  }
}
