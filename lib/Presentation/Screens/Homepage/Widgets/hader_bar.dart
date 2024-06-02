import 'package:amri_systems_task/Presentation/Components/image_manager.dart';
import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildProfileImage(profileImane),
        _buildAppLogo(icon),
        _buildNotifyIcon(),
      ],
    );
  }

  Widget _buildProfileImage(String profile) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
        image: DecorationImage(
          image: AssetImage(profile),
        ),
      ),
    );
  }

  Widget _buildAppLogo(String appIcon) {
    return SizedBox(
        height: 50, width: 150, child: Center(child: Image.asset(appIcon)));
  }

  Widget _buildNotifyIcon() {
    return Stack(
      children: [
        Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                ),
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 80,
                      blurStyle: BlurStyle.inner),
                ]),
            child: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.grey,
              size: 30,
            )),
        Positioned(
          right: 5,
          child: Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
              color: Colors.indigo,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
