// ignore_for_file: public_member_api_docs, sort_constructors_first
class ApiResponse {
  final String id;
  final String message;

  ApiResponse({required this.id, required this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      id: json['id'],
      message: json['message'],
    );
  }

    @override
  String toString() => 'ApiResponse(id: $id, message: $message)';
}
