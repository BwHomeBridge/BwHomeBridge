import 'package:bw_home_bridge/ui/screens/home/widgets/side_bar/fitlers_side_bar.dart';
import 'package:flutter/material.dart';

class HomeSearchFIlter extends StatelessWidget {
  const HomeSearchFIlter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPropertyFilterSideBar(context);
      },
      child: AbsorbPointer(
        absorbing: true,
        child: TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Click for property filters',
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade300,
            ),
            suffixIcon: IconButton(
              icon: ImageIcon(AssetImage('assets/icons/filter.png')),
              onPressed: () {},
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.grey.shade300, // Light grey color
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.grey.shade300, // Light grey color
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.grey.shade600, // Slightly darker grey for focus
                width: 1.0,
              ),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          ),
        ),
      ),
    );
  }
}
