import 'package:flutter/widgets.dart';

import 'package:multiple_stream_builder/src/utils.dart';

typedef AsyncWidgetBuilder2<T1, T2> = Widget Function(
  BuildContext context,
  AsyncSnapshot<T1> snapshot1,
  AsyncSnapshot<T2> snapshot2,
);

class StreamBuilder2<T1, T2> extends StatelessWidget {
  final List<Stream> streams;
  final AsyncWidgetBuilder2<T1, T2> builder;
  final List initialData;

  const StreamBuilder2({
    Key key,
    this.initialData,
    @required this.streams,
    @required this.builder,
  })  : assert(initialData == null ? true : initialData.length >= 2),
        assert(streams.length == 2),
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
          builder: (context, snapshot2) {
            return builder(
              context,
              snapshot1,
              snapshot2,
            );
          },
        );
      },
    );
  }
}
