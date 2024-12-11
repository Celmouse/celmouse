import 'package:keyboard_platform_interface/keyboard_platform_interface.dart';

class Keyboard extends KeyboardPlatform {
  @override
  void pressKey(String key) => KeyboardPlatform.instance.pressKey(key);
  @override
  void releaseKey(String key) => KeyboardPlatform.instance.releaseKey(key);

  @override
  void pressSpecialKey(SpecialKey key) =>
      KeyboardPlatform.instance.pressSpecialKey(key);

  @override
  void releaseSpecialKey(SpecialKey key) =>
      KeyboardPlatform.instance.releaseSpecialKey(key);

  @override
  Future<String?> getPlatformVersion() =>
      KeyboardPlatform.instance.getPlatformVersion();
}
