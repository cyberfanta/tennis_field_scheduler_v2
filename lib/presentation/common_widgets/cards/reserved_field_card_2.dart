import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/app/theme/ui_colors.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/static_data/static_data.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../../../domain/entities/field_schedule.dart';
import '../../../domain/entities/scheduled_field.dart';

class ReservedFieldCard2 extends StatelessWidget {
  const ReservedFieldCard2({
    super.key,
    required this.scheduledField,
  });

  final ScheduledField scheduledField;

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    TennisField field = fields[scheduledField.fieldIndex];
    String availableDate = "Next Date";

    return Container(
      width: double.infinity,
      height: 153,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cCardBorder),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
        vertical: 13,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            field.smallImage,
            width: 60,
            height: 60,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      field.name,
                      style: styleMedium(18, cBlack),
                    ),
                    const Expanded(child: SizedBox.shrink()),
                    SvgPicture.asset(
                      "assets/images/rain.svg",
                      fit: BoxFit.none,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${(scheduledField.rainChance * 100).toInt()}%",
                      style: styleRegular(12, cBlack),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  (field.fieldType == FieldType.a)
                      ? uiTexts.fieldA
                      : (field.fieldType == FieldType.b)
                      ? uiTexts.fieldB
                      : uiTexts.fieldC,
                  style: styleRegular(12, cBlack),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/date.svg",
                      fit: BoxFit.none,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      availableDate,
                      style: styleRegular(12, cBlack),
                    ),
                    const Expanded(child: SizedBox.shrink()),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "${uiTexts.reservedBy}:",
                      style: styleRegular(12, cBlack),
                    ),
                    const SizedBox(width: 4),
                    Image.asset(
                      "assets/images/avatar.png",
                      fit: BoxFit.fitHeight,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      scheduledField.owner,
                      style: styleRegular(12, cBlack),
                    ),
                    const Expanded(child: SizedBox.shrink()),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/time.svg",
                      fit: BoxFit.none,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${scheduledField.duration} ${uiTexts.hours}",
                      style: styleRegular(12, cBlack),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 1,
                      height: 16,
                      color: cGray2,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "\$${field.price}",
                      style: styleRegular(12, cBlack),
                    ),
                    const Expanded(child: SizedBox.shrink()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
