import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:flutter/material.dart';

class McSlider extends StatefulWidget {
  final String label;

  final String valueText;

  final double min;

  final double max;

  final int? divisions;

  final void Function(double value) onChanged;

  final double value;

  const McSlider({
    super.key,
    required this.label,
    required this.valueText,
    this.divisions,
    this.min = 0,
    required this.max,
    required this.onChanged,
    required this.value,
  });

  @override
  State<McSlider> createState() => _McSliderState();
}

class _McSliderState extends State<McSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            McText(widget.label, style: TextStyle()),
            McText(widget.valueText, style: TextStyle()),
          ],
        ),
        // McVSpacer(5),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackShape: CustomTrackShape(),
          ),
          child: Slider(
            value: widget.value,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            label: widget.value.round().toString(),
            onChanged: (double value) {
              setState(
                () {},
              );
              widget.onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
