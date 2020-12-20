import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';

typedef AsyncWidgetBuilder5<T1, T2, T3, T4, T5> = Widget Function(
  BuildContext context,
  Tuple5<AsyncSnapshot<T1>, AsyncSnapshot<T2>, AsyncSnapshot<T3>,
          AsyncSnapshot<T4>, AsyncSnapshot<T5>>
      snapshots,
);

/// Wraps the normal [StreamBuilder] widget to allow 5 streams in
/// in the form of a [Tuple5]. Can also accept multiple values for
/// [initialData] using a [Tuple5].
class StreamBuilder5<T1, T2, T3, T4, T5> extends StatelessWidget {
  final Tuple5<Stream<T1>, Stream<T2>, Stream<T3>, Stream<T4>, Stream<T5>>
      streams;
  final AsyncWidgetBuilder5<T1, T2, T3, T4, T5> builder;
  final Tuple5<T1, T2, T3, T4, T5> initialData;

  const StreamBuilder5({
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
                  builder: (_, snapshot4) {
                    return StreamBuilder<T5>(
                      stream: streams.item5,
                      initialData: initialData?.item5,
                      builder: (context, snapshot5) {
                        return builder(
                          context,
                          Tuple5(
                            snapshot1,
                            snapshot2,
                            snapshot3,
                            snapshot4,
                            snapshot5,
                          ),
                        );
                      },
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
