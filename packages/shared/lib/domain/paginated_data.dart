import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'paginated_data.freezed.dart';

@freezed
class PaginatedData<T> with _$PaginatedData<T> {
  const PaginatedData._();
  const factory PaginatedData({
    required T entity,
    bool? isNextPageAvailable,
  }) = _PaginatedData<T>;
}
