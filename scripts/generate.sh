#!/bin/bash -e

FILE=dart_web_audio.dart

cd gen

dart_js_facade_gen lib.dom.audio.ts > $FILE

echo $FILE | rex -f '(show promiseToFuture;\n)' '$1import "dart:typed_data" show Uint8List, Float32List, ByteBuffer;\n'
echo $FILE | rex -f 'Uint8Array' 'Uint8List'
echo $FILE | rex -f 'Float32Array' 'Float32List'
echo $FILE | rex -f 'ArrayBuffer' 'ByteBuffer'

mv $FILE ../package/lib/
