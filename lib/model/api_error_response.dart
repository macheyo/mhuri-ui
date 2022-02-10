
import 'package:json_annotation/json_annotation.dart';

part 'api_error_response.g.dart';

@JsonSerializable()
class ApiErrorResponse{
  ApiErrorResponse(this.title, this.detail);

  String title;
  String detail;

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) => _$ApiErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiErrorResponseToJson(this);
}