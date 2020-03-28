@JS()
library lib.dom.audio;

import "package:js/js.dart";
import "package:js/js_util.dart" show promiseToFuture;
import "dart:typed_data" show Uint8List, Float32List, ByteBuffer;
@anonymous
@JS()
abstract class EventInit {
  external bool get bubbles;
  external set bubbles(bool v);
  external bool get cancelable;
  external set cancelable(bool v);
  external bool get composed;
  external set composed(bool v);
  external factory EventInit({bool bubbles, bool cancelable, bool composed});
}

@anonymous
@JS()
abstract class EventListenerOptions {
  external bool get capture;
  external set capture(bool v);
  external factory EventListenerOptions({bool capture});
}

@anonymous
@JS()
abstract class AddEventListenerOptions implements EventListenerOptions {
  external bool get once;
  external set once(bool v);
  external bool get passive;
  external set passive(bool v);
  external factory AddEventListenerOptions(
      {bool once, bool passive, bool capture});
}

@JS()
abstract class Event {
  /// Returns true or false depending on how event was initialized. True if event goes through its target's ancestors in reverse tree order, and false otherwise.
  external bool get bubbles;
  external bool get cancelBubble;
  external set cancelBubble(bool v);

  /// Returns true or false depending on how event was initialized. Its return value does not always carry meaning, but true can indicate that part of the operation during which event was dispatched, can be canceled by invoking the preventDefault() method.
  external bool get cancelable;

  /// Returns true or false depending on how event was initialized. True if event invokes listeners past a ShadowRoot node that is the root of its target, and false otherwise.
  external bool get composed;

  /// Returns the object whose event listener's callback is currently being invoked.
  external EventTarget /*EventTarget|Null*/ get currentTarget;

  /// Returns true if preventDefault() was invoked successfully to indicate cancelation, and false otherwise.
  external bool get defaultPrevented;

  /// Returns the event's phase, which is one of NONE, CAPTURING_PHASE, AT_TARGET, and BUBBLING_PHASE.
  external num get eventPhase;

  /// Returns true if event was dispatched by the user agent, and false otherwise.
  external bool get isTrusted;
  external bool get returnValue;
  external set returnValue(bool v);
  external EventTarget /*EventTarget|Null*/ get srcElement;

  /// Returns the object to which event is dispatched (its target).
  external EventTarget /*EventTarget|Null*/ get target;

  /// Returns the event's timestamp as the number of milliseconds measured relative to the time origin.
  external num get timeStamp;

  /// Returns the type of event, e.g. "click", "hashchange", or "submit".
  external String get type;

  /// Returns the invocation target objects of event's path (objects on which listeners will be invoked), except for any nodes in shadow trees of which the shadow root's mode is "closed" that are not reachable from event's currentTarget.
  external List<EventTarget> composedPath();
  external void initEvent(String type, [bool bubbles, bool cancelable]);

  /// If invoked when the cancelable attribute value is true, and while executing a listener for the event with passive set to false, signals to the operation that caused event to be dispatched that it needs to be canceled.
  external void preventDefault();

  /// Invoking this method prevents event from reaching any registered event listeners after the current one finishes running and, when dispatched in a tree, also prevents event from reaching any other objects.
  external void stopImmediatePropagation();

  /// When dispatched in a tree, invoking this method prevents event from reaching any objects other than the current object.
  external void stopPropagation();
  external static num get AT_TARGET;
  external static num get BUBBLING_PHASE;
  external static num get CAPTURING_PHASE;
  external static num get NONE;
  external factory Event(String type, [EventInit eventInitDict]);
}

typedef void EventListener(Event evt);

@anonymous
@JS()
abstract class EventListenerObject {
  external void handleEvent(Event evt);
}

/*declare type EventListenerOrEventListenerObject = EventListener | EventListenerObject;*/
@JS()
abstract class EventTarget {
  /// Appends an event listener for events whose type attribute value is type. The callback argument sets the callback that will be invoked when the event is dispatched.
  /// The options argument sets listener-specific options. For compatibility this can be a boolean, in which case the method behaves exactly as if the value was specified as options's capture.
  /// When set to true, options's capture prevents callback from being invoked when the event's eventPhase attribute value is BUBBLING_PHASE. When false (or not present), callback will not be invoked when event's eventPhase attribute value is CAPTURING_PHASE. Either way, callback will be invoked if event's eventPhase attribute value is AT_TARGET.
  /// When set to true, options's passive indicates that the callback will not cancel the event by invoking preventDefault(). This is used to enable performance optimizations described in § 2.8 Observing event listeners.
  /// When set to true, options's once indicates that the callback will only be invoked once after which the event listener will be removed.
  /// The event listener is appended to target's event listener list and is not appended if it has the same type, callback, and capture.
  external void addEventListener(
      String type, dynamic /*EventListener|EventListenerObject|Null*/ listener,
      [dynamic /*bool|AddEventListenerOptions*/ options]);

  /// Dispatches a synthetic event event to target and returns true if either event's cancelable attribute value is false or its preventDefault() method was not invoked, and false otherwise.
  external bool dispatchEvent(Event event);

  /// Removes the event listener in target's event listener list with the same type, callback, and options.
  external void removeEventListener(
      String type, dynamic /*EventListener|EventListenerObject|Null*/ callback,
      [dynamic /*EventListenerOptions|bool*/ options]);
  external factory EventTarget();
}

/*type RequestCredentials = "include" | "omit" | "same-origin";*/
@anonymous
@JS()
abstract class WorkletOptions {
  external String /*'include'|'omit'|'same-origin'*/ get credentials;
  external set credentials(String /*'include'|'omit'|'same-origin'*/ v);
  external factory WorkletOptions(
      {String /*'include'|'omit'|'same-origin'*/ credentials});
}

@anonymous
@JS()
abstract class Worklet {}

@anonymous
@JS()
abstract class _Worklet {
  external Promise<void> addModule(String moduleURL, [WorkletOptions options]);
}

extension WorkletExtensions on Worklet {
  Future<void> addModule(String moduleURL, [WorkletOptions options]) {
    final Object t = this;
    final _Worklet tt = t;
    return promiseToFuture(tt.addModule(moduleURL, options));
  }
}

@JS()
abstract class AudioWorklet implements Worklet {
  external factory AudioWorklet();
}

/*type ChannelCountMode = "clamped-max" | "explicit" | "max";*/
/*type ChannelInterpretation = "discrete" | "speakers";*/
/*type AutomationRate = "a-rate" | "k-rate";*/

/// The Web Audio API's AudioParam interface represents an audio-related parameter, usually a parameter of an AudioNode (such as GainNode.gain).
@anonymous
@JS()
abstract class AudioParam {
  external String /*'a-rate'|'k-rate'*/ get automationRate;
  external set automationRate(String /*'a-rate'|'k-rate'*/ v);
  external num get defaultValue;
  external num get maxValue;
  external num get minValue;
  external num get value;
  external set value(num v);
  external AudioParam cancelAndHoldAtTime(num cancelTime);
  external AudioParam cancelScheduledValues(num cancelTime);
  external AudioParam exponentialRampToValueAtTime(num value, num endTime);
  external AudioParam linearRampToValueAtTime(num value, num endTime);
  external AudioParam setTargetAtTime(
      num target, num startTime, num timeConstant);
  external AudioParam setValueAtTime(num value, num startTime);
  external AudioParam setValueCurveAtTime(
      dynamic /*List<num>|Float32List*/ values, num startTime, num duration);
}

/// A generic interface for representing an audio processing module. Examples include:
@anonymous
@JS()
abstract class AudioNode implements EventTarget {
  external num get channelCount;
  external set channelCount(num v);
  external String /*'clamped-max'|'explicit'|'max'*/ get channelCountMode;
  external set channelCountMode(String /*'clamped-max'|'explicit'|'max'*/ v);
  external String /*'discrete'|'speakers'*/ get channelInterpretation;
  external set channelInterpretation(String /*'discrete'|'speakers'*/ v);
  external BaseAudioContext get context;
  external num get numberOfInputs;
  external num get numberOfOutputs;
  /*external AudioNode connect(AudioNode destinationNode, [num output, num input]);*/
  /*external void connect(AudioParam destinationParam, [num output]);*/
  external dynamic /*AudioNode|void*/ connect(
      dynamic /*AudioNode|AudioParam*/ destinationNode_destinationParam,
      [num output,
      num input]);
  /*external void disconnect();*/
  /*external void disconnect(num output);*/
  /*external void disconnect(AudioNode destinationNode);*/
  /*external void disconnect(AudioNode destinationNode, num output);*/
  /*external void disconnect(AudioNode destinationNode, num output, num input);*/
  /*external void disconnect(AudioParam destinationParam);*/
  /*external void disconnect(AudioParam destinationParam, num output);*/
  external void disconnect(
      [dynamic /*num|AudioNode|AudioParam*/ output_destinationNode_destinationParam,
      num output,
      num input]);
}

/// AudioDestinationNode has no output (as it is the output, no more AudioNode can be linked after it in the audio graph) and one input. The number of channels in the input must be between 0 and the maxChannelCount value or an exception is raised.
@anonymous
@JS()
abstract class AudioDestinationNode implements AudioNode {
  external num get maxChannelCount;
}

@JS()
abstract class AudioListener {
  external AudioParam get forwardX;
  external AudioParam get forwardY;
  external AudioParam get forwardZ;
  external AudioParam get positionX;
  external AudioParam get positionY;
  external AudioParam get positionZ;
  external AudioParam get upX;
  external AudioParam get upY;
  external AudioParam get upZ;
  external void setOrientation(num x, num y, num z, num xUp, num yUp, num zUp);
  external void setPosition(num x, num y, num z);
  external factory AudioListener();
}

/*type AudioContextState = "closed" | "running" | "suspended";*/
@anonymous
@JS()
abstract class AudioNodeOptions {
  external num get channelCount;
  external set channelCount(num v);
  external String /*'clamped-max'|'explicit'|'max'*/ get channelCountMode;
  external set channelCountMode(String /*'clamped-max'|'explicit'|'max'*/ v);
  external String /*'discrete'|'speakers'*/ get channelInterpretation;
  external set channelInterpretation(String /*'discrete'|'speakers'*/ v);
  external factory AudioNodeOptions(
      {num channelCount,
      String /*'clamped-max'|'explicit'|'max'*/ channelCountMode,
      String /*'discrete'|'speakers'*/ channelInterpretation});
}

@anonymous
@JS()
abstract class AnalyserOptions implements AudioNodeOptions {
  external num get fftSize;
  external set fftSize(num v);
  external num get maxDecibels;
  external set maxDecibels(num v);
  external num get minDecibels;
  external set minDecibels(num v);
  external num get smoothingTimeConstant;
  external set smoothingTimeConstant(num v);
  external factory AnalyserOptions(
      {num fftSize,
      num maxDecibels,
      num minDecibels,
      num smoothingTimeConstant,
      num channelCount,
      String /*'clamped-max'|'explicit'|'max'*/ channelCountMode,
      String /*'discrete'|'speakers'*/ channelInterpretation});
}

@JS()
abstract class AnalyserNode implements AudioNode {
  external num get fftSize;
  external set fftSize(num v);
  external num get frequencyBinCount;
  external num get maxDecibels;
  external set maxDecibels(num v);
  external num get minDecibels;
  external set minDecibels(num v);
  external num get smoothingTimeConstant;
  external set smoothingTimeConstant(num v);
  external void getByteFrequencyData(Uint8List array);
  external void getByteTimeDomainData(Uint8List array);
  external void getFloatFrequencyData(Float32List array);
  external void getFloatTimeDomainData(Float32List array);
  external factory AnalyserNode(BaseAudioContext context,
      [AnalyserOptions options]);
}

/*type BiquadFilterType = "allpass" |
    "bandpass" |
    "highpass" |
    "highshelf" |
    "lowpass" |
    "lowshelf" |
    "notch" |
    "peaking";
*/
@JS()
abstract class BiquadFilterNode implements AudioNode {
  external AudioParam get Q;
  external AudioParam get detune;
  external AudioParam get frequency;
  external AudioParam get gain;
  external String /*'allpass'|'bandpass'|'highpass'|'highshelf'|'lowpass'|'lowshelf'|'notch'|'peaking'*/ get type;
  external set type(
      String /*'allpass'|'bandpass'|'highpass'|'highshelf'|'lowpass'|'lowshelf'|'notch'|'peaking'*/ v);
  external void getFrequencyResponse(Float32List frequencyHz,
      Float32List magResponse, Float32List phaseResponse);
  external factory BiquadFilterNode(BaseAudioContext context,
      [BiquadFilterOptions options]);
}

@anonymous
@JS()
abstract class BiquadFilterOptions implements AudioNodeOptions {
  external num get Q;
  external set Q(num v);
  external num get detune;
  external set detune(num v);
  external num get frequency;
  external set frequency(num v);
  external num get gain;
  external set gain(num v);
  external String /*'allpass'|'bandpass'|'highpass'|'highshelf'|'lowpass'|'lowshelf'|'notch'|'peaking'*/ get type;
  external set type(
      String /*'allpass'|'bandpass'|'highpass'|'highshelf'|'lowpass'|'lowshelf'|'notch'|'peaking'*/ v);
  external factory BiquadFilterOptions(
      {num Q,
      num detune,
      num frequency,
      num gain,
      String /*'allpass'|'bandpass'|'highpass'|'highshelf'|'lowpass'|'lowshelf'|'notch'|'peaking'*/ type,
      num channelCount,
      String /*'clamped-max'|'explicit'|'max'*/ channelCountMode,
      String /*'discrete'|'speakers'*/ channelInterpretation});
}

@JS()
abstract class AudioBuffer {
  external num get duration;
  external num get length;
  external num get numberOfChannels;
  external num get sampleRate;
  external void copyFromChannel(Float32List destination, num channelNumber,
      [num bufferOffset]);
  external void copyToChannel(Float32List source, num channelNumber,
      [num bufferOffset]);
  external Float32List getChannelData(num channel);
  external factory AudioBuffer(AudioBufferOptions options);
}

@anonymous
@JS()
abstract class AudioBufferOptions {
  external num get length;
  external set length(num v);
  external num get numberOfChannels;
  external set numberOfChannels(num v);
  external num get sampleRate;
  external set sampleRate(num v);
  external factory AudioBufferOptions(
      {num length, num numberOfChannels, num sampleRate});
}

@anonymous
@JS()
abstract class AudioBufferSourceOptions {
  external AudioBuffer /*AudioBuffer|Null*/ get buffer;
  external set buffer(AudioBuffer /*AudioBuffer|Null*/ v);
  external num get detune;
  external set detune(num v);
  external bool get loop;
  external set loop(bool v);
  external num get loopEnd;
  external set loopEnd(num v);
  external num get loopStart;
  external set loopStart(num v);
  external num get playbackRate;
  external set playbackRate(num v);
  external factory AudioBufferSourceOptions(
      {AudioBuffer /*AudioBuffer|Null*/ buffer,
      num detune,
      bool loop,
      num loopEnd,
      num loopStart,
      num playbackRate});
}

@anonymous
@JS()
abstract class ChannelMergerOptions implements AudioNodeOptions {
  external num get numberOfInputs;
  external set numberOfInputs(num v);
  external factory ChannelMergerOptions(
      {num numberOfInputs,
      num channelCount,
      String /*'clamped-max'|'explicit'|'max'*/ channelCountMode,
      String /*'discrete'|'speakers'*/ channelInterpretation});
}

@anonymous
@JS()
abstract class ChannelSplitterOptions implements AudioNodeOptions {
  external num get numberOfOutputs;
  external set numberOfOutputs(num v);
  external factory ChannelSplitterOptions(
      {num numberOfOutputs,
      num channelCount,
      String /*'clamped-max'|'explicit'|'max'*/ channelCountMode,
      String /*'discrete'|'speakers'*/ channelInterpretation});
}

@anonymous
@JS()
abstract class ConstantSourceOptions {
  external num get offset;
  external set offset(num v);
  external factory ConstantSourceOptions({num offset});
}

@anonymous
@JS()
abstract class ConvolverOptions implements AudioNodeOptions {
  external AudioBuffer /*AudioBuffer|Null*/ get buffer;
  external set buffer(AudioBuffer /*AudioBuffer|Null*/ v);
  external bool get disableNormalization;
  external set disableNormalization(bool v);
  external factory ConvolverOptions(
      {AudioBuffer /*AudioBuffer|Null*/ buffer,
      bool disableNormalization,
      num channelCount,
      String /*'clamped-max'|'explicit'|'max'*/ channelCountMode,
      String /*'discrete'|'speakers'*/ channelInterpretation});
}

@anonymous
@JS()
abstract class DynamicsCompressorOptions implements AudioNodeOptions {
  external num get attack;
  external set attack(num v);
  external num get knee;
  external set knee(num v);
  external num get ratio;
  external set ratio(num v);
  external num get release;
  external set release(num v);
  external num get threshold;
  external set threshold(num v);
  external factory DynamicsCompressorOptions(
      {num attack,
      num knee,
      num ratio,
      num release,
      num threshold,
      num channelCount,
      String /*'clamped-max'|'explicit'|'max'*/ channelCountMode,
      String /*'discrete'|'speakers'*/ channelInterpretation});
}

@anonymous
@JS()
abstract class GainOptions implements AudioNodeOptions {
  external num get gain;
  external set gain(num v);
  external factory GainOptions(
      {num gain,
      num channelCount,
      String /*'clamped-max'|'explicit'|'max'*/ channelCountMode,
      String /*'discrete'|'speakers'*/ channelInterpretation});
}

@anonymous
@JS()
abstract class IIRFilterOptions implements AudioNodeOptions {
  external List<num> get feedback;
  external set feedback(List<num> v);
  external List<num> get feedforward;
  external set feedforward(List<num> v);
  external factory IIRFilterOptions(
      {List<num> feedback,
      List<num> feedforward,
      num channelCount,
      String /*'clamped-max'|'explicit'|'max'*/ channelCountMode,
      String /*'discrete'|'speakers'*/ channelInterpretation});
}

@anonymous
@JS()
abstract class OscillatorOptions implements AudioNodeOptions {
  external num get detune;
  external set detune(num v);
  external num get frequency;
  external set frequency(num v);
  external PeriodicWave get periodicWave;
  external set periodicWave(PeriodicWave v);
  external String /*'custom'|'sawtooth'|'sine'|'square'|'triangle'*/ get type;
  external set type(
      String /*'custom'|'sawtooth'|'sine'|'square'|'triangle'*/ v);
  external factory OscillatorOptions(
      {num detune,
      num frequency,
      PeriodicWave periodicWave,
      String /*'custom'|'sawtooth'|'sine'|'square'|'triangle'*/ type,
      num channelCount,
      String /*'clamped-max'|'explicit'|'max'*/ channelCountMode,
      String /*'discrete'|'speakers'*/ channelInterpretation});
}

/*type DistanceModelType = "exponential" | "inverse" | "linear";*/
/*type PanningModelType = "HRTF" | "equalpower";*/
@anonymous
@JS()
abstract class PannerOptions implements AudioNodeOptions {
  external num get coneInnerAngle;
  external set coneInnerAngle(num v);
  external num get coneOuterAngle;
  external set coneOuterAngle(num v);
  external num get coneOuterGain;
  external set coneOuterGain(num v);
  external String /*'exponential'|'inverse'|'linear'*/ get distanceModel;
  external set distanceModel(String /*'exponential'|'inverse'|'linear'*/ v);
  external num get maxDistance;
  external set maxDistance(num v);
  external num get orientationX;
  external set orientationX(num v);
  external num get orientationY;
  external set orientationY(num v);
  external num get orientationZ;
  external set orientationZ(num v);
  external String /*'HRTF'|'equalpower'*/ get panningModel;
  external set panningModel(String /*'HRTF'|'equalpower'*/ v);
  external num get positionX;
  external set positionX(num v);
  external num get positionY;
  external set positionY(num v);
  external num get positionZ;
  external set positionZ(num v);
  external num get refDistance;
  external set refDistance(num v);
  external num get rolloffFactor;
  external set rolloffFactor(num v);
  external factory PannerOptions(
      {num coneInnerAngle,
      num coneOuterAngle,
      num coneOuterGain,
      String /*'exponential'|'inverse'|'linear'*/ distanceModel,
      num maxDistance,
      num orientationX,
      num orientationY,
      num orientationZ,
      String /*'HRTF'|'equalpower'*/ panningModel,
      num positionX,
      num positionY,
      num positionZ,
      num refDistance,
      num rolloffFactor,
      num channelCount,
      String /*'clamped-max'|'explicit'|'max'*/ channelCountMode,
      String /*'discrete'|'speakers'*/ channelInterpretation});
}

@JS()
abstract class AudioBufferSourceNode implements AudioScheduledSourceNode {
  external AudioBuffer /*AudioBuffer|Null*/ get buffer;
  external set buffer(AudioBuffer /*AudioBuffer|Null*/ v);
  external AudioParam get detune;
  external bool get loop;
  external set loop(bool v);
  external num get loopEnd;
  external set loopEnd(num v);
  external num get loopStart;
  external set loopStart(num v);
  external AudioParam get playbackRate;
  external void start([num when, num offset, num duration]);
  /*external void addEventListener<K extends keyof AudioScheduledSourceNodeEventMap>(K type, dynamic listener(AudioBufferSourceNode JS$this, AudioScheduledSourceNodeEventMap[K] ev), [bool|AddEventListenerOptions options]);*/
  /*external void addEventListener(String type, EventListener|EventListenerObject listener, [bool|AddEventListenerOptions options]);*/
  external void
      addEventListener/*<K extends keyof AudioScheduledSourceNodeEventMap>*/(
          dynamic /*K|String*/ type,
          dynamic /*dynamic Function(AudioScheduledSourceNodeEventMap[K])|EventListener|EventListenerObject*/ listener,
          [dynamic /*bool|AddEventListenerOptions*/ options]);
  /*external void removeEventListener<K extends keyof AudioScheduledSourceNodeEventMap>(K type, dynamic listener(AudioBufferSourceNode JS$this, AudioScheduledSourceNodeEventMap[K] ev), [bool|EventListenerOptions options]);*/
  /*external void removeEventListener(String type, EventListener|EventListenerObject listener, [bool|EventListenerOptions options]);*/
  external void
      removeEventListener/*<K extends keyof AudioScheduledSourceNodeEventMap>*/(
          dynamic /*K|String*/ type,
          dynamic /*dynamic Function(AudioScheduledSourceNodeEventMap[K])|EventListener|EventListenerObject*/ listener,
          [dynamic /*bool|EventListenerOptions*/ options]);
  external factory AudioBufferSourceNode(BaseAudioContext context,
      [AudioBufferSourceOptions options]);
}

@anonymous
@JS()
abstract class AudioScheduledSourceNodeEventMap {
  external Event get ended;
  external set ended(Event v);
  external factory AudioScheduledSourceNodeEventMap({Event ended});
}

@JS()
abstract class AudioScheduledSourceNode implements AudioNode {
  external dynamic Function(Event) /*dynamic Function(Event)|Null*/ get onended;
  external set onended(
      dynamic Function(Event) /*dynamic Function(Event)|Null*/ v);
  external void start([num when]);
  external void stop([num when]);
  /*external void addEventListener<K extends keyof AudioScheduledSourceNodeEventMap>(K type, dynamic listener(AudioScheduledSourceNode JS$this, AudioScheduledSourceNodeEventMap[K] ev), [bool|AddEventListenerOptions options]);*/
  /*external void addEventListener(String type, EventListener|EventListenerObject listener, [bool|AddEventListenerOptions options]);*/
  external void
      addEventListener/*<K extends keyof AudioScheduledSourceNodeEventMap>*/(
          dynamic /*K|String*/ type,
          dynamic /*dynamic Function(AudioScheduledSourceNodeEventMap[K])|EventListener|EventListenerObject*/ listener,
          [dynamic /*bool|AddEventListenerOptions*/ options]);
  /*external void removeEventListener<K extends keyof AudioScheduledSourceNodeEventMap>(K type, dynamic listener(AudioScheduledSourceNode JS$this, AudioScheduledSourceNodeEventMap[K] ev), [bool|EventListenerOptions options]);*/
  /*external void removeEventListener(String type, EventListener|EventListenerObject listener, [bool|EventListenerOptions options]);*/
  external void
      removeEventListener/*<K extends keyof AudioScheduledSourceNodeEventMap>*/(
          dynamic /*K|String*/ type,
          dynamic /*dynamic Function(AudioScheduledSourceNodeEventMap[K])|EventListener|EventListenerObject*/ listener,
          [dynamic /*bool|EventListenerOptions*/ options]);
  external factory AudioScheduledSourceNode();
}

@JS()
abstract class ChannelMergerNode implements AudioNode {
  external factory ChannelMergerNode(BaseAudioContext context,
      [ChannelMergerOptions options]);
}

@JS()
abstract class ChannelSplitterNode implements AudioNode {
  external factory ChannelSplitterNode(BaseAudioContext context,
      [ChannelSplitterOptions options]);
}

@JS()
abstract class ConstantSourceNode implements AudioScheduledSourceNode {
  external AudioParam get offset;
  /*external void addEventListener<K extends keyof AudioScheduledSourceNodeEventMap>(K type, dynamic listener(ConstantSourceNode JS$this, AudioScheduledSourceNodeEventMap[K] ev), [bool|AddEventListenerOptions options]);*/
  /*external void addEventListener(String type, EventListener|EventListenerObject listener, [bool|AddEventListenerOptions options]);*/
  external void
      addEventListener/*<K extends keyof AudioScheduledSourceNodeEventMap>*/(
          dynamic /*K|String*/ type,
          dynamic /*dynamic Function(AudioScheduledSourceNodeEventMap[K])|EventListener|EventListenerObject*/ listener,
          [dynamic /*bool|AddEventListenerOptions*/ options]);
  /*external void removeEventListener<K extends keyof AudioScheduledSourceNodeEventMap>(K type, dynamic listener(ConstantSourceNode JS$this, AudioScheduledSourceNodeEventMap[K] ev), [bool|EventListenerOptions options]);*/
  /*external void removeEventListener(String type, EventListener|EventListenerObject listener, [bool|EventListenerOptions options]);*/
  external void
      removeEventListener/*<K extends keyof AudioScheduledSourceNodeEventMap>*/(
          dynamic /*K|String*/ type,
          dynamic /*dynamic Function(AudioScheduledSourceNodeEventMap[K])|EventListener|EventListenerObject*/ listener,
          [dynamic /*bool|EventListenerOptions*/ options]);
  external factory ConstantSourceNode(BaseAudioContext context,
      [ConstantSourceOptions options]);
}

@JS()
abstract class ConvolverNode implements AudioNode {
  external AudioBuffer /*AudioBuffer|Null*/ get buffer;
  external set buffer(AudioBuffer /*AudioBuffer|Null*/ v);
  external bool get normalize;
  external set normalize(bool v);
  external factory ConvolverNode(BaseAudioContext context,
      [ConvolverOptions options]);
}

@JS()
abstract class DelayNode implements AudioNode {
  external AudioParam get delayTime;
  external factory DelayNode(BaseAudioContext context, [DelayOptions options]);
}

@JS()
abstract class DynamicsCompressorNode implements AudioNode {
  external AudioParam get attack;
  external AudioParam get knee;
  external AudioParam get ratio;
  external num get reduction;
  external AudioParam get release;
  external AudioParam get threshold;
  external factory DynamicsCompressorNode(BaseAudioContext context,
      [DynamicsCompressorOptions options]);
}

@JS()
abstract class GainNode implements AudioNode {
  external AudioParam get gain;
  external factory GainNode(BaseAudioContext context, [GainOptions options]);
}

@JS()
abstract class IIRFilterNode implements AudioNode {
  external void getFrequencyResponse(Float32List frequencyHz,
      Float32List magResponse, Float32List phaseResponse);
  external factory IIRFilterNode(
      BaseAudioContext context, IIRFilterOptions options);
}

@JS()
abstract class OscillatorNode implements AudioScheduledSourceNode {
  external AudioParam get detune;
  external AudioParam get frequency;
  external String /*'custom'|'sawtooth'|'sine'|'square'|'triangle'*/ get type;
  external set type(
      String /*'custom'|'sawtooth'|'sine'|'square'|'triangle'*/ v);
  external void setPeriodicWave(PeriodicWave periodicWave);
  /*external void addEventListener<K extends keyof AudioScheduledSourceNodeEventMap>(K type, dynamic listener(OscillatorNode JS$this, AudioScheduledSourceNodeEventMap[K] ev), [bool|AddEventListenerOptions options]);*/
  /*external void addEventListener(String type, EventListener|EventListenerObject listener, [bool|AddEventListenerOptions options]);*/
  external void
      addEventListener/*<K extends keyof AudioScheduledSourceNodeEventMap>*/(
          dynamic /*K|String*/ type,
          dynamic /*dynamic Function(AudioScheduledSourceNodeEventMap[K])|EventListener|EventListenerObject*/ listener,
          [dynamic /*bool|AddEventListenerOptions*/ options]);
  /*external void removeEventListener<K extends keyof AudioScheduledSourceNodeEventMap>(K type, dynamic listener(OscillatorNode JS$this, AudioScheduledSourceNodeEventMap[K] ev), [bool|EventListenerOptions options]);*/
  /*external void removeEventListener(String type, EventListener|EventListenerObject listener, [bool|EventListenerOptions options]);*/
  external void
      removeEventListener/*<K extends keyof AudioScheduledSourceNodeEventMap>*/(
          dynamic /*K|String*/ type,
          dynamic /*dynamic Function(AudioScheduledSourceNodeEventMap[K])|EventListener|EventListenerObject*/ listener,
          [dynamic /*bool|EventListenerOptions*/ options]);
  external factory OscillatorNode(BaseAudioContext context,
      [OscillatorOptions options]);
}

@JS()
abstract class PannerNode implements AudioNode {
  external num get coneInnerAngle;
  external set coneInnerAngle(num v);
  external num get coneOuterAngle;
  external set coneOuterAngle(num v);
  external num get coneOuterGain;
  external set coneOuterGain(num v);
  external String /*'exponential'|'inverse'|'linear'*/ get distanceModel;
  external set distanceModel(String /*'exponential'|'inverse'|'linear'*/ v);
  external num get maxDistance;
  external set maxDistance(num v);
  external AudioParam get orientationX;
  external AudioParam get orientationY;
  external AudioParam get orientationZ;
  external String /*'HRTF'|'equalpower'*/ get panningModel;
  external set panningModel(String /*'HRTF'|'equalpower'*/ v);
  external AudioParam get positionX;
  external AudioParam get positionY;
  external AudioParam get positionZ;
  external num get refDistance;
  external set refDistance(num v);
  external num get rolloffFactor;
  external set rolloffFactor(num v);
  external void setOrientation(num x, num y, num z);
  external void setPosition(num x, num y, num z);
  external factory PannerNode(BaseAudioContext context,
      [PannerOptions options]);
}

@JS()
abstract class PeriodicWave {
  external factory PeriodicWave(BaseAudioContext context,
      [PeriodicWaveOptions options]);
}

@anonymous
@JS()
abstract class ScriptProcessorNodeEventMap {
  external AudioProcessingEvent get audioprocess;
  external set audioprocess(AudioProcessingEvent v);
  external factory ScriptProcessorNodeEventMap(
      {AudioProcessingEvent audioprocess});
}

@JS()
abstract class AudioProcessingEvent implements Event {
  external AudioBuffer get inputBuffer;
  external AudioBuffer get outputBuffer;
  external num get playbackTime;
  external factory AudioProcessingEvent(
      String type, AudioProcessingEventInit eventInitDict);
}

@JS()
abstract class ScriptProcessorNode implements AudioNode {
  external num get bufferSize;
  external dynamic Function(
      AudioProcessingEvent) /*dynamic Function(AudioProcessingEvent)|Null*/ get onaudioprocess;
  external set onaudioprocess(
      dynamic Function(
          AudioProcessingEvent) /*dynamic Function(AudioProcessingEvent)|Null*/ v);
  /*external void addEventListener<K extends keyof ScriptProcessorNodeEventMap>(K type, dynamic listener(ScriptProcessorNode JS$this, ScriptProcessorNodeEventMap[K] ev), [bool|AddEventListenerOptions options]);*/
  /*external void addEventListener(String type, EventListener|EventListenerObject listener, [bool|AddEventListenerOptions options]);*/
  external void addEventListener/*<K extends keyof ScriptProcessorNodeEventMap>*/(
      dynamic /*K|String*/ type,
      dynamic /*dynamic Function(ScriptProcessorNodeEventMap[K])|EventListener|EventListenerObject*/ listener,
      [dynamic /*bool|AddEventListenerOptions*/ options]);
  /*external void removeEventListener<K extends keyof ScriptProcessorNodeEventMap>(K type, dynamic listener(ScriptProcessorNode JS$this, ScriptProcessorNodeEventMap[K] ev), [bool|EventListenerOptions options]);*/
  /*external void removeEventListener(String type, EventListener|EventListenerObject listener, [bool|EventListenerOptions options]);*/
  external void
      removeEventListener/*<K extends keyof ScriptProcessorNodeEventMap>*/(
          dynamic /*K|String*/ type,
          dynamic /*dynamic Function(ScriptProcessorNodeEventMap[K])|EventListener|EventListenerObject*/ listener,
          [dynamic /*bool|EventListenerOptions*/ options]);
  external factory ScriptProcessorNode();
}

@JS()
abstract class StereoPannerNode implements AudioNode {
  external AudioParam get pan;
  external factory StereoPannerNode(BaseAudioContext context,
      [StereoPannerOptions options]);
}

@anonymous
@JS()
abstract class StereoPannerOptions implements AudioNodeOptions {
  external num get pan;
  external set pan(num v);
  external factory StereoPannerOptions(
      {num pan,
      num channelCount,
      String /*'clamped-max'|'explicit'|'max'*/ channelCountMode,
      String /*'discrete'|'speakers'*/ channelInterpretation});
}

/*type OverSampleType = "2x" | "4x" | "none";*/
@anonymous
@JS()
abstract class WaveShaperOptions implements AudioNodeOptions {
  external dynamic /*List<num>|Float32List*/ get curve;
  external set curve(dynamic /*List<num>|Float32List*/ v);
  external String /*'2x'|'4x'|'none'*/ get oversample;
  external set oversample(String /*'2x'|'4x'|'none'*/ v);
  external factory WaveShaperOptions(
      {dynamic /*List<num>|Float32List*/ curve,
      String /*'2x'|'4x'|'none'*/ oversample,
      num channelCount,
      String /*'clamped-max'|'explicit'|'max'*/ channelCountMode,
      String /*'discrete'|'speakers'*/ channelInterpretation});
}

/// An abnormal event (called an exception) which occurs as a result of calling a method or accessing a property of a web API.
@anonymous
@JS()
abstract class DOMException {
  external num get code;
  external String get message;
  external String get name;
  external num get ABORT_ERR;
  external num get DATA_CLONE_ERR;
  external num get DOMSTRING_SIZE_ERR;
  external num get HIERARCHY_REQUEST_ERR;
  external num get INDEX_SIZE_ERR;
  external num get INUSE_ATTRIBUTE_ERR;
  external num get INVALID_ACCESS_ERR;
  external num get INVALID_CHARACTER_ERR;
  external num get INVALID_MODIFICATION_ERR;
  external num get INVALID_NODE_TYPE_ERR;
  external num get INVALID_STATE_ERR;
  external num get NAMESPACE_ERR;
  external num get NETWORK_ERR;
  external num get NOT_FOUND_ERR;
  external num get NOT_SUPPORTED_ERR;
  external num get NO_DATA_ALLOWED_ERR;
  external num get NO_MODIFICATION_ALLOWED_ERR;
  external num get QUOTA_EXCEEDED_ERR;
  external num get SECURITY_ERR;
  external num get SYNTAX_ERR;
  external num get TIMEOUT_ERR;
  external num get TYPE_MISMATCH_ERR;
  external num get URL_MISMATCH_ERR;
  external num get VALIDATION_ERR;
  external num get WRONG_DOCUMENT_ERR;
  external factory DOMException(
      {num code,
      String message,
      String name,
      num ABORT_ERR,
      num DATA_CLONE_ERR,
      num DOMSTRING_SIZE_ERR,
      num HIERARCHY_REQUEST_ERR,
      num INDEX_SIZE_ERR,
      num INUSE_ATTRIBUTE_ERR,
      num INVALID_ACCESS_ERR,
      num INVALID_CHARACTER_ERR,
      num INVALID_MODIFICATION_ERR,
      num INVALID_NODE_TYPE_ERR,
      num INVALID_STATE_ERR,
      num NAMESPACE_ERR,
      num NETWORK_ERR,
      num NOT_FOUND_ERR,
      num NOT_SUPPORTED_ERR,
      num NO_DATA_ALLOWED_ERR,
      num NO_MODIFICATION_ALLOWED_ERR,
      num QUOTA_EXCEEDED_ERR,
      num SECURITY_ERR,
      num SYNTAX_ERR,
      num TIMEOUT_ERR,
      num TYPE_MISMATCH_ERR,
      num URL_MISMATCH_ERR,
      num VALIDATION_ERR,
      num WRONG_DOCUMENT_ERR});
}

@anonymous
@JS()
abstract class PeriodicWaveConstraints {
  external bool get disableNormalization;
  external set disableNormalization(bool v);
  external factory PeriodicWaveConstraints({bool disableNormalization});
}

@JS()
abstract class WaveShaperNode implements AudioNode {
  external Float32List /*Float32List|Null*/ get curve;
  external set curve(Float32List /*Float32List|Null*/ v);
  external String /*'2x'|'4x'|'none'*/ get oversample;
  external set oversample(String /*'2x'|'4x'|'none'*/ v);
  external factory WaveShaperNode(BaseAudioContext context,
      [WaveShaperOptions options]);
}

typedef void DecodeErrorCallback(DOMException error);
typedef void DecodeSuccessCallback(AudioBuffer decodedData);

@anonymous
@JS()
abstract class BaseAudioContextEventMap {
  external Event get statechange;
  external set statechange(Event v);
  external factory BaseAudioContextEventMap({Event statechange});
}

@anonymous
@JS()
abstract class PeriodicWaveOptions implements PeriodicWaveConstraints {
  external dynamic /*List<num>|Float32List*/ get imag;
  external set imag(dynamic /*List<num>|Float32List*/ v);
  external dynamic /*List<num>|Float32List*/ get real;
  external set real(dynamic /*List<num>|Float32List*/ v);
  external factory PeriodicWaveOptions(
      {dynamic /*List<num>|Float32List*/ imag,
      dynamic /*List<num>|Float32List*/ real,
      bool disableNormalization});
}

@JS()
abstract class BaseAudioContext implements EventTarget {
  external AudioWorklet get audioWorklet;
  external num get currentTime;
  external AudioDestinationNode get destination;
  external AudioListener get listener;
  external dynamic Function(
      Event) /*dynamic Function(Event)|Null*/ get onstatechange;
  external set onstatechange(
      dynamic Function(Event) /*dynamic Function(Event)|Null*/ v);
  external num get sampleRate;
  external String /*'closed'|'running'|'suspended'*/ get state;
  external AnalyserNode createAnalyser();
  external BiquadFilterNode createBiquadFilter();
  external AudioBuffer createBuffer(
      num numberOfChannels, num length, num sampleRate);
  external AudioBufferSourceNode createBufferSource();
  external ChannelMergerNode createChannelMerger([num numberOfInputs]);
  external ChannelSplitterNode createChannelSplitter([num numberOfOutputs]);
  external ConstantSourceNode createConstantSource();
  external ConvolverNode createConvolver();
  external DelayNode createDelay([num maxDelayTime]);
  external DynamicsCompressorNode createDynamicsCompressor();
  external GainNode createGain();
  external IIRFilterNode createIIRFilter(
      List<num> feedforward, List<num> feedback);
  external OscillatorNode createOscillator();
  external PannerNode createPanner();
  external PeriodicWave createPeriodicWave(
      dynamic /*List<num>|Float32List*/ real,
      dynamic /*List<num>|Float32List*/ imag,
      [PeriodicWaveConstraints constraints]);
  external ScriptProcessorNode createScriptProcessor(
      [num bufferSize, num numberOfInputChannels, num numberOfOutputChannels]);
  external StereoPannerNode createStereoPanner();
  external WaveShaperNode createWaveShaper();
  /*external void addEventListener<K extends keyof BaseAudioContextEventMap>(K type, dynamic listener(BaseAudioContext JS$this, BaseAudioContextEventMap[K] ev), [bool|AddEventListenerOptions options]);*/
  /*external void addEventListener(String type, EventListener|EventListenerObject listener, [bool|AddEventListenerOptions options]);*/
  external void addEventListener/*<K extends keyof BaseAudioContextEventMap>*/(
      dynamic /*K|String*/ type,
      dynamic /*dynamic Function(BaseAudioContextEventMap[K])|EventListener|EventListenerObject*/ listener,
      [dynamic /*bool|AddEventListenerOptions*/ options]);
  /*external void removeEventListener<K extends keyof BaseAudioContextEventMap>(K type, dynamic listener(BaseAudioContext JS$this, BaseAudioContextEventMap[K] ev), [bool|EventListenerOptions options]);*/
  /*external void removeEventListener(String type, EventListener|EventListenerObject listener, [bool|EventListenerOptions options]);*/
  external void removeEventListener/*<K extends keyof BaseAudioContextEventMap>*/(
      dynamic /*K|String*/ type,
      dynamic /*dynamic Function(BaseAudioContextEventMap[K])|EventListener|EventListenerObject*/ listener,
      [dynamic /*bool|EventListenerOptions*/ options]);
  external factory BaseAudioContext();
}

@JS("BaseAudioContext")
abstract class _BaseAudioContext {
  external Promise<AudioBuffer> decodeAudioData(ByteBuffer audioData,
      [DecodeSuccessCallback /*DecodeSuccessCallback|Null*/ successCallback,
      DecodeErrorCallback /*DecodeErrorCallback|Null*/ errorCallback]);
}

extension BaseAudioContextExtensions on BaseAudioContext {
  Future<AudioBuffer> decodeAudioData(ByteBuffer audioData,
      [DecodeSuccessCallback /*DecodeSuccessCallback|Null*/ successCallback,
      DecodeErrorCallback /*DecodeErrorCallback|Null*/ errorCallback]) {
    final Object t = this;
    final _BaseAudioContext tt = t;
    return promiseToFuture(
        tt.decodeAudioData(audioData, successCallback, errorCallback));
  }
}

@JS()
abstract class AudioContext implements BaseAudioContext {
  external num get baseLatency;
  external num get outputLatency;

  /// createMediaElementSource(mediaElement: HTMLMediaElement): MediaElementAudioSourceNode;
  /// createMediaStreamDestination(): MediaStreamAudioDestinationNode;
  /// createMediaStreamSource(mediaStream: MediaStream): MediaStreamAudioSourceNode;
  /// createMediaStreamTrackSource(mediaStreamTrack: MediaStreamTrack): MediaStreamTrackAudioSourceNode;
  external AudioTimestamp getOutputTimestamp();
  /*external void addEventListener<K extends keyof BaseAudioContextEventMap>(K type, dynamic listener(AudioContext JS$this, BaseAudioContextEventMap[K] ev), [bool|AddEventListenerOptions options]);*/
  /*external void addEventListener(String type, EventListener|EventListenerObject listener, [bool|AddEventListenerOptions options]);*/
  external void addEventListener/*<K extends keyof BaseAudioContextEventMap>*/(
      dynamic /*K|String*/ type,
      dynamic /*dynamic Function(BaseAudioContextEventMap[K])|EventListener|EventListenerObject*/ listener,
      [dynamic /*bool|AddEventListenerOptions*/ options]);
  /*external void removeEventListener<K extends keyof BaseAudioContextEventMap>(K type, dynamic listener(AudioContext JS$this, BaseAudioContextEventMap[K] ev), [bool|EventListenerOptions options]);*/
  /*external void removeEventListener(String type, EventListener|EventListenerObject listener, [bool|EventListenerOptions options]);*/
  external void removeEventListener/*<K extends keyof BaseAudioContextEventMap>*/(
      dynamic /*K|String*/ type,
      dynamic /*dynamic Function(BaseAudioContextEventMap[K])|EventListener|EventListenerObject*/ listener,
      [dynamic /*bool|EventListenerOptions*/ options]);
  external factory AudioContext([AudioContextOptions contextOptions]);
}

@JS("AudioContext")
abstract class _AudioContext {
  external Promise<void> close();
  external Promise<void> resume();
  external Promise<void> suspend();
}

extension AudioContextExtensions on AudioContext {
  Future<void> close() {
    final Object t = this;
    final _AudioContext tt = t;
    return promiseToFuture(tt.close());
  }

  Future<void> resume() {
    final Object t = this;
    final _AudioContext tt = t;
    return promiseToFuture(tt.resume());
  }

  Future<void> suspend() {
    final Object t = this;
    final _AudioContext tt = t;
    return promiseToFuture(tt.suspend());
  }
}

@anonymous
@JS()
abstract class AudioTimestamp {
  external num get contextTime;
  external set contextTime(num v);
  external num get performanceTime;
  external set performanceTime(num v);
  external factory AudioTimestamp({num contextTime, num performanceTime});
}

/*type AudioContextLatencyCategory = "balanced" | "interactive" | "playback";*/
@anonymous
@JS()
abstract class AudioContextOptions {
  external dynamic /*'balanced'|'interactive'|'playback'|num*/ get latencyHint;
  external set latencyHint(
      dynamic /*'balanced'|'interactive'|'playback'|num*/ v);
  external num get sampleRate;
  external set sampleRate(num v);
  external factory AudioContextOptions(
      {dynamic /*'balanced'|'interactive'|'playback'|num*/ latencyHint,
      num sampleRate});
}

@anonymous
@JS()
abstract class DelayOptions implements AudioNodeOptions {
  external num get delayTime;
  external set delayTime(num v);
  external num get maxDelayTime;
  external set maxDelayTime(num v);
  external factory DelayOptions(
      {num delayTime,
      num maxDelayTime,
      num channelCount,
      String /*'clamped-max'|'explicit'|'max'*/ channelCountMode,
      String /*'discrete'|'speakers'*/ channelInterpretation});
}

@anonymous
@JS()
abstract class AudioProcessingEventInit implements EventInit {
  external AudioBuffer get inputBuffer;
  external set inputBuffer(AudioBuffer v);
  external AudioBuffer get outputBuffer;
  external set outputBuffer(AudioBuffer v);
  external num get playbackTime;
  external set playbackTime(num v);
  external factory AudioProcessingEventInit(
      {AudioBuffer inputBuffer,
      AudioBuffer outputBuffer,
      num playbackTime,
      bool bubbles,
      bool cancelable,
      bool composed});
}

@JS()
abstract class Promise<T> {
  external factory Promise(
      void executor(void resolve(T result), Function reject));
  external Promise then(void onFulfilled(T result), [Function onRejected]);
}

