import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';

typedef AsyncWidgetBuilder4<T1, T2, T3, T4> = Widget Function(
  BuildContext context,
  Tuple4<AsyncSnapshot<T1>, AsyncSnapshot<T2>, AsyncSnapshot<T3>,
          AsyncSnapshot<T4>>
      snapshots,
);

/// Wraps the normal [StreamBuilder] widget to allow 4 [Stream[s in
/// in the form of a [Tuple4]. Can also accept multiple values for
/// [initialData] using a [Tuple4].
class StreamBuilder4<T1, T2, T3, T4> extends StatelessWidget {
  final Tuple4<Stream<T1>, Stream<T2>, Stream<T3>, Stream<T4>> streams;
  final AsyncWidgetBuilder4<T1, T2, T3, T4> builder;
  final Tuple4<T1, T2, T3, T4> initialData;

  const StreamBuilder4({
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
              builder: (_, snapshot3) {
                return StreamBuilder<T4>(
                  stream: streams.item4,
                  initialData: initialData?.item4,
                  builder: (context, snapshot4) {
                    return builder(
                      context,
                      Tuple4(snapshot1, snapshot2, snapshot3, snapshot4),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
