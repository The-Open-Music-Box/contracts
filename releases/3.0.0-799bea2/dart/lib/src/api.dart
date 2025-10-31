//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:tomb_contracts/src/serializers.dart';
import 'package:tomb_contracts/src/auth/api_key_auth.dart';
import 'package:tomb_contracts/src/auth/basic_auth.dart';
import 'package:tomb_contracts/src/auth/bearer_auth.dart';
import 'package:tomb_contracts/src/auth/oauth.dart';
import 'package:tomb_contracts/src/api/health_api.dart';
import 'package:tomb_contracts/src/api/nfc_api.dart';
import 'package:tomb_contracts/src/api/player_api.dart';
import 'package:tomb_contracts/src/api/playlists_api.dart';
import 'package:tomb_contracts/src/api/system_api.dart';
import 'package:tomb_contracts/src/api/uploads_api.dart';
import 'package:tomb_contracts/src/api/you_tube_api.dart';

class TombContracts {
  static const String basePath = r'http://localhost:8000';

  final Dio dio;
  final Serializers serializers;

  TombContracts({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Get HealthApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  HealthApi getHealthApi() {
    return HealthApi(dio, serializers);
  }

  /// Get NFCApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  NFCApi getNFCApi() {
    return NFCApi(dio, serializers);
  }

  /// Get PlayerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PlayerApi getPlayerApi() {
    return PlayerApi(dio, serializers);
  }

  /// Get PlaylistsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PlaylistsApi getPlaylistsApi() {
    return PlaylistsApi(dio, serializers);
  }

  /// Get SystemApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SystemApi getSystemApi() {
    return SystemApi(dio, serializers);
  }

  /// Get UploadsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UploadsApi getUploadsApi() {
    return UploadsApi(dio, serializers);
  }

  /// Get YouTubeApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  YouTubeApi getYouTubeApi() {
    return YouTubeApi(dio, serializers);
  }
}
