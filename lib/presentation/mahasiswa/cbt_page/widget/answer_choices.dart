import 'package:cbt_app/common/constants/colors.dart';
import 'package:flutter/material.dart';

enum AnswerCorrection { none, selected }

class AnswerChoices extends StatelessWidget {
  final String label;
  final String image;
  final void Function(String value) onChanged;
  final bool isSelected;
  final AnswerCorrection answerCorrection;

  const AnswerChoices({
    super.key,
    required this.label,
    required this.image,
    required this.onChanged,
    this.isSelected = false,
    this.answerCorrection = AnswerCorrection.none,
  });

  @override
  Widget build(BuildContext context) {
    if (answerCorrection == AnswerCorrection.selected) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: ColorName.lightGreen,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: const ShapeDecoration(
                color: ColorName.white,
                shape: OvalBorder(
                  side: BorderSide(width: 1, color: ColorName.lightGreen),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Image.network(
                  image,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: () => onChanged(label),
        child: Container(
          // height: image != '' ? 400 : null,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: isSelected ? ColorName.primary : ColorName.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: ShapeDecoration(
                  color: isSelected ? ColorName.lightRed : ColorName.white,
                  shape: OvalBorder(
                    side: BorderSide(
                        width: isSelected ? 0 : 2, color: ColorName.primary),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: image != '' ? 12 : 14,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? ColorName.white : ColorName.primary,
                      ),
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                    ),
                    const SizedBox(height: 10),
                    image != ''
                      ? Image.network(
                          image,
                          height: 200,
                          // width: 200,
                          fit: BoxFit.fill,
                        )
                      : const SizedBox(),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
