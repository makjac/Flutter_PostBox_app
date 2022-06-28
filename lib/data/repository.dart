import 'package:post_box/data/models/parcel_showcase.dart';
import 'package:post_box/data/models/register_model.dart';
import 'package:post_box/data/models/userShowcase.dart';
import 'package:post_box/data/network_service.dart';
import 'package:post_box/utils/userSharedPreferences.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});

  Future<int> loginUser(String login, String passwd) async {
    final loginObj = {'username': login, 'passwd': passwd};
    await UserSharedPreferences.setLogin(login);

    int status = 0;
    await networkService.loginUser(loginObj).then((res) => status = res);

    return status;
  }

  Future<int> registerUser(RegisterModel form) async {
    final registerObj = {
      "Login": form.login,
      "Passwd": form.passwd,
      "Name": form.name,
      "Surname": form.surname,
      "Phone": form.phone,
      "Email": form.email
    };

    int status = 0;
    await networkService.registerUser(registerObj).then((res) => status = res);
    return status;
  }

  Future<List<UserShowcase>> fetchShowcase() async {
    final showcaseRaw = await networkService.fetchShowcase();

    return showcaseRaw.map((e) => UserShowcase.fromMap(e)).toList();
  }

  Future<List<ParcelShowcase>> fetchIncomingParcels() async {
    final incomParcelsRaw = await networkService.fetchIncomingParcels();

    return incomParcelsRaw.map((e) => ParcelShowcase.fromMap(e)).toList();
  }

  Future<List<ParcelShowcase>> fetchSendingParcels() async {
    final incomParcelsRaw = await networkService.fetchSendingParcels();

    return incomParcelsRaw.map((e) => ParcelShowcase.fromMap(e)).toList();
  }
}
