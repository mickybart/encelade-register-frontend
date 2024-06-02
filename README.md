# Encelade Suite

Encelade Suite is a frontend to multiple services that can be used on some industry.

## Components of the Suite
### Register

Frontend for a register that permit to:

- manage a register record
    - create
    - submit
    - execute a flow step-by-step
    - complete it
- Show history of records
- export records as PDF

## Development

### Setup

Encelade Suite is using flutter and protobuf.

```bash
# generate the code from the register proto

dart pub global activate protoc_plugin

export PATH="$PATH:$HOME/.pub-cache/bin"

# proto file is part of encelade-register project.
protoc -I ../encelade-register/proto/ ../encelade-register/proto/register.proto google/protobuf/timestamp.proto google/protobuf/empty.proto --dart_out=grpc:lib/model/proto
```

### Compilation / Packaging

#### Dart define

You can use multiple variables during compilation time (`--dart-define=VARIABLE=value`):

| Variable | Purpose | Default |
|----------|---------|---------|
| HOST     | Backend url | 127.0.0.1 or 10.0.2.2 (Android Emulator) |
| PORT     | Backend port | 50051 |
| TLS      | Enable backend tls | false |
| TOKEN    | Provide a token for backend auth. This is UNSAFE and just here as a demonstration. Production code should rely on OIDC or alternative to get the token. | '' |

#### Linux platform target

```bash
flutter build linux --release

# bin and assets location: build/linux/x64/release/bundle/
```

#### Web platform target

```bash
flutter build web --release

# Alternative: if you want to run the web demo locally in docker with the backend in docker too, use docker host.
# flutter build web --release --dart-define=HOST=172.17.0.1

docker build -t encelade-suite-web:latest -f noops/Dockerfile.web .

# push or run the image
# docker run -it --rm -p 8080:80 encelade-suite-web:latest
```

#### Android platform target

```bash
flutter build appbundle --release

# package location: build/app/outputs/bundle/release/

# alt
# flutter build apk --release
```