import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messenger_ui/features/chat/design_dimens.dart';
import 'package:messenger_ui/features/chat/domain/entities/message_entity.dart';

class MyMessage extends StatelessWidget {
  final MessageEntity message;
  const MyMessage({
    super.key, required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: DesignDimens.bigPadding.asEdgeInsetsWith(
          left: DesignDimens.hugePadding,
        ),
        child: Stack(
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 45,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF3BEC78),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    DesignDimens.hugeRadius,
                  ),
                  topRight: Radius.circular(
                    DesignDimens.hugeRadius,
                  ),
                  bottomLeft: Radius.circular(
                    DesignDimens.hugeRadius,
                  ),
                ),
              ),
              padding: DesignDimens.largePadding.asEdgeInsetsWith(
                right: DesignDimens.tooGiantPadding,
                top: DesignDimens.mediumPadding,
                bottom: DesignDimens.bigPadding,
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Color(0xFF2B333E),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            Positioned(
                bottom: DesignDimens.smallPadding,
                right: DesignDimens.largePadding,
                child: Row(
                  children: [
                    Text(
                      DateFormat.Hm().format(message.date),
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    DesignDimens.smallEmptiness.horizontalBox,
                    Icon(Icons.done_all,size: 12,)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}