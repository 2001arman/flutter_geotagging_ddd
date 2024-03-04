import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  void requestPermission() async {
    var locationPermission = await Permission.location.status;
    if (locationPermission.isDenied) {
      await Permission.location.request();
    }
  }
}
