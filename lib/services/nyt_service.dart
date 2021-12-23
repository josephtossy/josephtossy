import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:technology_assessment/constants.dart';

class NytService {
  /// Get NYT News ///
  Future<http.Response> getNYTNews() async {
    /// Url Destination ///
    Uri uri = Uri.parse(
        'http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key='
        '${Constants.nycApiKey}');
    Response response = await http.get(
      uri,
      headers: {"Content-Type": "application/json"},
    );
    return response;
  }
}
