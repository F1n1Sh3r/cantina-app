class ResponseModel<T> {
  int statusCode;
  String message;
  T data;

  ResponseModel({required this.statusCode, required this.message, required this.data});
}
