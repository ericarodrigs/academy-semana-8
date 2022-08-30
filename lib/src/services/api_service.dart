
abstract class ApiService{
  Future<dynamic> get({required String route});
  Future<dynamic> post({required String route, Map<String, dynamic>? body });
  Future<dynamic> put({required String route, Map? body});
  Future delete({required String route});
}