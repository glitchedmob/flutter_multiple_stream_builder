import 'package:flutter/widgets.dart';

import 'package:multiple_stream_builder/src/utils.dart';

typedef AsyncWidgetBuilder3<T1, T2, T3> = Widget Function(
  BuildContext context,
  AsyncSnapshot<T1> snapshot1,
  AsyncSnapshot<T2> snapshot2,
  AsyncSnapshot<T3> snapshot3,
);

class StreamBuilder3<T1, T2, T3> extends StatelessWidget {
  final List<Stream> streams;
  final AsyncWidgetBuilder3<T1, T2, T3> builder;
  final List initialData;

  const StreamBuilder3({
    Key key,
    this.initialData,
    @required this.streams,
    @required this.builder,
  })  : assert(initialData == null ? true : initialData.length >= 3),
        assert(streams.length == 3),
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
              builder: (context, snapshot3) {
                return builder(
                  context,
                  snapshot1,
                  snapshot2,
                  snapshot3,
                );
              },
            );
          },
        );
      },
    );
  }
}
