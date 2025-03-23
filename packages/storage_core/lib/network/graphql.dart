import 'package:storage_core/exception/exception.dart';
import 'package:graphql/client.dart';

class MyGraphql{
  GraphQLClient? graphQLClient;

  void setUp({required String baseUrl,}) {
    final HttpLink link = HttpLink("$baseUrl/graphql");
    graphQLClient = GraphQLClient(link: link, cache: GraphQLCache());
  }

  Future<QueryResult?> query(
      {
        required String query,
        Map<String, dynamic>? variables,
        String? accessToken,
      }) async {
    final QueryOptions options = QueryOptions(
        document: gql(query),
        variables: variables ?? {},
        fetchPolicy: FetchPolicy.networkOnly,);
    if (accessToken != null) {
      graphQLClient = GraphQLClient(
        link: AuthLink(getToken: () => accessToken)
            .concat(graphQLClient!.link),
        cache: GraphQLCache(),
      );
    }
    final result = await graphQLClient?.query(options);
    if (result!.hasException) {
      throw MyException.graphql.getMessage(result);
    }
    return result;
  }

  Future<QueryResult?> mutation({
    required String query,
      Map<String, dynamic>? variables,
    String? accessToken,
  }) async {
    final MutationOptions options =
    MutationOptions(document: gql(query), variables: variables!);
    if (accessToken != null) {
      graphQLClient = GraphQLClient(
        link: AuthLink(getToken: () => accessToken)
            .concat(graphQLClient!.link),
        cache: GraphQLCache(),
      );
    }
    final result = await graphQLClient?.mutate(options);
    if(result == null) return null;
    if (result.hasException) {
      throw MyException.graphql.getMessage(result);
    }
    return result;
  }
}
