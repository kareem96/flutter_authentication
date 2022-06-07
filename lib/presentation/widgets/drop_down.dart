import 'package:flutter/material.dart';
import 'package:flutter_auth/presentation/resources/dimens.dart';
import 'package:flutter_auth/presentation/resources/palette.dart';

class DropDown<T> extends StatefulWidget {
  const DropDown({
    Key? key,
    required this.value,
    required this.items,
    this.hint,
    required this.onChanged,
    this.hintIsVisible = true,
    this.prefixIcon,
  }) : super(key: key);
  final T value;
  final List<DropdownMenuItem<T>> items;
  final bool hintIsVisible;
  final String? hint;
  final ValueChanged<T?>? onChanged;
  final Widget? prefixIcon;

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.space8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.hintIsVisible,
            child: Text(
              widget.hint ?? "",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: Theme.of(context).hintColor),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: Dimens.space8),
            child: ButtonTheme(
              key: widget.key,
              alignedDropdown: true,
              padding: EdgeInsets.zero,
              child: DropdownButtonFormField(
                isDense: true,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  isDense: true,
                  isCollapsed: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: Dimens.space12),
                    child: widget.prefixIcon,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minHeight: Dimens.space24,
                    maxHeight: Dimens.space24,
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: Dimens.space12),
                  enabledBorder: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(Dimens.space4),
                    borderSide: const BorderSide(color: Palette.disable),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(Dimens.space4),
                    borderSide: const BorderSide(color: Palette.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(Dimens.space4),
                    borderSide: const BorderSide(color: Palette.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(Dimens.space4),
                    borderSide: const BorderSide(color: Palette.primary),
                  ),
                ),
                value: widget.value,
                items: widget.items,
                onChanged: widget.onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
