import 'package:freezed_annotation/freezed_annotation.dart';

part 'filters.freezed.dart';
part 'filters.g.dart';

@freezed
class Filters with _$Filters {
  factory Filters({
    DateTime? createdAfter,
    DateTime? createdBefore,
    DateTime? updatedAfter,
    DateTime? updatedBefore,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    int? limit,
    String? sortBy,
    @Assert('sortBy!=null', '´sortBy´ field must be provided') String? sortOrder,
  }) = _Filters;

  factory Filters.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);
}

class SortFilter {
  String field;
  String? order;
  SortFilter(this.field, [this.order]);
}
