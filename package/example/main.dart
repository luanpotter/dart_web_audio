import 'dart:html';

import 'package:dart_web_audio/dart_web_audio.dart';

void main() async {
  final AudioContext _audioCtx = AudioContext();

  const kUrl2 = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
  final HttpRequest response = await HttpRequest.request(kUrl2, responseType: 'arraybuffer');
  final AudioBuffer buffer = await _audioCtx.decodeAudioData(response.response);

  final node = _audioCtx.createBufferSource();
  node.buffer = buffer;

  node.start();
}
