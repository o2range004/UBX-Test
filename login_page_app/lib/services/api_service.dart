import 'package:http/http.dart' as http;


class ApiService{
  

  Future get({
    required String path,
    Map<String, String>? headers, 
    required String q,
  }) async{
   
    var url = Uri.parse(path);  
    url = url.replace(query: 'q=$q');
    final response = await http.get(url, headers:headers);
    return response;
  }
}