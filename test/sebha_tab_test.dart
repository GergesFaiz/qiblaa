import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qiblaa/ui/home/tabs/Sebha/sebha_tab.dart';

/// A minimal valid 1x1 transparent PNG used to satisfy Image.asset calls
/// inside widget tests without needing the real asset files.
const List<int> _kTransparentPng = <int>[
  0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D,
  0x49, 0x48, 0x44, 0x52, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
  0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4, 0x89, 0x00, 0x00, 0x00,
  0x0D, 0x49, 0x44, 0x41, 0x54, 0x78, 0x9C, 0x63, 0x60, 0x60, 0x60, 0x00,
  0x00, 0x00, 0x05, 0x00, 0x01, 0x62, 0xD4, 0x9D, 0x3D, 0x00, 0x00, 0x00,
  0x00, 0x49, 0x45, 0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82,
];

class _FakeAssetBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    return ByteData.view(Uint8List.fromList(_kTransparentPng).buffer);
  }

  @override
  Future<T> loadStructuredBinaryData<T>(
    String key,
    FutureOr<T> Function(ByteData data) parser,
  ) async {
    if (key == 'AssetManifest.bin') {
      // A valid, empty asset manifest so the framework does not try to
      // decode our PNG bytes as a structured binary message.
      final encoded = StandardMessageCodec().encodeMessage(<String, dynamic>{})!;
      return parser(encoded);
    }
    return super.loadStructuredBinaryData(key, parser);
  }
}

Widget _wrap(Widget child) {
  return DefaultAssetBundle(
    bundle: _FakeAssetBundle(),
    child: MaterialApp(home: Scaffold(body: child)),
  );
}

void main() {
  testWidgets('sebha counter starts at 0 and increments on tap',
      (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(_wrap(SebhaTab()));

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byType(AnimatedRotation));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('sebha counter resets to 0 after a full cycle of 32 taps',
      (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(_wrap(SebhaTab()));

    // The counter counts 0..31 and resets to 0 after 32 taps
    // (and moves to the next dhikr).
    for (var i = 0; i < 32; i++) {
      await tester.tap(find.byType(AnimatedRotation));
      await tester.pump();
    }

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byType(AnimatedRotation));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
