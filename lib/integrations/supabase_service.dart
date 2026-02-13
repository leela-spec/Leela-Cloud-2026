import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@NowaGenerated()
class SupabaseService {
  SupabaseService._();

  factory SupabaseService() {
    return _instance;
  }

  static final SupabaseService _instance = SupabaseService._();

  Future<AuthResponse> signIn(String email, String password) async {
    return Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> signUp(String email, String password) async {
    return Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
  }

  Future initialize() async {
    await Supabase.initialize(
      url: 'https://tixanfqpalfiwcwhpdja.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRpeGFuZnFwYWxmaXdjd2hwZGphIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk3MjYxNjEsImV4cCI6MjA4NTMwMjE2MX0.d7k8zXtK9GwWPlo0j5swskBJig0SNHvSqsFPrmRsX1w',
    );
  }

  Future<List<Map<String, dynamic>>> q_skill_tree_nodes(String epicId) async {
    final response = await Supabase.instance.client
        .from('v_skill_tree_node_list')
        .select()
        .eq('epic_id', epicId)
        .order('node_type_order', ascending: true)
        .order('sort_order', ascending: true)
        .order('sort_lvl', ascending: true)
        .order('node_sort_order', ascending: true);
    return List<Map<String, dynamic>>.from(response);
  }
}
