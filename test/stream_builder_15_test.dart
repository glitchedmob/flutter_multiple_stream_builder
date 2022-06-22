import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

void main() {
  var streamController1 = StreamController<int>();
  var streamController2 = StreamController<int>();
  var streamController3 = StreamController<int>();
  var streamController4 = StreamController<int>();
  var streamController5 = StreamController<int>();
  var streamController6 = StreamController<int>();
  var streamController7 = StreamController<int>();
  var streamController8 = StreamController<int>();
  var streamController9 = StreamController<int>();
  var streamController10 = StreamController<int>();
  var streamController11 = StreamController<int>();
  var streamController12 = StreamController<int>();
  var streamController13 = StreamController<int>();
  var streamController14 = StreamController<int>();
  var streamController15 = StreamController<int>();

  var snapshot1Values = <int?>[];
  var snapshot2Values = <int?>[];
  var snapshot3Values = <int?>[];
  var snapshot4Values = <int?>[];
  var snapshot5Values = <int?>[];
  var snapshot6Values = <int?>[];
  var snapshot7Values = <int?>[];
  var snapshot8Values = <int?>[];
  var snapshot9Values = <int?>[];
  var snapshot10Values = <int?>[];
  var snapshot11Values = <int?>[];
  var snapshot12Values = <int?>[];
  var snapshot13Values = <int?>[];
  var snapshot14Values = <int?>[];
  var snapshot15Values = <int?>[];

  setUp(() {
    streamController1 = StreamController<int>();
    streamController2 = StreamController<int>();
    streamController3 = StreamController<int>();
    streamController4 = StreamController<int>();
    streamController5 = StreamController<int>();
    streamController6 = StreamController<int>();
    streamController7 = StreamController<int>();
    streamController8 = StreamController<int>();
    streamController9 = StreamController<int>();
    streamController10 = StreamController<int>();
    streamController11 = StreamController<int>();
    streamController12 = StreamController<int>();
    streamController13 = StreamController<int>();
    streamController14 = StreamController<int>();
    streamController15 = StreamController<int>();

    snapshot1Values = <int?>[];
    snapshot2Values = <int?>[];
    snapshot3Values = <int?>[];
    snapshot4Values = <int?>[];
    snapshot5Values = <int?>[];
    snapshot6Values = <int?>[];
    snapshot7Values = <int?>[];
    snapshot8Values = <int?>[];
    snapshot9Values = <int?>[];
    snapshot10Values = <int?>[];
    snapshot11Values = <int?>[];
    snapshot12Values = <int?>[];
    snapshot13Values = <int?>[];
    snapshot14Values = <int?>[];
    snapshot15Values = <int?>[];
  });

  testWidgets('StreamBuilder15 rebuilds with stream updates', (tester) async {
    await tester.pumpWidget(
      StreamBuilder15<int, int, int, int, int, int, int, int, int, int, int,
          int, int, int, int>(
        streams: StreamTuple15(
          streamController1.stream,
          streamController2.stream,
          streamController3.stream,
          streamController4.stream,
          streamController5.stream,
          streamController6.stream,
          streamController7.stream,
          streamController8.stream,
          streamController9.stream,
          streamController10.stream,
          streamController11.stream,
          streamController12.stream,
          streamController13.stream,
          streamController14.stream,
          streamController15.stream,
        ),
        builder: (context, snapshots) {
          snapshot1Values.add(snapshots.snapshot1.data);
          snapshot2Values.add(snapshots.snapshot2.data);
          snapshot3Values.add(snapshots.snapshot3.data);
          snapshot4Values.add(snapshots.snapshot4.data);
          snapshot5Values.add(snapshots.snapshot5.data);
          snapshot6Values.add(snapshots.snapshot6.data);
          snapshot7Values.add(snapshots.snapshot7.data);
          snapshot8Values.add(snapshots.snapshot8.data);
          snapshot9Values.add(snapshots.snapshot9.data);
          snapshot10Values.add(snapshots.snapshot10.data);
          snapshot11Values.add(snapshots.snapshot11.data);
          snapshot12Values.add(snapshots.snapshot12.data);
          snapshot13Values.add(snapshots.snapshot13.data);
          snapshot14Values.add(snapshots.snapshot14.data);
          snapshot15Values.add(snapshots.snapshot15.data);
          return Container();
        },
      ),
    );

    expect(snapshot1Values, equals([null]));
    expect(snapshot2Values, equals([null]));
    expect(snapshot3Values, equals([null]));
    expect(snapshot4Values, equals([null]));
    expect(snapshot5Values, equals([null]));
    expect(snapshot6Values, equals([null]));
    expect(snapshot7Values, equals([null]));
    expect(snapshot8Values, equals([null]));
    expect(snapshot9Values, equals([null]));
    expect(snapshot10Values, equals([null]));
    expect(snapshot11Values, equals([null]));
    expect(snapshot12Values, equals([null]));
    expect(snapshot13Values, equals([null]));
    expect(snapshot14Values, equals([null]));
    expect(snapshot15Values, equals([null]));

    streamController1.add(1);
    streamController2.add(2);
    streamController3.add(3);
    streamController4.add(4);
    streamController5.add(5);
    streamController6.add(6);
    streamController7.add(7);
    streamController8.add(8);
    streamController9.add(9);
    streamController10.add(10);
    streamController11.add(11);
    streamController12.add(12);
    streamController13.add(13);
    streamController14.add(14);
    streamController15.add(15);

    await tester.pumpAndSettle();

    expect(snapshot1Values, equals([null, 1]));
    expect(snapshot2Values, equals([null, 2]));
    expect(snapshot3Values, equals([null, 3]));
    expect(snapshot4Values, equals([null, 4]));
    expect(snapshot5Values, equals([null, 5]));
    expect(snapshot6Values, equals([null, 6]));
    expect(snapshot7Values, equals([null, 7]));
    expect(snapshot8Values, equals([null, 8]));
    expect(snapshot9Values, equals([null, 9]));
    expect(snapshot10Values, equals([null, 10]));
    expect(snapshot11Values, equals([null, 11]));
    expect(snapshot12Values, equals([null, 12]));
    expect(snapshot13Values, equals([null, 13]));
    expect(snapshot14Values, equals([null, 14]));
    expect(snapshot15Values, equals([null, 15]));
  });

  testWidgets('StreamBuilder15 handles initialData', (tester) async {
    await tester.pumpWidget(
      StreamBuilder15<int, int, int, int, int, int, int, int, int, int, int,
          int, int, int, int>(
        streams: StreamTuple15(
          streamController1.stream,
          streamController2.stream,
          streamController3.stream,
          streamController4.stream,
          streamController5.stream,
          streamController6.stream,
          streamController7.stream,
          streamController8.stream,
          streamController9.stream,
          streamController10.stream,
          streamController11.stream,
          streamController12.stream,
          streamController13.stream,
          streamController14.stream,
          streamController15.stream,
        ),
        initialData: InitialDataTuple15(
            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15),
        builder: (context, snapshots) {
          snapshot1Values.add(snapshots.snapshot1.data);
          snapshot2Values.add(snapshots.snapshot2.data);
          snapshot3Values.add(snapshots.snapshot3.data);
          snapshot4Values.add(snapshots.snapshot4.data);
          snapshot5Values.add(snapshots.snapshot5.data);
          snapshot6Values.add(snapshots.snapshot6.data);
          snapshot7Values.add(snapshots.snapshot7.data);
          snapshot8Values.add(snapshots.snapshot8.data);
          snapshot9Values.add(snapshots.snapshot9.data);
          snapshot10Values.add(snapshots.snapshot10.data);
          snapshot11Values.add(snapshots.snapshot11.data);
          snapshot12Values.add(snapshots.snapshot12.data);
          snapshot13Values.add(snapshots.snapshot13.data);
          snapshot14Values.add(snapshots.snapshot14.data);
          snapshot15Values.add(snapshots.snapshot15.data);
          return Container();
        },
      ),
    );

    expect(snapshot1Values, equals([1]));
    expect(snapshot2Values, equals([2]));
    expect(snapshot3Values, equals([3]));
    expect(snapshot4Values, equals([4]));
    expect(snapshot5Values, equals([5]));
    expect(snapshot6Values, equals([6]));
    expect(snapshot7Values, equals([7]));
    expect(snapshot8Values, equals([8]));
    expect(snapshot9Values, equals([9]));
    expect(snapshot10Values, equals([10]));
    expect(snapshot11Values, equals([11]));
    expect(snapshot12Values, equals([12]));
    expect(snapshot13Values, equals([13]));
    expect(snapshot14Values, equals([14]));
    expect(snapshot15Values, equals([15]));

    streamController1.add(1);
    streamController2.add(2);
    streamController3.add(3);
    streamController4.add(4);
    streamController5.add(5);
    streamController6.add(6);
    streamController7.add(7);
    streamController8.add(8);
    streamController9.add(9);
    streamController10.add(10);
    streamController11.add(11);
    streamController12.add(12);
    streamController13.add(13);
    streamController14.add(14);
    streamController15.add(15);

    await tester.pumpAndSettle();

    expect(snapshot1Values, equals([1, 1]));
    expect(snapshot2Values, equals([2, 2]));
    expect(snapshot3Values, equals([3, 3]));
    expect(snapshot4Values, equals([4, 4]));
    expect(snapshot5Values, equals([5, 5]));
    expect(snapshot6Values, equals([6, 6]));
    expect(snapshot7Values, equals([7, 7]));
    expect(snapshot8Values, equals([8, 8]));
    expect(snapshot9Values, equals([9, 9]));
    expect(snapshot10Values, equals([10, 10]));
    expect(snapshot11Values, equals([11, 11]));
    expect(snapshot12Values, equals([12, 12]));
    expect(snapshot13Values, equals([13, 13]));
    expect(snapshot14Values, equals([14, 14]));
    expect(snapshot15Values, equals([15, 15]));
  });
}
