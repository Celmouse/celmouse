import 'dart:io';
import 'package:protocol/protocol.dart';
import 'package:device_info_plus/device_info_plus.dart';

class ConnectionService {
  static Future<ConnectionInfoProtocolData> getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isWindows) {
      final windowsInfo = await deviceInfoPlugin.windowsInfo;
      return ConnectionInfoProtocolData(
        deviceName: windowsInfo.computerName,
        deviceOS: DeviceOS.windows,
        versionNumber: windowsInfo.displayVersion,
      );
    } else if (Platform.isLinux) {
      final linuxInfo = await deviceInfoPlugin.linuxInfo;
      return ConnectionInfoProtocolData(
        deviceName: linuxInfo.name,
        deviceOS: DeviceOS.linux,
        versionNumber: linuxInfo.version ?? 'Unknown',
      );
    } else if (Platform.isMacOS) {
      final macOsInfo = await deviceInfoPlugin.macOsInfo;
      return ConnectionInfoProtocolData(
        deviceName: macOsInfo.model,
        deviceOS: DeviceOS.macos,
        versionNumber: macOsInfo.osRelease,
      );
    } else {
      return const ConnectionInfoProtocolData(
        deviceName: 'Unknown',
        deviceOS: DeviceOS.unknown,
        versionNumber: 'Unknown',
      );
    }
  }

  void updateConnectionInfo(ConnectionInfoProtocolData data) {
    // send data to the host phone
    print('Device Name: ${data.deviceName}');
    print('Device OS: ${data.deviceOS}');
    print('Version Number: ${data.versionNumber}');
  }
}
