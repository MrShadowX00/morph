import 'package:dio/dio.dart';
import 'package:morphzing/core/constants/urls.dart';

class JournalRepositories{
  static getJournalStats(String token)async{
    print('token $token');
    print('url ${BASE_URL+JOURNAL_GET_STATS}');
    Dio dio = Dio();
    var result = await dio.get(BASE_URL+JOURNAL_GET_STATS, options: Options(
      headers: {
        "Content-Type":"application/json",
        "Authorization":"Bearer $token",
      }
    ));


    print(result.statusCode);
    print(result.toString());

    return result;
  }
}