import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<Map<String, String>> notifications = [
<<<<<<< HEAD
    {
      'title': 'New Arrivals Alert!',
      'date': '15 July 2023',
      'image': 'assets/images/verify.png', // Sesuaikan dengan nama file Anda
    },
    {
      'title': 'Flash Sale Announcement',
      'date': '15 July 2023',
      'image': 'assets/images/reset.png',
    },
    {
      'title': 'Exclusive Discounts Inside',
      'date': '15 July 2023',
      'image': 'assets/images/banner.png',
    },
    {
      'title': 'Limited Stock - Act Fast!',
      'date': '15 July 2023',
      'image': 'assets/images/signin.png',
    },
    {
      'title': 'Get Ready to Shop',
      'date': '15 July 2023',
      'image': 'assets/images/create.png',
    },
    {
      'title': "Don't Miss Out on Savings",
      'date': '15 July 2023',
      'image': 'assets/images/forgot.png',
    },
    {
      'title': 'Special Offer Just for You',
      'date': '15 July 2023',
      'image': 'assets/images/onboarding.png',
    },
    {
      'title': 'Get Ready to Shop',
      'date': '15 July 2023',
      'image': 'assets/images/signin.png',
    },
=======
    {'title': 'New Arrivals Alert!', 'date': '15 July 2023'},
    {'title': 'Flash Sale Announcement', 'date': '15 July 2023'},
    {'title': 'Exclusive Discounts Inside', 'date': '15 July 2023'},
    {'title': 'Limited Stock - Act Fast!', 'date': '15 July 2023'},
    {'title': 'Get Ready to Shop', 'date': '15 July 2023'},
    {'title': "Don't Miss Out on Savings", 'date': '15 July 2023'},
    {'title': 'Special Offer Just for You', 'date': '15 July 2023'},
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
  ];

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: isDark ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            fontFamily: 'TomatoGrotesk',
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
=======
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
          ),
        ),
        centerTitle: true,
      ),
<<<<<<< HEAD
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off_outlined,
                    size: 80,
                    color: isDark ? Colors.grey[600] : Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Notifications',
                    style: TextStyle(
                      fontFamily: 'TomatoGrotesk',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'You\'re all caught up!',
                    style: TextStyle(
                      fontFamily: 'TomatoGrotesk',
                      fontSize: 14,
                      color: isDark ? Colors.grey[500] : Colors.grey[500],
                    ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: notifications.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                thickness: 1,
                color: isDark ? Colors.grey[800] : Colors.grey[200],
                indent: 88,
              ),
              itemBuilder: (context, index) {
                final item = notifications[index];
                return Dismissible(
                  key: Key('${item['title']}_$index'),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.red,
                    child: const Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      notifications.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item['title']} dismissed'),
                        duration: const Duration(seconds: 2),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            setState(() {
                              notifications.insert(index, item);
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: isDark ? Colors.grey[800] : Colors.grey[200],
                        ),
                        child: Image.asset(
                          item['image']!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback jika gambar tidak ditemukan
                            return Container(
                              color: isDark ? Colors.grey[800] : Colors.grey[200],
                              child: Icon(
                                Icons.notifications,
                                color: isDark ? Colors.grey[600] : Colors.grey[400],
                                size: 28,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    title: Text(
                      item['title']!,
                      style: TextStyle(
                        fontFamily: 'TomatoGrotesk',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        item['date']!,
                        style: TextStyle(
                          fontFamily: 'TomatoGrotesk',
                          color: isDark ? Colors.grey[400] : Colors.grey[600],
                          fontSize: 13,
                        ),
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: isDark ? Colors.grey[600] : Colors.grey[400],
                    ),
                    onTap: () {
                      // TODO: Navigate to notification detail
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Opened: ${item['title']}'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
=======
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Dismissible(
            key: Key(item['title']!),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                notifications.removeAt(index);
              });
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey.shade200,
                child: const Icon(Icons.notifications, color: Colors.black54, size: 28),
              ),
              title: Text(
                item['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                item['date']!,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          );
        },
      ),
    );
  }
}
>>>>>>> 6bb3292690799ba5fdb3b65e11b64d2ec4f20336
