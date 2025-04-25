abstract class ApiConsumer {
  Future<dynamic> get(String path,
      {Object? data, Map<String, dynamic>? queryParmaters});

  Future<dynamic> post(String path,
      {required String token,
      Map<String, dynamic>? headers,
      Object? data,
      Map<String, dynamic>? queryParmaters,
      bool isFormData = false});

  Future<dynamic> delete(String path,
      {Object? data,
      Map<String, dynamic>? queryParmaters,
      bool isFormData = false});

  Future<dynamic> patch(String path,
      {Object? data,
      Map<String, dynamic>? queryParmaters,
      bool isFormData = false});
}
