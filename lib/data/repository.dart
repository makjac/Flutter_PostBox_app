import 'package:post_box/data/models/userShowcase.dart';
import 'package:post_box/data/network_service.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});

  Future<List<UserShowcase>> fetchShowcase() async {
    final showcaseRaw = await networkService.fetchShowcase();

    return showcaseRaw.map((e) => UserShowcase.fromMap(e)).toList();
  }

  Future<int> loginUser(String login, String passwd) async {
    final loginObj = {'username': login, 'passwd': passwd};

    int status = 0;
    await networkService.loginUser(loginObj).then((res) => status = res);

    return status;
  }
}
