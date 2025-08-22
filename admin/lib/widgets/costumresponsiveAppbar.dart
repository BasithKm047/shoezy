import 'package:flutter/material.dart';

class Costumresponsiveappbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback onDraweerTap;

  const Costumresponsiveappbar({
    super.key,
    required this.title,
    required this.onDraweerTap,
  });

  @override
  Size get preferredSize => Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 60,
              child: Row(
                children: [
                  // Menu icon
                  Builder(
                    builder: (context) => IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(Icons.menu),
                    ),
                  ),
                  SizedBox(width: 10),

                  // Search bar
                  Expanded(
                    child: SizedBox(
                      height: 38,
                      child: TextField(
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                        ),
                      ),
                    ),
                  ),

                  Spacer(),

                  // Notification icon
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_active_outlined),
                  ),
                  SizedBox(width: 12),

                  // Profile Info 
                  Container(
                    padding: EdgeInsets.only(right: 8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18, // Much smaller than 160
                          backgroundImage:
                              AssetImage('asset/Basith km.jpg'),
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Admin',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Basith',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize: 12,
                                      color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Title Below AppBar
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: isMobile ? 20 : 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
