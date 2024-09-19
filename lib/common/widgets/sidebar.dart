import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_store/utils/constants/colors.dart';
import 'package:stardust_store/utils/constants/sizes.dart';
import 'package:stardust_store/utils/device/device_utility.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
          border: Border(
            right: BorderSide(
              color: StarColors.starPink,
              width: 2.0,
            ),
          ),
        ),
        width: 250,
        height: StarDeviceUtils.getScreenHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:
                  const EdgeInsets.all(2.0), // Small padding for pink border
              decoration: const ShapeDecoration(
                color: StarColors.starPink, // Pink border color
                shape: CircleBorder(),
              ),
              margin: const EdgeInsets.only(top: 20),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/store.jpg'),
              ),
            ),
            const SizedBox(height: StarSizes.spaceBtwItems),
            Text(
              "Kpop Store",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: StarSizes.xxl),
            Expanded(
              child: ListView(
                children: const [
                  SidebarMenuItem(
                    icon: Icons.insert_chart_rounded,
                    text: "Dashboard",
                  ),
                  SidebarMenuItem(
                    icon: Icons.sell_rounded,
                    text: "Vendas",
                  ),
                  SidebarMenuItem(
                    icon: Icons.star_rounded,
                    text: "Produtos",
                  ),
                  SidebarMenuItem(
                    icon: Icons.settings_rounded,
                    text: "Configurações",
                  ),
                ],
              ),
            ),
            const SizedBox(height: StarSizes.spaceBtwItems),
            const SidebarMenuItem(
              icon: Icons.exit_to_app_rounded,
              text: "Dashboard",
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarMenuItem extends StatefulWidget {
  final IconData icon;
  final String text;

  const SidebarMenuItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  _SidebarMenuItemState createState() => _SidebarMenuItemState();
}

class _SidebarMenuItemState extends State<SidebarMenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: InkWell(
        onTap: () {
          // Handle menu item tap
        },
        borderRadius: BorderRadius.circular(8.0),
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        child: Container(
          width: double.infinity, // Ocupar toda a largura do Sidebar
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: isHovered
                ? StarColors.starBlue.withOpacity(0.05)
                : Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: StarDeviceUtils.getScreenWidth(context) * 0.02),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  color: isHovered ? StarColors.starPink : StarColors.grey,
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    widget.text,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
