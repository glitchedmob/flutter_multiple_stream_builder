import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';

typedef AsyncWidgetBuilder6<T1, T2, T3, T4, T5, T6> = Widget Function(
  BuildContext context,
  Tuple6<AsyncSnapshot<T1>, AsyncSnapshot<T2>, AsyncSnapshot<T3>,
          AsyncSnapshot<T4>, AsyncSnapshot<T5>, AsyncSnapshot<T6>>
      snapshots,
);

/// Wraps the normal [StreamBuilder] widget to allow 6 streams in
/// in the form of a [Tuple6]. Can also accept multiple values for
/// [initialData] using a [Tuple6].
class StreamBuilder6<T1, T2, T3, T4, T5, T6> extends StatelessWidget {
  final Tuple6<Stream<T1>?, Stream<T2>?, Stream<T3>?, Stream<T4>?, Stream<T5>?,
      Stream<T6>?> streams;
  final AsyncWidgetBuilder6<T1, T2, T3, T4, T5, T6> builder;
  final Tuple6<T1, T2, T3, T4, T5, T6>? initialData;

  const StreamBuilder6({
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
                      builder: (_, snapshot5) {
                        return StreamBuilder<T6>(
                          stream: streams.item6,
                          initialData: initialData?.item6,
                          builder: (context, snapshot6) {
                            return builder(
                              context,
                              Tuple6(
                                snapshot1,
                                snapshot2,
                                snapshot3,
                                snapshot4,
                                snapshot5,
                                snapshot6,
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
      },
    );
  }
}
