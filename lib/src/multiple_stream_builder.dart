import 'package:flutter/widgets.dart';

class StreamTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14,
    T15> {
  final Stream<T1>? stream1;
  final Stream<T2>? stream2;
  final Stream<T3>? stream3;
  final Stream<T4>? stream4;
  final Stream<T5>? stream5;
  final Stream<T6>? stream6;
  final Stream<T7>? stream7;
  final Stream<T8>? stream8;
  final Stream<T9>? stream9;
  final Stream<T10>? stream10;
  final Stream<T11>? stream11;
  final Stream<T12>? stream12;
  final Stream<T13>? stream13;
  final Stream<T14>? stream14;
  final Stream<T15>? stream15;

  StreamTuple([
    this.stream1,
    this.stream2,
    this.stream3,
    this.stream4,
    this.stream5,
    this.stream6,
    this.stream7,
    this.stream8,
    this.stream9,
    this.stream10,
    this.stream11,
    this.stream12,
    this.stream13,
    this.stream14,
    this.stream15,
  ]);
}

class SnapshotTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14,
    T15> {
  final AsyncSnapshot<T1>? snapshot1;
  final AsyncSnapshot<T2>? snapshot2;
  final AsyncSnapshot<T3>? snapshot3;
  final AsyncSnapshot<T4>? snapshot4;
  final AsyncSnapshot<T5>? snapshot5;
  final AsyncSnapshot<T6>? snapshot6;
  final AsyncSnapshot<T7>? snapshot7;
  final AsyncSnapshot<T8>? snapshot8;
  final AsyncSnapshot<T9>? snapshot9;
  final AsyncSnapshot<T10>? snapshot10;
  final AsyncSnapshot<T11>? snapshot11;
  final AsyncSnapshot<T12>? snapshot12;
  final AsyncSnapshot<T13>? snapshot13;
  final AsyncSnapshot<T14>? snapshot14;
  final AsyncSnapshot<T15>? snapshot15;

  SnapshotTuple([
    this.snapshot1,
    this.snapshot2,
    this.snapshot3,
    this.snapshot4,
    this.snapshot5,
    this.snapshot6,
    this.snapshot7,
    this.snapshot8,
    this.snapshot9,
    this.snapshot10,
    this.snapshot11,
    this.snapshot12,
    this.snapshot13,
    this.snapshot14,
    this.snapshot15,
  ]);
}

class InitialDataTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13,
    T14, T15> {
  final T1? data1;
  final T2? data2;
  final T3? data3;
  final T4? data4;
  final T5? data5;
  final T6? data6;
  final T7? data7;
  final T8? data8;
  final T9? data9;
  final T10? data10;
  final T11? data11;
  final T12? data12;
  final T13? data13;
  final T14? data14;
  final T15? data15;

  InitialDataTuple([
    this.data1,
    this.data2,
    this.data3,
    this.data4,
    this.data5,
    this.data6,
    this.data7,
    this.data8,
    this.data9,
    this.data10,
    this.data11,
    this.data12,
    this.data13,
    this.data14,
    this.data15,
  ]);
}

typedef MultipleStreamBuilderWidgetBuilder<T1, T2, T3, T4, T5, T6, T7, T8, T9,
        T10, T11, T12, T13, T14, T15>
    = Widget Function(
  BuildContext context,
  SnapshotTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14,
          T15>
      snapshots,
);

class MultipleStreamBuilder<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12,
    T13, T14, T15> extends StatelessWidget {
  final StreamTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14,
      T15> streams;
  final MultipleStreamBuilderWidgetBuilder<T1, T2, T3, T4, T5, T6, T7, T8, T9,
      T10, T11, T12, T13, T14, T15> builder;
  final InitialDataTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13,
      T14, T15>? initialData;

  const MultipleStreamBuilder({
    Key? key,
    required this.streams,
    required this.builder,
    this.initialData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (streams.stream1 == null || streams.stream2 == null) {
      return builder(context, SnapshotTuple());
    }

    return StreamBuilder<T1>(
      stream: streams.stream1,
      initialData: initialData?.data1,
      builder: (context1, snapshot1) {
        return StreamBuilder<T2>(
          stream: streams.stream2,
          initialData: initialData?.data2,
          builder: (context2, snapshot2) {
            if (streams.stream3 == null) {
              return builder(context2, SnapshotTuple(snapshot1, snapshot2));
            }

            return StreamBuilder<T3>(
              stream: streams.stream3,
              initialData: initialData?.data3,
              builder: (context3, snapshot3) {
                if (streams.stream4 == null) {
                  return builder(
                    context3,
                    SnapshotTuple(snapshot1, snapshot2, snapshot3),
                  );
                }

                return StreamBuilder<T4>(
                  stream: streams.stream4,
                  initialData: initialData?.data4,
                  builder: (context4, snapshot4) {
                    if (streams.stream5 == null) {
                      return builder(
                          context4,
                          SnapshotTuple(
                            snapshot1,
                            snapshot2,
                            snapshot3,
                            snapshot4,
                          ));
                    }

                    return StreamBuilder<T5>(
                      stream: streams.stream5,
                      initialData: initialData?.data5,
                      builder: (context5, snapshot5) {
                        if (streams.stream6 == null) {
                          return builder(
                              context5,
                              SnapshotTuple(
                                snapshot1,
                                snapshot2,
                                snapshot3,
                                snapshot4,
                                snapshot5,
                              ));
                        }

                        return StreamBuilder<T6>(
                          stream: streams.stream6,
                          initialData: initialData?.data6,
                          builder: (context6, snapshot6) {
                            if (streams.stream7 == null) {
                              return builder(
                                  context6,
                                  SnapshotTuple(
                                    snapshot1,
                                    snapshot2,
                                    snapshot3,
                                    snapshot4,
                                    snapshot5,
                                    snapshot6,
                                  ));
                            }

                            return StreamBuilder<T7>(
                              stream: streams.stream7,
                              initialData: initialData?.data7,
                              builder: (context7, snapshot7) {
                                if (streams.stream8 == null) {
                                  return builder(
                                      context7,
                                      SnapshotTuple(
                                        snapshot1,
                                        snapshot2,
                                        snapshot3,
                                        snapshot4,
                                        snapshot5,
                                        snapshot6,
                                        snapshot7,
                                      ));
                                }

                                return StreamBuilder<T8>(
                                  stream: streams.stream8,
                                  initialData: initialData?.data8,
                                  builder: (context8, snapshot8) {
                                    if (streams.stream9 == null) {
                                      return builder(
                                          context8,
                                          SnapshotTuple(
                                            snapshot1,
                                            snapshot2,
                                            snapshot3,
                                            snapshot4,
                                            snapshot5,
                                            snapshot6,
                                            snapshot7,
                                            snapshot8,
                                          ));
                                    }

                                    return StreamBuilder<T9>(
                                      stream: streams.stream9,
                                      initialData: initialData?.data9,
                                      builder: (context9, snapshot9) {
                                        if (streams.stream10 == null) {
                                          return builder(
                                              context9,
                                              SnapshotTuple(
                                                snapshot1,
                                                snapshot2,
                                                snapshot3,
                                                snapshot4,
                                                snapshot5,
                                                snapshot6,
                                                snapshot7,
                                                snapshot8,
                                                snapshot9,
                                              ));
                                        }

                                        return StreamBuilder<T10>(
                                          stream: streams.stream10,
                                          initialData: initialData?.data10,
                                          builder: (context10, snapshot10) {
                                            if (streams.stream11 == null) {
                                              return builder(
                                                  context10,
                                                  SnapshotTuple(
                                                    snapshot1,
                                                    snapshot2,
                                                    snapshot3,
                                                    snapshot4,
                                                    snapshot5,
                                                    snapshot6,
                                                    snapshot7,
                                                    snapshot8,
                                                    snapshot9,
                                                    snapshot10,
                                                  ));
                                            }

                                            return StreamBuilder<T11>(
                                              stream: streams.stream11,
                                              initialData: initialData?.data11,
                                              builder: (context11, snapshot11) {
                                                if (streams.stream12 == null) {
                                                  return builder(
                                                      context11,
                                                      SnapshotTuple(
                                                        snapshot1,
                                                        snapshot2,
                                                        snapshot3,
                                                        snapshot4,
                                                        snapshot5,
                                                        snapshot6,
                                                        snapshot7,
                                                        snapshot8,
                                                        snapshot9,
                                                        snapshot10,
                                                        snapshot11,
                                                      ));
                                                }

                                                return StreamBuilder<T12>(
                                                  stream: streams.stream12,
                                                  initialData:
                                                      initialData?.data12,
                                                  builder:
                                                      (context12, snapshot12) {
                                                    if (streams.stream13 ==
                                                        null) {
                                                      return builder(
                                                          context12,
                                                          SnapshotTuple(
                                                            snapshot1,
                                                            snapshot2,
                                                            snapshot3,
                                                            snapshot4,
                                                            snapshot5,
                                                            snapshot6,
                                                            snapshot7,
                                                            snapshot8,
                                                            snapshot9,
                                                            snapshot10,
                                                            snapshot11,
                                                            snapshot12,
                                                          ));
                                                    }

                                                    return StreamBuilder<T13>(
                                                      stream: streams.stream13,
                                                      initialData:
                                                          initialData?.data13,
                                                      builder: (context13,
                                                          snapshot13) {
                                                        if (streams.stream14 ==
                                                            null) {
                                                          return builder(
                                                              context13,
                                                              SnapshotTuple(
                                                                snapshot1,
                                                                snapshot2,
                                                                snapshot3,
                                                                snapshot4,
                                                                snapshot5,
                                                                snapshot6,
                                                                snapshot7,
                                                                snapshot8,
                                                                snapshot9,
                                                                snapshot10,
                                                                snapshot11,
                                                                snapshot12,
                                                                snapshot13,
                                                              ));
                                                        }

                                                        return StreamBuilder<
                                                            T14>(
                                                          stream:
                                                              streams.stream14,
                                                          initialData:
                                                              initialData
                                                                  ?.data14,
                                                          builder: (context14,
                                                              snapshot14) {
                                                            if (streams
                                                                    .stream15 ==
                                                                null) {
                                                              return builder(
                                                                  context14,
                                                                  SnapshotTuple(
                                                                    snapshot1,
                                                                    snapshot2,
                                                                    snapshot3,
                                                                    snapshot4,
                                                                    snapshot5,
                                                                    snapshot6,
                                                                    snapshot7,
                                                                    snapshot8,
                                                                    snapshot9,
                                                                    snapshot10,
                                                                    snapshot11,
                                                                    snapshot12,
                                                                    snapshot13,
                                                                    snapshot14,
                                                                  ));
                                                            }

                                                            return StreamBuilder<
                                                                T15>(
                                                              stream: streams
                                                                  .stream15,
                                                              initialData:
                                                                  initialData
                                                                      ?.data15,
                                                              builder: (context15,
                                                                  snapshot15) {
                                                                return builder(
                                                                    context15,
                                                                    SnapshotTuple(
                                                                      snapshot1,
                                                                      snapshot2,
                                                                      snapshot3,
                                                                      snapshot4,
                                                                      snapshot5,
                                                                      snapshot6,
                                                                      snapshot7,
                                                                      snapshot8,
                                                                      snapshot9,
                                                                      snapshot10,
                                                                      snapshot11,
                                                                      snapshot12,
                                                                      snapshot13,
                                                                      snapshot14,
                                                                      snapshot15,
                                                                    ));
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
              },
            );
          },
        );
      },
    );
  }
}
