import 'package:flutter/material.dart';

class McRangeSlider extends StatefulWidget {
  final RangeValues initialRangeValues;
  final double min;
  final double max;
  final ValueChanged<RangeValues>? onChanged;
  final ValueChanged<RangeValues>? onChangeStart;
  final ValueChanged<RangeValues>? onChangeEnd;
  final Color? activeColor;
  final Color? inactiveColor;

  McRangeSlider({
    Key? key,
    required this.initialRangeValues,
    required this.min,
    required this.max,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.activeColor,
    this.inactiveColor,
  }) : super(key: key);

  @override
  _McRangeSliderState createState() => _McRangeSliderState();
}

class _McRangeSliderState extends State<McRangeSlider> {
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    _currentRangeValues = widget.initialRangeValues;
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      min: widget.min,
      max: widget.max,
      onChanged: (values) {
        setState(() {
          _currentRangeValues = values;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(values);
        }
      },
      onChangeStart: widget.onChangeStart,
      onChangeEnd: widget.onChangeEnd,
      activeColor: widget.activeColor,
      inactiveColor: widget.inactiveColor,
    );
  }
}
