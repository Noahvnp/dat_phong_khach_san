import 'package:flutter/material.dart';
import 'package:myshop/ui/auth/admin_screen.dart';
import 'package:provider/provider.dart';

import '../auth/auth_manager.dart';
import '../shared/app_bottomnavbar.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});
  static const routeName = '/user-product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Thông tin của bạn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(
                'https://yu.ctu.edu.vn/images/upload/article/2020/03/0305-logo-ctu.png',
                fit: BoxFit.scaleDown,
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: const [
                  Text('Tên'),
                  Text(
                    'Nam & Lực',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: const [
                  Text('SĐT'),
                  Text(
                    '0973.333.333',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: const [
                  Text('Email'),
                  Text(
                    'ptudd@gmail.com',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text(
                'Cập nhật thông tin',
                style: TextStyle(fontSize: 20),
              ),
              icon: const Icon(Icons.system_update_alt),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 20),
                backgroundColor: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context)
                  ..pop()
                  ..pushReplacementNamed('/');
                context.read<AuthManager>().logout();
              },
              label: const Text(
                'Đăng xuất',
                style: TextStyle(fontSize: 20),
              ),
              icon: const Icon(Icons.logout),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 20),
                backgroundColor: Colors.red,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AdminScreen.routeName);
              },
              child: const Text('Bạn là chủ khách sạn ? Đăng nhập tại đây !'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
