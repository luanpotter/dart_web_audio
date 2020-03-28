#!/bin/bash -e

dart_js_facade_gen lib.dom.audio.ts > web_audio.dart

# awk 'NR==6{print "import \"dart:typed_data\" show Uint8List, Float32List, ByteBuffer;"}7' web_audio.dart > web_audio.dart2
# mv web_audio.dart2 web_audio.dart

echo 'web_audio.dart' | rex -f '(show promiseToFuture;\n)' '$1import "dart:typed_data" show Uint8List, Float32List, ByteBuffer;'
echo 'web_audio.dart' | rex -f 'Uint8Array' 'Uint8List'
echo 'web_audio.dart' | rex -f 'Float32Array' 'Float32List'
echo 'web_audio.dart' | rex -f 'ArrayBuffer' 'ByteBuffer'
