import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<ProfileController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profil Saya', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage(
                'images/profile.jpg',
              ), 
              backgroundColor: Colors.blueAccent,
            ),
            const SizedBox(height: 20),

            const Text(
              'Aditya Fathan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'aditya.fathan@example.com',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 5),
            const Text(
              'Bergabung sejak: Januari 2025',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Poin Saya",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text(
                    "1.250 poin",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // === Menu Navigasi ===
            buildMenuTile(Icons.workspace_premium, "Sertifikat Saya"),
            const Divider(),
            buildMenuTile(Icons.payment, "Riwayat Pembayaran"),
            const Divider(),
            buildMenuTile(Icons.settings, "Pengaturan Akun"),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                'Keluar',
                style: TextStyle(color: Colors.redAccent),
              ),
              onTap: () => Get.offAllNamed('/onboarding'),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk menu
  Widget buildMenuTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: () => Get.snackbar("Menu", "Kamu membuka $title"),
    );
  }
}
