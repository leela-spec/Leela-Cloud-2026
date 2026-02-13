import 'package:dio/dio.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/models/q_skill_tree_nodes_model.dart';

@NowaGenerated({'editor': 'api'})
class SupabaseQueries {
  factory SupabaseQueries() {
    return _instance;
  }

  SupabaseQueries._();

  final Dio _dioClient = Dio();

  @NowaGenerated({'loader': 'api_client_getter'})
  Dio get dioClient {
    return _dioClient;
  }

  static final SupabaseQueries _instance = SupabaseQueries._();

  Future<List<QSkillTreeNodesModel?>> qSkillTreeNodes() async {
    final Response res = await dioClient.get(
      'https://tixanfqpalfiwcwhpdja.supabase.co/rest/v1/v_skill_tree_node_list?epic_id=eq.EP_123',
      options: Options(
        headers: {
          'apikey':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRpeGFuZnFwYWxmaXdjd2hwZGphIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk3MjYxNjEsImV4cCI6MjA4NTMwMjE2MX0.d7k8zXtK9GwWPlo0j5swskBJig0SNHvSqsFPrmRsX1w',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRpeGFuZnFwYWxmaXdjd2hwZGphIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk3MjYxNjEsImV4cCI6MjA4NTMwMjE2MX0.d7k8zXtK9GwWPlo0j5swskBJig0SNHvSqsFPrmRsX1w',
        },
      ),
    );
    return (res.data as List)
        .map((e) => QSkillTreeNodesModel.fromJson(json: e))
        .toList();
  }
}
