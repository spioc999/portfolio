bool isNullOrEmpty(dynamic object) {
  if (object == null) {
    return true;
  }
  if (object is String) {
    return object.trim().isEmpty;
  }

  if (object is List) {
    return object.isEmpty;
  }

  if (object is Map) {
    return object.isEmpty;
  }

  if (object is Set) {
    return object.isEmpty;
  }

  return true;
}
