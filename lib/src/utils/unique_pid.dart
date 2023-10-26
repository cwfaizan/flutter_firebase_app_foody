import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'unique_pid.g.dart';

@Riverpod(keepAlive: true)
Uuid uuid(UuidRef ref) {
  return const Uuid();
}
