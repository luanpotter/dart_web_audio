# dart-web-audio

This is a port of JS audio APIs to dart using [JS Facade Gen](https://github.com/dart-lang/js_facade_gen).

I grabed `gen/lib.dom.audio.ts` from the [official TypeScript repo](https://raw.githubusercontent.com/microsoft/TypeScript/master/lib/lib.dom.d.ts).

I then manually extraced `AudioContext` and all dependencies to ´gen/lib.dom.audio.ts´.

Finally the `scripts/generate.sh` script generates the final dart file using `js_facade_gen` and replacing some js builtins with dart ones.


## Setup

To regenerate the file, simple run from root:

```bash
./scripts/generate.sh
```
