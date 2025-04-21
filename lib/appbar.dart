import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppBarCopy extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCopy({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      title: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  SizedBox(width: 10),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double nameFontSize =
                          constraints.maxWidth < 600 ? 14 : 16;
                      double specializationFontSize =
                          constraints.maxWidth < 600 ? 12 : 14;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sina NejadHosseini',
                            style: TextStyle(
                              fontSize:
                                  nameFontSize, // Dynamic font size for name
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Programmer',
                            style: TextStyle(
                              fontSize:
                                  specializationFontSize, // Dynamic font size for specialization
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              Animate(
                effects: [
                  ShakeEffect(duration: Duration(milliseconds: 1000), hz: 2),
                ],
                onPlay: (controller) => controller.repeat(), // تکرار مداوم
                child: Transform.rotate(
                  angle: 2.4, // 180 degrees in radians
                  child: IconButton(
                    icon: Icon(Icons.phone, color: Colors.green),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => _buildContactSheet(context),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
      centerTitle: false,
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.95),
      shadowColor: Colors.deepPurpleAccent,
      elevation: 12,
    );
  }

  Widget _buildContactSheet(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _contactRow('Contact Me:', null),
          SizedBox(height: 8),
          _contactRow(
            'sina.nejadhoseini@gmail.com',
            Icons.email,
            'mailto:sina.nejadhoseini@gmail.com',
            Colors.red,
          ),
          SizedBox(height: 8),
          _contactRow(
            '+989167991896',
            Icons.phone,
            'tel:+989167991896',
            Colors.green,
          ),
          SizedBox(height: 8),
          _contactRow(
            'Telegram',
            Icons.telegram,
            'https://t.me/isina_nej',
            Colors.blue,
          ),
          SizedBox(height: 8),
          _contactRow(
            'LinkedIn',
            Icons.link,
            'https://www.linkedin.com/in/sina-nejadhoseini-872b4431a',
            Colors.blueAccent,
          ),
        ],
      ),
    );
  }

  Widget _contactRow(
    String text,
    IconData? icon, [
    String? link,
    Color? color,
  ]) {
    return Row(
      children: [
        if (icon != null) Icon(icon, color: color),
        if (icon != null) SizedBox(width: 8),
        Flexible(
          child: InkWell(
            onTap: link != null ? () => _launchUrl(link) : null,
            child: Text(
              text,
              style: TextStyle(
                color: color ?? Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
