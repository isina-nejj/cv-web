import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/appbar.dart';
import 'widgets/profile_section.dart';
import './widgets/skills_constants.dart';
import './widgets/skills_widget.dart';
import './widgets/skill_group.dart';

void main() => runApp(MyApp());

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayout({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobile;
        } else if (constraints.maxWidth < 900) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildThemeData(),
      home: ResponsiveLayout(
        mobile: const ResumePage(),
        tablet: const ResumePage(),
        desktop: const DesktopResumePage(),
      ),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black.withOpacity(0.9),
        elevation: 4,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: GoogleFonts.roboto(color: Colors.white, fontSize: 16),
        bodyMedium: GoogleFonts.roboto(color: Colors.white70, fontSize: 14),
      ),
    );
  }
}

class ResponsiveText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const ResponsiveText({
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double scaleFactor = constraints.maxWidth / 400;
        return Text(
          text,
          style: TextStyle(
            fontSize: fontSize * scaleFactor,
            fontWeight: fontWeight,
            color: color,
          ),
        );
      },
    );
  }
}

// Updated the title of the ContactBox to "About Me"
class ContactBox extends StatelessWidget {
  const ContactBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent, // Removed black background
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Updated the location and education sections to open a map when clicked
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.redAccent),
                    SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          const url =
                              'https://www.google.com/maps?q=Ahvaz,+Khuzestan,+Iran';
                          final uri = Uri.parse(url);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text(
                          'Iran, Khuzestan, Ahvaz',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.school, color: Colors.blueAccent),
                    SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          const url =
                              'https://www.google.com/maps?q=Khatam+Al-Anbia+University+of+Technology,+Behbahan';
                          final uri = Uri.parse(url);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text(
                          'Education: Bachelor in Computer Engineering, Khatam Al-Anbia University of Technology, Behbahan',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.book, color: Colors.greenAccent),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Diploma: Accounting',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Update ResumePage to use the SkillsWidget
class ResumePage extends StatelessWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarCopy(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionTitle(title: 'About Me'),
                            const ContactBox(),
                            SectionTitle(title: 'Skills'),
                            SkillsWidget(
                              skills:
                                  skills, // استفاده از آرایه skills از فایل skills_constants.dart
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

// Update DesktopResumePage to use the SkillsWidget
class DesktopResumePage extends StatelessWidget {
  const DesktopResumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[900],
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            ProfileSection(
                              name: 'Sina NejadHosseini',
                              title: 'Programmer & Network Specialist',
                              email: 'sina.nejadhoseini@gmail.com',
                              phone: '+09167991896',
                              telegram: 't.me/isina_nej',
                              linkedIn:
                                  'https://www.linkedin.com/in/sina-nejadhoseini-872b4431a',
                            ),
                            SizedBox(height: 16),
                            const ContactBox(),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.black,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SkillsWidget(
                    skills:
                        skills, // استفاده از آرایه skills از فایل skills_constants.dart
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  final List<Map<String, dynamic>> skills;

  const SkillsSection({required this.skills, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          skills.map((skillGroup) {
            return SkillGroup(
              title: skillGroup['title'],
              skills: skillGroup['skills'],
            );
          }).toList(),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
