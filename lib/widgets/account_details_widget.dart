import 'package:e_store/services/assets_manager.dart';
import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).cardColor,
              border: Border.all(
                  color: Theme.of(context).colorScheme.background, width: 3),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(AssetsManager.profileImagePlaceholder),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleWidget(
                label: 'Hussain Al-Hasan',
              ),
              SubtitleWidget(
                label: "itsf4sam@gmail.com",
                color: Colors.grey[600],
              )
            ],
          )
        ],
      ),
    );
  }
}
