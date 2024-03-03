enum RecordState {
  unspecified,
  draft,
  created,
  collectClientInside,
  collectClientSignature,
  collectClientOutside,
  collectPqrsSignature,
  returnClientInside,
  returnClientSignature,
  returnClientOutside,
  returnPqrsSignature,
  completed
}