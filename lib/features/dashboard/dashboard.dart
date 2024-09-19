import 'package:flutter/material.dart';
import 'package:stardust_store/common/widgets/sidebar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Sidebar(),
        Expanded(
          child: Container(
            color: Colors.white,
            child: const Center(
              child: Text('Dashboard'),
            ),
          ),
        ),
      ],
    );
  }
}
