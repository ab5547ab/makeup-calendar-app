import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/appointment_model.dart';

class GitHubSyncService {
  final String token;
  final String owner;
  final String repo;
  final String path;

  GitHubSyncService({
    required this.token,
    required this.owner,
    required this.repo,
    required this.path,
  });

  Future<void> uploadAppointments(List<Appointment> appointments) async {
    final url = Uri.parse('https://api.github.com/repos/$owner/$repo/contents/$path');
    final getResponse = await http.get(url, headers: {'Authorization': 'token $token'});
    String? sha;
    if (getResponse.statusCode == 200) {
      sha = jsonDecode(getResponse.body)['sha'];
    }

    final jsonList = appointments.map((a) => a.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    final contentBase64 = base64Encode(utf8.encode(jsonString));

    final body = {
      "message": "סנכרון תורים אוטומטי",
      "content": contentBase64,
      if (sha != null) "sha": sha
    };

    final putResponse = await http.put(
      url,
      headers: {
        'Authorization': 'token $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (putResponse.statusCode != 200 && putResponse.statusCode != 201) {
      throw Exception('שגיאה בסנכרון: ${putResponse.body}');
    }
  }
}
