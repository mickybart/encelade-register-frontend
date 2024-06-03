# Encelade Suite

![encelade illustration](docs/encelade.png) Encelade Suite is a frontend to several services designed to meet the specific needs of businesses.

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

The backend is provided by [encelade-register-backend](https://github.com/mickybart/encelade-register-backend).

#### Demo

running on GNU/Linux, Web and Android Emulator in the same time.

https://github.com/mickybart/encelade-register-frontend/assets/8508218/03cdeafb-931c-43db-9250-3be7650fca7e

## Development

### Setup

Encelade Suite is using flutter and protobuf.

```bash
# generate the code from the register proto

dart pub global activate protoc_plugin

export PATH="$PATH:$HOME/.pub-cache/bin"

# proto file is part of encelade-register-backend project. (checkout https://github.com/mickybart/encelade-register-backend)
protoc -I ../encelade-register-backend/proto/ ../encelade-register-backend/proto/register.proto google/protobuf/timestamp.proto google/protobuf/empty.proto --dart_out=grpc:lib/model/proto
```

### Compilation / Packaging

#### Dart define

You can use multiple variables during compilation time (`--dart-define=VARIABLE=value`):

| Variable | Purpose | Default |
|----------|---------|---------|
| HOST     | Backend url | 127.0.0.1 or 10.0.2.2 (Android Emulator) |
| PORT     | Backend port | 50051 |
| TLS      | Enable backend tls | false |
| TOKEN    | Provide a token for backend auth. This is UNSAFE and just here as a demonstration. Production code should rely on OIDC or alternative to get the token. | NO TOKEN REQUIRED |

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

#### Windows platform target

```bash
flutter build windows --release

# package location: build\windows\x64\runner\Release\
```