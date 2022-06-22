import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

void main() {
  var streamController1 = StreamController<int>();
  var streamController2 = StreamController<int>();
  var streamController3 = StreamController<int>();

  var snapshot1Values = <int?>[];
  var snapshot2Values = <int?>[];
  var snapshot3Values = <int?>[];

  setUp(() {
    streamController1 = StreamController<int>();
    streamController2 = StreamController<int>();
    streamController3 = StreamController<int>();

    snapshot1Values = <int?>[];
    snapshot2Values = <int?>[];
    snapshot3Values = <int?>[];
  });

  testWidgets('StreamBuilder3 rebuilds with stream updates', (tester) async {
    await tester.pumpWidget(
      StreamBuilder3<int, int, int>(
        streams: StreamTuple3(
          streamController1.stream,
          streamController2.stream,
          streamController3.stream,
        ),
        builder: (context, snapshots) {
          snapshot1Values.add(snapshots.snapshot1.data);
          snapshot2Values.add(snapshots.snapshot2.data);
          snapshot3Values.add(snapshots.snapshot3.data);
          return Container();
        },
      ),
    );

    expect(snapshot1Values, equals([null]));
    expect(snapshot2Values, equals([null]));
    expect(snapshot3Values, equals([null]));

    streamController1.add(1);
    streamController2.add(2);
    streamController3.add(3);

    await tester.pumpAndSettle();

    expect(snapshot1Values, equals([null, 1]));
    expect(snapshot2Values, equals([null, 2]));
    expect(snapshot3Values, equals([null, 3]));
  });

  testWidgets('StreamBuilder3 handles initialData', (tester) async {
    await tester.pumpWidget(
      StreamBuilder3<int, int, int>(
        streams: StreamTuple3(
          streamController1.stream,
          streamController2.stream,
          streamController3.stream,
        ),
        initialData: InitialDataTuple3(1, 2, 3),
        builder: (context, snapshots) {
          snapshot1Values.add(snapshots.snapshot1.data);
          snapshot2Values.add(snapshots.snapshot2.data);
          snapshot3Values.add(snapshots.snapshot3.data);
          return Container();
        },
      ),
    );

    expect(snapshot1Values, equals([1]));
    expect(snapshot2Values, equals([2]));
    expect(snapshot3Values, equals([3]));

    streamController1.add(1);
    streamController2.add(2);
    streamController3.add(3);

    await tester.pumpAndSettle();

    expect(snapshot1Values, equals([1, 1]));
    expect(snapshot2Values, equals([2, 2]));
    expect(snapshot3Values, equals([3, 3]));
  });
}
