import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@NowaGenerated()
class SupabaseService {
  SupabaseService._();

  factory SupabaseService() {
    return _instance;
  }

  static final SupabaseService _instance = SupabaseService._();

  Future initialize() async {
    // Prefer compile-time dart-define values. These are provided with
    // `--dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...`
    const envUrl = String.fromEnvironment('SUPABASE_URL', defaultValue: '');
    const envKey = String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: '');

    // Fallback to the in-repo defaults if env/defines not provided.
    final url = envUrl.isNotEmpty
        ? envUrl
        : 'https://tixanfqpalfiwcwhpdja.supabase.co';
    final anonKey = envKey.isNotEmpty
        ? envKey
        : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRpeGFuZnFwYWxmaXdjd2hwZGphIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk3MjYxNjEsImV4cCI6MjA4NTMwMjE2MX0.d7k8zXtK9GwWPlo0j5swskBJig0SNHvSqsFPrmRsX1w';

    if (envUrl.isEmpty || envKey.isEmpty) {
      // Log a non-sensitive notice in dev/CI logs to encourage migration to env-backed secrets.
      // Do NOT print or log the key itself.
      print('Supabase: using repo fallback values; set SUPABASE_URL and SUPABASE_ANON_KEY via --dart-define to override');
    }

    await Supabase.initialize(
      url: url,
      anonKey: anonKey,
    );
  }

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
}
