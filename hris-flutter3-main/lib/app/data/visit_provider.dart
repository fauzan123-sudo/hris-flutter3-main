import 'package:get/get.dart';
import 'package:hris/app/constant/api_const.dart';

class VisitProvider extends GetConnect {
  Future<Response> getData(
      String token, String nip, String mulai, String selesai) {
    return get('${BASEAPI}visit?nip=$nip&mulai=$mulai&selesai=$selesai',
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer $token"
        });
  }

  Future<Response> getLokasi(String token, String kodeVisit) {
    print("${BASEAPI}visit/lokasi?kode=$kodeVisit");
    return get('${BASEAPI}visit/lokasi?kode=$kodeVisit', headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
  }

  Future<Response> postData(String nip, String token, String kordinat,
      String kodeVisit, String image) {
    final body = {
      'nip': nip,
      'kordinat': kordinat,
      'kode_visit': kodeVisit,
      'timezone': DateTime.now().toLocal().timeZoneName.toString(),
      'image': image,
    };

    return post(BASEAPI + 'visit/store', body, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
  }
}
