import 'package:e_store/services/assets_manager.dart';
import 'package:e_store/widgets/account_details_widget.dart';
import 'package:e_store/widgets/app_profile_list_tiles_widget.dart';
import 'package:e_store/widgets/app_name_text_widget.dart';
import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  final bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Image.asset(
            AssetsManager.shoppingCart,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: isLogin,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: SubtitleWidget(
                  label: 'Please login to have ultimate accsess',
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const ProfileDetailsWidget(),
            const AppProfileListTilesWidget(),
            
          ],
        ),
      ),
    );
  }
}
