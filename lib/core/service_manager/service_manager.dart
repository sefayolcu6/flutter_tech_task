abstract class ServiceManager {
  Future<T?> getModalFunc<T>({
    required String apiUrl,
    required T Function(Map<String, dynamic>) fromJson,
  });
}
