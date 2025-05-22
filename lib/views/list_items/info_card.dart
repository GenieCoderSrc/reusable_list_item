import 'package:flutter/material.dart';
import 'package:app_style/app_style.dart';
import 'package:reusable_image_widget/app_circle_avatar.dart';
import 'package:reusable_list_item/domain/entity/info_entity.dart';


class InfoCard extends StatelessWidget {
  final List<InfoEntity> infoList;

  const InfoCard({super.key, required this.infoList});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(PaddingConstant.kVPadding),
        child: Column(
          children: <Widget>[
            ...infoList.map((InfoEntity info) {
              return _buildGroupInfoItem(groupInfo: info);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupInfoItem({
    required InfoEntity groupInfo,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading:
          groupInfo.imgUrl != null
              ? AppCircleAvatar(radius: 20, imageSource: groupInfo.imgUrl)
              : null,
      title: Text(
        groupInfo.title ?? '',
        style: AppTxtStyles.kSubTitleTextStyle,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          groupInfo.subTitle ?? '',
          style: AppTxtStyles.kSmallSubTitleTextStyle,
        ),
      ),
      onTap: onTap,
    );
  }
}
