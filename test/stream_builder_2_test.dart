import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

void main() {
  var streamController1 = StreamController<int>();
  var streamController2 = StreamController<int>();

  var snapshot1Values = <int?>[];
  var snapshot2Values = <int?>[];

  setUp(() {
    streamController1 = StreamController<int>();
    streamController2 = StreamController<int>();

    snapshot1Values = <int?>[];
    snapshot2Values = <int?>[];
  });

  testWidgets('StreamBuilder2 rebuilds with stream updates', (tester) async {
    await tester.pumpWidget(
      StreamBuilder2<int, int>(
        streams: StreamTuple2(
          streamController1.stream,
          streamController2.stream,
        ),
        builder: (context, snapshots) {
          snapshot1Values.add(snapshots.snapshot1.data);
          snapshot2Values.add(snapshots.snapshot2.data);
          return Container();
        },
      ),
    );

    expect(snapshot1Values, equals([null]));
    expect(snapshot2Values, equals([null]));

    streamController1.add(1);
    streamController2.add(2);

    await tester.pumpAndSettle();

    expect(snapshot1Values, equals([null, 1]));
    expect(snapshot2Values, equals([null, 2]));
  });

  testWidgets('StreamBuilder2 handles initialData', (tester) async {
    await tester.pumpWidget(
      StreamBuilder2<int, int>(
        streams: StreamTuple2(
          streamController1.stream,
          streamController2.stream,
        ),
        initialData: InitialDataTuple2(1, 2),
        builder: (context, snapshots) {
          snapshot1Values.add(snapshots.snapshot1.data);
          snapshot2Values.add(snapshots.snapshot2.data);
          return Container();
        },
      ),
    );

    expect(snapshot1Values, equals([1]));
    expect(snapshot2Values, equals([2]));

    streamController1.add(1);
    streamController2.add(2);

    await tester.pumpAndSettle();

    expect(snapshot1Values, equals([1, 1]));
    expect(snapshot2Values, equals([2, 2]));
  });
}
