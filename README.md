# Encelade Register Frontend

Frontend for a Register backend

## Dev

```bash
dart pub global activate protoc_plugin

export PATH="$PATH:$HOME/.pub-cache/bin"

protoc -I ../encelade-register/proto/ ../encelade-register/proto/register.proto google/protobuf/timestamp.proto google/protobuf/empty.proto --dart_out=grpc:lib/model/proto
```
