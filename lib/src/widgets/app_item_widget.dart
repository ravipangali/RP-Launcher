import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:ravi_launcher/src/constants/color_constant.dart';

class AppItemWidget extends StatelessWidget {
  const AppItemWidget({
    super.key,
    required this.packageName,
    required this.icon,
    required this.appName,
  });

  final dynamic packageName;
  final dynamic icon;
  final dynamic appName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () => showMenu(
          context: context,
          color: primaryTextColor,
          
          items: [
            PopupMenuItem(child: Text('Uninstall', style: TextStyle(color: primaryColor),))
          ],
          position: const RelativeRect.fromLTRB(0, 0, 0, 0)),
      onTap: () => DeviceApps.openApp(packageName),
      child: Container(
          margin: const EdgeInsets.all(10),
          width: 40,
          height: 90,
          child: Column(
            children: [
              Image.memory(
                icon,
                width: 40,
                height: 40,
              ),
              Text(appName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: primaryTextColor))
            ],
          )),
    );
  }
}
