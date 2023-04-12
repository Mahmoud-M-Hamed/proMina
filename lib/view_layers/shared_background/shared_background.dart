import 'dart:ui';
import 'package:flutter/material.dart';
import '../../application_layer/components/constants/constants.dart';
import '../../application_layer/components/get_device_size.dart';

class SharedBackgroundView extends StatelessWidget {
  const SharedBackgroundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetDeviceSize.getDeviceHeight(context),
      width: GetDeviceSize.getDeviceWidth(context),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(
            '${ConstantStrings.kAssetImagePath}background1.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
        child: Container(),
      ),
    );
  }
}
