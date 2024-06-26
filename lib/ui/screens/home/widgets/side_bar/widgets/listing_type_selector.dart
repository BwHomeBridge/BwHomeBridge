import 'package:bw_home_bridge/backend/cubits/home/home_cubit.dart';
import 'package:bw_home_bridge/backend/helper_classes/project_filters.dart';
import 'package:bw_home_bridge/ui/widgets/mc_radio_list_tile.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListingTypeSelector extends StatefulWidget {
  const ListingTypeSelector({
    super.key,
  });

  @override
  State<ListingTypeSelector> createState() => _ListingTypeSelectorState();
}

class _ListingTypeSelectorState extends State<ListingTypeSelector> {
  late ProjectFilters projectFilters;
  @override
  void initState() {
    projectFilters = context.read<HomeCubit>().projectFilters;
    super.initState();
  }

  update(ListingType value) {
    projectFilters.listingType = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        McVSpacer(),
        McText.h3M('Listing type'),
        McRadioListTile(
          onChanged: (value) {
            update(value);
          },
          value: ListingType.all,
          groupValue: projectFilters.listingType,
          title: ListingType.all.name,
        ),
        McRadioListTile(
          onChanged: (value) {
            update(value);
          },
          value: ListingType.rent,
          groupValue: projectFilters.listingType,
          title: ListingType.rent.name,
        ),
        McRadioListTile(
          onChanged: (value) {
            update(value);
          },
          value: ListingType.sale,
          groupValue: projectFilters.listingType,
          title: ListingType.sale.name,
        ),
      ],
    );
  }
}
