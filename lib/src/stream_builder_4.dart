import 'package:flutter/widgets.dart';
import 'package:multiple_stream_builder/src/multiple_stream_builder.dart';

/// Wrapper for 4 [Stream]s. Intended to be used with [StreamBuilder4]
class StreamTuple4<T1, T2, T3, T4> {
  /// returns the first stream of the tuple
  final Stream<T1> stream1;

  /// returns the second stream of the tuple
  final Stream<T2> stream2;

  /// returns the third stream of the tuple
  final Stream<T3> stream3;

  /// returns the fourth stream of the tuple
  final Stream<T4> stream4;

  StreamTuple4(
    this.stream1,
    this.stream2,
    this.stream3,
    this.stream4,
  );
}

/// Wrapper for 4 [AsyncSnapshot]s Intended to be used with [StreamBuilder4]
class SnapshotTuple4<T1, T2, T3, T4> {
  /// returns the first snapshot of the tuple
  final AsyncSnapshot<T1> snapshot1;

  /// returns the second snapshot of the tuple
  final AsyncSnapshot<T2> snapshot2;

  /// returns the third snapshot of the tuple
  final AsyncSnapshot<T3> snapshot3;

  /// returns the fourth snapshot of the tuple
  final AsyncSnapshot<T4> snapshot4;

  SnapshotTuple4(
    this.snapshot1,
    this.snapshot2,
    this.snapshot3,
    this.snapshot4,
  );
}

/// Wrapper for 4 `initialData` values for [StreamBuilder4]
class InitialDataTuple4<T1, T2, T3, T4> {
  /// returns the first item of the tuple
  final T1? data1;

  /// returns the second item of the tuple
  final T2? data2;

  /// returns the third item of the tuple
  final T3? data3;

  /// returns the fourth item of the tuple
  final T4? data4;

  InitialDataTuple4([
    this.data1,
    this.data2,
    this.data3,
    this.data4,
  ]);
}

/// A variant of [AsyncWidgetBuilder] that uses [SnapshotTuple4]
typedef AsyncWidgetBuilder4<T1, T2, T3, T4> = Widget Function(
  BuildContext context,
  SnapshotTuple4<T1, T2, T3, T4> snapshots,
);

/// Wraps the normal [StreamBuilder] widget to allow 4 streams in
/// in the form of a [StreamTuple4]. Can also accept multiple values for
/// [initialData] using a [InitialDataTuple4].
class StreamBuilder4<T1, T2, T3, T4> extends StatelessWidget {
  /// Collection of streams for this widget to listen to.
  /// New data in any stream triggers [builder] to rerun
  final StreamTuple4<T1, T2, T3, T4> streams;

  /// A builder that gets passed multiple snapshots.
  /// see [StreamBuilder.builder] for more info
  final AsyncWidgetBuilder4<T1, T2, T3, T4> builder;

  /// Initial data for when the [streams] don't have any.
  /// see [StreamBuilder.initialData] for more info
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
      initialData: InitialDataTuple(
        initialData?.data1,
        initialData?.data2,
        initialData?.data3,
        initialData?.data4,
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
