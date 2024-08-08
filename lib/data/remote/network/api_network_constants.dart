import 'dart:io';

class APINetworkConstants {
  static const baseURL = "https://intent-kit-16.hasura.app/api/rest/blogs";

  static const Map<String, String> headers = {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
    "x-hasura-admin-secret":
        "32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6"
  };
}
