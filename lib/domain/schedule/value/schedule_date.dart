import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class ScheduleDate {
  const ScheduleDate(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is ScheduleDate && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;

  final DateTime value;
}
