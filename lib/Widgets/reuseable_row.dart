import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  final String name;
  final String value;

  const ReusableWidget({
    super.key,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(13, 13, 13, 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
              Text(value,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Divider(
          color: Colors.black.withOpacity(0.5),
          height: 2,
        )
      ],
    );
  }
}
