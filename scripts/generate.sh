#!/bin/bash -e

cd gen

dart_js_facade_gen lib.dom.audio.ts > web_audio.dart

echo 'web_audio.dart' | rex -f '(show promiseToFuture;\n)' '$1import "dart:typed_data" show Uint8List, Float32List, ByteBuffer;'
echo 'web_audio.dart' | rex -f 'Uint8Array' 'Uint8List'
echo 'web_audio.dart' | rex -f 'Float32Array' 'Float32List'
echo 'web_audio.dart' | rex -f 'ArrayBuffer' 'ByteBuffer'

mv web_audio.dart ../lib/
