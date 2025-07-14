import 'package:app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';
import 'package:reusable_list_item/domain/entity/info_entity.dart';



class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.infoList,
    this.onItemTap,
    this.showDivider = true,
    this.cardElevation = 2.0,
    this.cardPadding = const EdgeInsets.all(PaddingConstants.verticalPadding),
  });

  /// List of information items to display.
  final List<InfoEntity> infoList;

  /// Optional callback when a list item is tapped.
  final void Function(InfoEntity info)? onItemTap;

  /// Whether to show a divider between list items.
  final bool showDivider;

  /// Elevation of the card.
  final double cardElevation;

  /// Padding inside the card.
  final EdgeInsets cardPadding;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: cardElevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: cardPadding,
        child: Column(
          children: [
            for (int i = 0; i < infoList.length; i++) ...[
              _buildInfoItem(infoList[i]),
              if (showDivider && i != infoList.length - 1)
                const Divider(height: 16),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(InfoEntity info) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: info.imgUrl != null
          ? AppCircleAvatar(
        radius: 20,
        imageSource: info.imgUrl,
      )
          : null,
      title: Text(
        info.title ?? '',
        style: AppTextStyles.subtitle,
      ),
      subtitle: info.subTitle != null
          ? Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          info.subTitle!,
          style: AppTextStyles.subtitleSmall,
        ),
      )
          : null,
      onTap: () => onItemTap?.call(info),
    );
  }
}

// class InfoCard extends StatelessWidget {
//   final List<InfoEntity> infoList;
//
//   const InfoCard({super.key, required this.infoList});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         padding: EdgeInsets.all(PaddingConstants.verticalPadding),
//         child: Column(
//           children: <Widget>[
//             ...infoList.map((InfoEntity info) {
//               return _buildGroupInfoItem(groupInfo: info);
//             }),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildGroupInfoItem({
//     required InfoEntity groupInfo,
//     VoidCallback? onTap,
//   }) {
//     return ListTile(
//       leading:
//           groupInfo.imgUrl != null
//               ? AppCircleAvatar(radius: 20, imageSource: groupInfo.imgUrl)
//               : null,
//       title: Text(
//         groupInfo.title ?? '',
//         style: AppTextStyles.subtitle,
//       ),
//       subtitle: Padding(
//         padding: const EdgeInsets.only(top: 8.0),
//         child: Text(
//           groupInfo.subTitle ?? '',
//           style: AppTextStyles.subtitleSmall,
//         ),
//       ),
//       onTap: onTap,
//     );
//   }
// }

