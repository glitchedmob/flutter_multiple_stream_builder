import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';

typedef AsyncWidgetBuilder2<T1, T2> = Widget Function(
  BuildContext context,
  Tuple2<AsyncSnapshot<T1>, AsyncSnapshot<T2>> snapshots,
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
  });

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
            return builder(context, Tuple2(snapshot1, snapshot2));
          },
        );
      },
    );
  }
}
