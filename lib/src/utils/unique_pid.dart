import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'unique_pid.g.dart';

@riverpod
Uuid uuid(UuidRef ref) {
  return const Uuid();
}
