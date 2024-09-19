import 'package:flutter/material.dart';
import 'package:stardust_store/common/widgets/sidebar.dart';
import 'package:stardust_store/features/dashboard/dashboard.dart';
import 'package:stardust_store/features/products/products.dart';
import 'package:stardust_store/features/sells/sells.dart';
import 'package:stardust_store/features/settings/settings.dart';
import 'package:stardust_store/utils/constants/colors.dart';
import 'package:stardust_store/utils/constants/sizes.dart';
import 'package:stardust_store/utils/device/device_utility.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({Key? key}) : super(key: key);

  @override
  _WrapperPageState createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Dashboard(),
    Sells(),
    Products(),
    Settings(),
  ];

  void _onMenuItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
      print('Selected index: $_selectedIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Material(
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
                    padding: const EdgeInsets.all(2.0),
                    decoration: const ShapeDecoration(
                      color: StarColors.starPink,
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
                      children: [
                        SidebarMenuItem(
                          icon: Icons.insert_chart_rounded,
                          text: "Dashboard",
                          selected: _selectedIndex == 0,
                          onTap: () => _onMenuItemSelected(0),
                        ),
                        SidebarMenuItem(
                          icon: Icons.sell_rounded,
                          text: "Vendas",
                          selected: _selectedIndex == 1,
                          onTap: () => _onMenuItemSelected(1),
                        ),
                        SidebarMenuItem(
                          icon: Icons.star_rounded,
                          text: "Produtos",
                          selected: _selectedIndex == 2,
                          onTap: () => _onMenuItemSelected(2),
                        ),
                        SidebarMenuItem(
                          icon: Icons.settings_rounded,
                          text: "Configurações",
                          selected: _selectedIndex == 3,
                          onTap: () => _onMenuItemSelected(3),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: StarSizes.spaceBtwItems),
                  SidebarMenuItem(
                    icon: Icons.exit_to_app_rounded,
                    text: "Sair",
                    onTap: () =>
                        {}, // Implementar lógica para sair, se necessário
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarMenuItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final bool selected;

  const SidebarMenuItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.selected = false,
  });

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
          print(
              'Sidebar item tapped: ${widget.text}'); // Adicione um print para depuração
          widget.onTap();
        },
        borderRadius: BorderRadius.circular(8.0),
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        child: Container(
          width: double.infinity,
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
                  color: widget.selected
                      ? StarColors.starPink
                      : isHovered
                          ? StarColors.starPink
                          : StarColors.grey,
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
