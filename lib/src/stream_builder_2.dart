import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';

class StreamBuilderStreams2<T1, T2> {
  final Stream<T1>? stream1;
  final Stream<T1>? stream2;

  StreamBuilderStreams2(this.stream1, this.stream2);
}

class StreamBuilderInitial2<T1, T2> {
  final T1 data1;
  final T2 data2;

  StreamBuilderInitial2(this.data1, this.data2);
}

class StreamBuilderSnapshots2<T1, T2> {
  final AsyncSnapshot<T1> snapshot1;
  final AsyncSnapshot<T2> snapshot2;

  StreamBuilderSnapshots2(this.snapshot1, this.snapshot2);
}

typedef AsyncWidgetBuilder2<T1, T2> = Widget Function(
  BuildContext context,
  StreamBuilderSnapshots2<T1, T2> snapshots,
);

/// Wraps the normal [StreamBuilder] widget to allow 2 streams in
/// in the form of a [Tuple2]. Can also accept multiple values for
/// [initialData] using a [Tuple2].
class StreamBuilder2<T1, T2> extends StatelessWidget {
  final Tuple2<Stream<T1>?, Stream<T2>?> streams;
  final AsyncWidgetBuilder2<T1, T2> builder;
  final Tuple2<T1, T2>? initialData;

  const StreamBuilder2({
    Key? key,
    this.initialData,
    required this.streams,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return StreamBuilder<T1>(
      stream: streams.item1,
      initialData: initialData?.item1,
      builder: (_, snapshot1) {
        return StreamBuilder<T2>(
          stream: streams.item2,
          initialData: initialData?.item2,
          builder: (context, snapshot2) {
            return builder(
              context,
              StreamBuilderSnapshots2(snapshot1, snapshot2),
            );
          },
        );
      },
    );
  }
}
