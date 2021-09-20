import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:retrofit/retrofit.dart';
import 'package:suitcore_flutter_getx_base_code/model/login_result.dart';
import 'package:suitcore_flutter_getx_base_code/model/tweeet.dart';
import 'environment.dart';
import 'interceptor/dio.dart';
import 'wrapper/api_response.dart';

part 'api_services.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static Future<RestClient> create({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    return RestClient(
      await AppDio().getDIO(
          headers: headers,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout),
      baseUrl: ConfigEnvironments.getEnvironments().toString(),
    );
  }

  @POST("/api/v1/auth/login")
  @FormUrlEncoded()
  Future<ApiResponse<LoginResult>> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @GET("/api/v1/tweeets")
  Future<ApiResponses<Tweeet>> getTweeets(
    @Query("page") String page,
    @Query("limit") String limit,
  );

  @POST("/api/v1/tweeets")
  Future<ApiResponse<Tweeet>> postTweeet(
    @Field("tweeet") String tweeet,
  );

  @POST("/api/v1/tweeets")
  @MultiPart()
  Future<ApiResponse<Tweeet>> postTweeetWithImage(
    @Part(name: "tweeet") String tweeet,
    @Part(name: "img_file", contentType: "image/png") File file,
  );
}
