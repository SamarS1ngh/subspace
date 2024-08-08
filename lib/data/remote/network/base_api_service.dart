abstract class BaseApiService {
  // A method for making GET requests to the API.
  Future<dynamic> getResponse(String url,
      {Map<String, String>? header, Map<String, dynamic>? params});
}
