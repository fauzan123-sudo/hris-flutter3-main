import 'package:get/get.dart';
import 'package:hris/app/constant/api_const.dart';

class PresensiProvider extends GetConnect {
  Future<Response> postPresensi(String nip, String token, String kordinat,
      String kodeShift, String kodeTingkat, String image) {
    final body = {
      'nip': nip,
      'kordinat': kordinat,
      'kode_tingkat': kodeTingkat,
      'kode_shift': kodeShift,
      'date': DateTime.now().toString(),
      'timezone': DateTime.now().toLocal().timeZoneName.toString(),
      'image': image,
    };

    return post(BASEAPI + 'presensi/store', body, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
  }

  Future<List<dynamic>> getPresensi(
      String nip, String token, String start, String end) async {
    final response = await get(
        '${BASEAPI}presensi/laporan?nip=$nip&d=$start&e=$end',
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer $token"
        });
    if (response.status.hasError) {
      return Future.error({'error': response.statusText});
    } else {
      return response.body;
    }
  }

  Future<Response> getShift(String token, String nip) {
    return get(BASEAPI + 'presensi/shift?nip=' + nip, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
  }

  Future<Response> getLokasi(String token, String nip) {
    return get(BASEAPI + 'presensi/lokasi?nip=' + nip, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
  }

  Future<Response> getHariIni(String token, String nip) {
    return get(BASEAPI + 'presensi?nip=' + nip, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
  }
}
