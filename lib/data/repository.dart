import 'package:post_box/data/models/parcel_destination.dart';
import 'package:post_box/data/models/parcel_history.dart';
import 'package:post_box/data/models/parcel_showcase.dart';
import 'package:post_box/data/models/postmachine_model.dart';
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
    final sendParcelsRaw = await networkService.fetchSendingParcels();

    return sendParcelsRaw.map((e) => ParcelShowcase.fromMap(e)).toList();
  }

  Future<List<PostMachine>> fetchPstmachines() async {
    final postmachnesRaw = await networkService.fetchPstmachines();

    return postmachnesRaw.map((e) => PostMachine.fromMap(e)).toList();
  }

  Future<int> createParcel(
      String login, String parcelName, int rid, int sid) async {
    final token = UserSharedPreferences.getToken();
    final senderLogin = UserSharedPreferences.getLogin();
    final parcelObj = {
      "Authorization": "Bearer " + token!,
      "sender_username": senderLogin!,
      "receiver_username": login,
      "receiver_pm_id": rid.toString(),
      "sender_pm_id": sid.toString(),
      "parcel_type": "1",
      "parcel_name": parcelName
    };
    print(sid.toString());

    int status = 0;
    await networkService.createParcel(parcelObj).then((res) => status = res);

    return status;
  }

  Future<List<ParcelHistory>> fetchParcelHistory(String uuid) async {
    final postmachnesRaw = await networkService.fetchParcelHistory(uuid);

    return postmachnesRaw.map((e) => ParcelHistory.fromMap(e)).toList();
  }

  Future<List<ParcelDestination>> fetchParcelDestination(String uuid) async {
    final postmachnesRaw = await networkService.fetchParcelDestination(uuid);

    return postmachnesRaw.map((e) => ParcelDestination.fromMap(e)).toList();
  }
}
