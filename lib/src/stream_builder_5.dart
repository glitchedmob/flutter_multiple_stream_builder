import 'package:flutter/widgets.dart';

import 'package:multiple_stream_builder/src/utils.dart';

typedef AsyncWidgetBuilder5<T1, T2, T3, T4, T5> = Widget Function(
  BuildContext context,
  AsyncSnapshot<T1> snapshot1,
  AsyncSnapshot<T2> snapshot2,
  AsyncSnapshot<T3> snapshot3,
  AsyncSnapshot<T4> snapshot4,
  AsyncSnapshot<T5> snapshot5,
);

class StreamBuilder5<T1, T2, T3, T4, T5> extends StatelessWidget {
  final List<Stream> streams;
  final AsyncWidgetBuilder5<T1, T2, T3, T4, T5> builder;
  final List initialData;

  const StreamBuilder5({
    Key key,
    this.initialData,
    @required this.streams,
    @required this.builder,
  })  : assert(initialData == null ? true : initialData.length >= 5),
        assert(streams.length == 5),
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
                      builder: (context, snapshot5) {
                        return builder(
                          context,
                          snapshot1,
                          snapshot2,
                          snapshot3,
                          snapshot4,
                          snapshot5,
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
