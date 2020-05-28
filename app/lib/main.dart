import 'package:app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => ModularApp(
          module: AppModule(),
        ),
      ),
    );
