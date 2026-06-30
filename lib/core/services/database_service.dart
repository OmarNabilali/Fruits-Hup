abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<void> deleteUser();
  Future<dynamic> getData({
    Map<String, dynamic>? query,
    required String path,
    String? documentId,
  });
}
