import 'package:bw_home_bridge/backend/models/user_property.dart';
import 'package:bw_home_bridge/ui/widgets/mc_icon_button.dart';
import 'package:bw_home_bridge/ui/widgets/mc_text.dart';
import 'package:bw_home_bridge/ui/widgets/mc_v_spacer.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewMyProperty extends StatelessWidget {
  final UserProperty userProperty;

  const ViewMyProperty({Key? key, required this.userProperty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Hero(
            tag: userProperty.id,
            child: Container(
              height: 350,
              padding: const EdgeInsets.all(kSpacing).copyWith(top: 40),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(userProperty.images!.first),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      McIconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

          ///
          Padding(
            padding: const EdgeInsets.all(kSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                McText.h1M(
                  userProperty.title,
                ),
                McVSpacer(),
                Container(
                  padding: EdgeInsets.all(10),
                  color: McColors.secondary,
                  child: McText.h3M(
                    'Next Rent Due Date: ${DateFormat.yMMMd().format(userProperty.nextRentDueDate)}',
                  ),
                ),
                McVSpacer(),
                Divider(),
                if (userProperty.rentPaymentHistory.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      McText.h3M(
                        'Rent Payment History:',
                      ),
                      McVSpacer(10),
                      ...userProperty.rentPaymentHistory
                          .map((payment) => Container(
                                margin: EdgeInsets.only(bottom: kSpacing),
                                decoration: BoxDecoration(
                                  color: Color(0xffBCB8DC).withOpacity(.25),
                                  border: Border.all(
                                    color: McColors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  title: Text(
                                      'Payment Date: ${DateFormat.yMMMd().format(payment.date)}'),
                                  subtitle: Text('Amount: ${payment.amount}'),
                                ),
                              ))
                          .toList(),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
