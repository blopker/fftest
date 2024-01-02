import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Totem API Group Code

class TotemAPIGroup {
  static String baseUrl = 'https://www.totem.org';
  static Map<String, String> headers = {};
  static TotemApiApiSecretCall totemApiApiSecretCall = TotemApiApiSecretCall();
  static TotemApiApiLoginCall totemApiApiLoginCall = TotemApiApiLoginCall();
  static TotemApiApiTokenCall totemApiApiTokenCall = TotemApiApiTokenCall();
}

class TotemApiApiSecretCall {
  Future<ApiCallResponse> call({
    String? xAPIKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'totem_api_api_secret',
      apiUrl: '${TotemAPIGroup.baseUrl}/api/v1/protected',
      callType: ApiCallType.GET,
      headers: {
        'X-API-Key': '$xAPIKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class TotemApiApiLoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'totem_api_api_login',
      apiUrl: '${TotemAPIGroup.baseUrl}/api/v1/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class TotemApiApiTokenCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'totem_api_api_token',
      apiUrl: '${TotemAPIGroup.baseUrl}/api/v1/auth/token',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Totem API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
