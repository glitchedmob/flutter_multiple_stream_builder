import 'package:flutter/widgets.dart';

import 'package:multiple_stream_builder/src/utils.dart';

typedef AsyncWidgetBuilder6<T1, T2, T3, T4, T5, T6> = Widget Function(
  BuildContext context,
  AsyncSnapshot<T1> snapshot1,
  AsyncSnapshot<T2> snapshot2,
  AsyncSnapshot<T3> snapshot3,
  AsyncSnapshot<T4> snapshot4,
  AsyncSnapshot<T5> snapshot5,
  AsyncSnapshot<T6> snapshot6,
);

class StreamBuilder6<T1, T2, T3, T4, T5, T6> extends StatelessWidget {
  final List<Stream> streams;
  final AsyncWidgetBuilder6<T1, T2, T3, T4, T5, T6> builder;
  final List initialData;

  const StreamBuilder6({
    Key key,
    this.initialData,
    @required this.streams,
    @required this.builder,
  })  : assert(initialData == null ? true : initialData.length >= 6),
        assert(streams.length == 6),
        assert(builder != null);

  @override
  Widget build(BuildContext _) {
    return StreamBuilder<T1>(
      stream: streams[0],
      initialData: initialData?.tryGet(0) as T1,
      builder: (_, snapshot1) {
        return StreamBuilder<T2>(
          stream: streams[1],
          initialData: initialData?.tryGet(1) as T2,
          builder: (_, snapshot2) {
            return StreamBuilder<T3>(
              stream: streams[2],
              initialData: initialData?.tryGet(2) as T3,
              builder: (_, snapshot3) {
                return StreamBuilder<T4>(
                  stream: streams[3],
                  initialData: initialData?.tryGet(3) as T4,
                  builder: (_, snapshot4) {
                    return StreamBuilder<T5>(
                      stream: streams[4],
                      initialData: initialData?.tryGet(4) as T5,
                      builder: (_, snapshot5) {
                        return StreamBuilder<T6>(
                          stream: streams[5],
                          initialData: initialData?.tryGet(5) as T6,
                          builder: (context, snapshot6) {
                            return builder(
                              context,
                              snapshot1,
                              snapshot2,
                              snapshot3,
                              snapshot4,
                              snapshot5,
                              snapshot6,
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
