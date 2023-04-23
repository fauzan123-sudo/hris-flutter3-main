import 'package:get/get.dart';
import 'package:hris/app/constant/api_const.dart';

class CutiProvider extends GetConnect {
  Future<Response> getMasterCuti(String token) {
    return get(BASEAPI + 'pengajuan/cuti', headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
  }

  Future<List<dynamic>> getLists(String token, String nip, String page) async {
    final response = await get(
        BASEAPI + 'pengajuan/cuti/lists?nip=' + nip + "&page=" + page,
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer $token"
        });

    if (response.status.hasError) {
      return Future.error({'error': response.statusText});
    } else {
      return response.body['data'];
    }
  }

  Future<Response> postCuti(String token, String nip, String tanggalMulai,
      String tanggalSelesai, String kodeCuti, String keterangan) {
    final body = {
      'nip': nip,
      'kode_cuti': kodeCuti,
      'tanggal_mulai': tanggalMulai,
      'tanggal_selesai': tanggalSelesai,
      'keterangan': keterangan,
    };

    return post(BASEAPI + 'pengajuan/cuti/store', body, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
  }
}
