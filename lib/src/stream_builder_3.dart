import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';

typedef AsyncWidgetBuilder3<T1, T2, T3> = Widget Function(
  BuildContext context,
  Tuple3<AsyncSnapshot<T1>, AsyncSnapshot<T2>, AsyncSnapshot<T3>> snapshots,
);

/// Wraps the normal [StreamBuilder] widget to allow 3 streams in
/// in the form of a [Tuple3]. Can also accept multiple values for
/// [initialData] using a [Tuple3].
class StreamBuilder3<T1, T2, T3> extends StatelessWidget {
  final Tuple3<Stream<T1>, Stream<T2>, Stream<T3>> streams;
  final AsyncWidgetBuilder3<T1, T2, T3> builder;
  final Tuple3<T1, T2, T3> initialData;

  const StreamBuilder3({
    Key key,
    this.initialData,
    @required this.streams,
    @required this.builder,
  })  : assert(streams != null),
        assert(builder != null);

  @override
  Widget build(BuildContext _) {
    return StreamBuilder<T1>(
      stream: streams.item1,
      initialData: initialData?.item1,
      builder: (_, snapshot1) {
        return StreamBuilder<T2>(
          stream: streams.item2,
          initialData: initialData?.item2,
          builder: (_, snapshot2) {
            return StreamBuilder<T3>(
              stream: streams.item3,
              initialData: initialData?.item3,
              builder: (context, snapshot3) {
                return builder(
                  context,
                  Tuple3(snapshot1, snapshot2, snapshot3),
                );
              },
            );
          },
        );
      },
    );
  }
}
