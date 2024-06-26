import 'package:bw_home_bridge/backend/cubits/home/home_cubit.dart';
import 'package:bw_home_bridge/backend/helper_classes/project_filters.dart';
import 'package:bw_home_bridge/ui/widgets/mc_radio_list_tile.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyTypeSelector extends StatefulWidget {
  const PropertyTypeSelector({
    super.key,
  });

  @override
  State<PropertyTypeSelector> createState() => _PropertyTypeSelectorState();
}

class _PropertyTypeSelectorState extends State<PropertyTypeSelector> {
  late ProjectFilters projectFilters;
  @override
  void initState() {
    projectFilters = context.read<HomeCubit>().projectFilters;
    super.initState();
  }

  update(PropertyType value) {
    projectFilters.propertyType = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        McVSpacer(),
        McText.h3M('Property type'),
        McRadioListTile(
          onChanged: (value) {
            update(value);
          },
          groupValue: projectFilters.propertyType,
          value: PropertyType.all,
          title: PropertyType.all.name,
        ),
        McRadioListTile(
          onChanged: (value) {
            update(value);
          },
          groupValue: projectFilters.propertyType,
          value: PropertyType.residential,
          title: PropertyType.residential.name,
        ),
        McRadioListTile(
          onChanged: (value) {
            update(value);
          },
          groupValue: projectFilters.propertyType,
          value: PropertyType.commercial,
          title: PropertyType.commercial.name,
        ),
      ],
    );
  }
}
