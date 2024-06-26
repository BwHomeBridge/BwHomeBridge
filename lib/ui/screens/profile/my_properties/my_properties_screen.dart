import 'package:bw_home_bridge/backend/cubits/cubit/my_properties_cubit.dart';
import 'package:bw_home_bridge/backend/cubits/cubit/my_properties_state.dart';
import 'package:bw_home_bridge/ui/screens/profile/my_properties/wigets/my_property_card.dart';
import 'package:bw_home_bridge/ui/widgets/mc_h_spacer.dart';
import 'package:bw_home_bridge/ui/widgets/mc_icon_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPropertiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kSpacing),
        child: Column(
          children: [
            McVSpacer(),
            Row(
              children: [
                McIconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                McHSpacer(10),
                McText.h2M('My properties')
              ],
            ),
            BlocProvider(
              create: (context) => MyPropertiesCubit()..loadProperties(),
              child: BlocBuilder<MyPropertiesCubit, MyPropertiesState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => Center(child: Text('Welcome')),
                    loading: () => Center(child: CircularProgressIndicator()),
                    loaded: (properties) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: properties.length,
                        itemBuilder: (context, index) {
                          final property = properties[index];
                          return MyPropertyCard(property: property);
                        },
                      );
                    },
                    error: (message) => Center(child: Text(message)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
