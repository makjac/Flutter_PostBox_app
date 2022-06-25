import 'package:post_box/data/models/userShowcase.dart';
import 'package:post_box/data/network_service.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});

  Future<List<UserShowcase>> fetchShowcase() async {
    final showcaseRaw = await networkService.fetchShowcase();

    return showcaseRaw.map((e) => UserShowcase.fromMap(e)).toList();
  }
}
