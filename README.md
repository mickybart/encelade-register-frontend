# Encelade Register Frontend

Frontend for a Register backend

## Dev

```bash
dart pub global activate protoc_plugin

export PATH="$PATH:$HOME/.pub-cache/bin"

protoc -I ../encelade-register/proto/ ../encelade-register/proto/register.proto google/protobuf/timestamp.proto google/protobuf/empty.proto --dart_out=grpc:lib/model/proto

# Build with compilation host, port and secure variables
flutter build linux --dart-define=HOST='127.0.0.1' --dart-define=PORT=443 --dart-define=SECURE=false

# alt: use a config.json file
# flutter build linux --dart-define-from-file=config.json
```
