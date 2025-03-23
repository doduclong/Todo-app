import 'package:graphql/client.dart';
import 'package:helper_package/src.dart';

class $MyGraphqlException {
  const $MyGraphqlException();

  String getMessage(QueryResult<Object?> result){
    if (result.exception!.graphqlErrors.isNotEmpty) {
      try {
        final message = result.exception!.graphqlErrors.first.message;
        final code = result.exception!.graphqlErrors.first.extensions!.values.first;
        final statusCode = result.exception!.graphqlErrors.first.extensions!["response"]["statusCode"];
        return '$message ($code $statusCode)';
      } catch (e) {
        print(e);
      }
    }

    if (result.exception!.linkException != null) {
      try {
        final HttpLinkServerException linkException = result.exception!.linkException! as HttpLinkServerException;
        final message = linkException.parsedResponse!.errors![0].message;
        final code = linkException.parsedResponse!.errors![0].extensions!.values.first;
        final statusCode = linkException.statusCode;
        return '$message ($code $statusCode)';
      } catch (e) {
        print(e);
      }
    }
    return MyPackageInterpreter.canNotConnectToServer;
  }

  int? getStatusCode(QueryResult<Object?> result){
    if (result.exception!.graphqlErrors.isNotEmpty) {
      try {
        return result.exception!.graphqlErrors.first.extensions!["response"]["statusCode"] as int;
      } catch (e) {
        print(e);
      }
    }

    if (result.exception!.linkException != null) {
      try {
        final HttpLinkServerException linkException = result.exception!.linkException! as HttpLinkServerException;
        return linkException.statusCode;
      } catch (e) {
        print(e);
      }
    }
    return null;
  }
}