import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BITStudentHub());
}

class BITStudentHub extends StatelessWidget {
  const BITStudentHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text == "sms" &&
        _passwordController.text == "bitsathy") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid Credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', height: 100),
              const SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BIT Student Hub')),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          PortalTile(
            title: "Wiki Portal",
            image: "assets/wiki.png",
            url: "https://wiki.bitsathy.ac.in",
          ),
          PortalTile(
            title: "Student Dashboard",
            image: "assets/dashboard.png",
            url: "https://bip.bitsathy.ac.in",
          ),
          PortalTile(
            title: "PS Portal",
            image: "assets/ps_portal.png",
            url: "https://ps.bitsathy.ac.in",
          ),
          PortalTile(
            title: "Camps Portal",
            image: "assets/camps.png",
            url: "https://camps.bitsathy.ac.in",
          ),
          PortalTile(
            title: "Google Classroom",
            image: "assets/google_classroom.png",
            url: "https://classroom.google.com",
          ),
          PortalTile(
            title: "Placement Grooming",
            image: "assets/placement.png",
            url:
                "https://docs.google.com/spreadsheets/d/1sAM_8bfU-pK3HNochOuDnNmQ_DudgrJtCtaoH355K8c",
          ),
          // 🔹 NEW LIBRARY INVENTORY MENU ADDED
          PortalTile(
            title: "Library Inventory",
            image: "assets/library.png",
            url: "https://smslibrarymanagement.netlify.app/",
          ),
        ],
      ),
    );
  }
}

class PortalTile extends StatelessWidget {
  final String title;
  final String image;
  final String url;

  const PortalTile({
    super.key,
    required this.title,
    required this.image,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image, width: 40, height: 40),
      title: Text(title),
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
    );
  }
}
