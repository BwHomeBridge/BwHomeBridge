import 'package:bw_home_bridge/backend/cubits/home/home_cubit.dart';
import 'package:bw_home_bridge/backend/helper_classes/project_filters.dart';
import 'package:bw_home_bridge/ui/widgets/mc_h_spacer.dart';
import 'package:bw_home_bridge/ui/widgets/mc_range_slider.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/extentions/price_formating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceRangeSelector extends StatefulWidget {
  const PriceRangeSelector({
    super.key,
  });

  @override
  State<PriceRangeSelector> createState() => _PriceRangeSelectorState();
}

class _PriceRangeSelectorState extends State<PriceRangeSelector> {
  late ProjectFilters projectFilters;
  @override
  void initState() {
    projectFilters = context.read<HomeCubit>().projectFilters;
    super.initState();
  }

  update(RangeValues range) {
    projectFilters.minPrice = range.start;
    projectFilters.maxPrice = range.end;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        McText.h3M('Price range'),
        McRangeSlider(
          initialRangeValues: RangeValues(
            projectFilters.minPrice,
            projectFilters.maxPrice,
          ),
          min: 0,
          max: kMaxPrice,
          onChanged: (range) {
            update(range);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            McText.body(projectFilters.minPrice.toBWP()),
            McHSpacer(kSpacing),
            McText.body(projectFilters.maxPrice.toBWP()),
          ],
        )
      ],
    );
  }
}
