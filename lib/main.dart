import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:url_launcher/url_launcher.dart';
import 'appbar.dart';

// Define skill percentages as variables for easier modification
const double dartSkillPercentage = 0.98;
const double flutterSkillPercentage = 0.92;
const double htmlSkillPercentage = 0.999;
const double cssSkillPercentage = 0.999;
const double tailwindSkillPercentage = 0.85;
const double javascriptSkillPercentage = 0.90;
const double reactSkillPercentage = 0.50;
const double nextJsSkillPercentage = 0.50;
const double pythonSkillPercentage = 0.9;
const double djangoSkillPercentage = 0.85;
const double matlabSkillPercentage = 0.6;
const double cSkillPercentage = 0.9;
const double cppSkillPercentage = 0.99;
const double csharpSkillPercentage = 0.75;
const double phpSkillPercentage = 0.65;
const double assemblySkillPercentage = 0.75;
const double networkSkillPercentage = 0.85;
const double windowsServerSkillPercentage = 0.85;
const double virtualMachineSkillPercentage = 0.75;
const double mikrotikSkillPercentage = 0.8;

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
                          'Ahvaz, Khuzestan, Iran',
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

// Create a reusable widget for the Skills section
class SkillsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> skills;

  const SkillsWidget({required this.skills, Key? key}) : super(key: key);

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
                            if (constraints.maxWidth >= 600 &&
                                constraints.maxWidth < 900)
                              SectionTitle(title: 'About Me'),
                            const ContactBox(),
                            SectionTitle(title: 'Skills'),
                            SkillsWidget(
                              skills: [
                                {
                                  'title': 'Programming Languages & Frameworks',
                                  'skills': [
                                    SkillProgress(
                                      skill: 'Dart',
                                      percentage: dartSkillPercentage,
                                      icon: Icons.code,
                                      iconColor: Colors.cyanAccent,
                                      aboutMeDescription:
                                          'Dart is a client-optimized language for fast apps on any platform.',
                                    ),
                                    SkillProgress(
                                      skill: 'Flutter',
                                      percentage: flutterSkillPercentage,
                                      icon: Icons.phone_android,
                                      iconColor: Colors.pinkAccent,
                                      aboutMeDescription:
                                          'Flutter is an open-source UI software development toolkit created by Google.',
                                    ),
                                  ],
                                },
                                {
                                  'title': 'HTML, CSS & Tailwind',
                                  'skills': [
                                    SkillProgress(
                                      skill: 'HTML',
                                      percentage: htmlSkillPercentage,
                                      icon: Icons.web,
                                      iconColor: Colors.orangeAccent,
                                      aboutMeDescription:
                                          'HTML is the standard markup language for creating web pages.',
                                    ),
                                    SkillProgress(
                                      skill: 'CSS',
                                      percentage: cssSkillPercentage,
                                      icon: Icons.style,
                                      iconColor: Colors.lightBlueAccent,
                                      aboutMeDescription:
                                          'CSS is a style sheet language used for describing the presentation of a document written in HTML.',
                                    ),
                                    SkillProgress(
                                      skill: 'Tailwind',
                                      percentage: tailwindSkillPercentage,
                                      icon: Icons.layers,
                                      iconColor: Colors.greenAccent,
                                      aboutMeDescription:
                                          'Tailwind CSS is a utility-first CSS framework for rapidly building custom user interfaces.',
                                    ),
                                  ],
                                },
                                {
                                  'title': 'JavaScript & Frameworks',
                                  'skills': [
                                    SkillProgress(
                                      skill: 'JavaScript',
                                      percentage: javascriptSkillPercentage,
                                      icon: Icons.javascript,
                                      iconColor: Colors.yellowAccent,
                                      aboutMeDescription:
                                          'JavaScript is a programming language that conforms to the ECMAScript specification.',
                                    ),
                                    SkillProgress(
                                      skill: 'React',
                                      percentage: reactSkillPercentage,
                                      icon: Icons.refresh,
                                      iconColor: Colors.blueAccent,
                                      aboutMeDescription:
                                          'React is a JavaScript library for building user interfaces.',
                                    ),
                                    SkillProgress(
                                      skill: 'Next.js',
                                      percentage: nextJsSkillPercentage,
                                      icon: Icons.next_plan,
                                      iconColor:
                                          Colors.tealAccent, // Changed color
                                      aboutMeDescription:
                                          'Next.js is a React framework that enables functionality such as server-side rendering and generating static websites.',
                                    ),
                                  ],
                                },
                                {
                                  'title': 'Python & Django',
                                  'skills': [
                                    SkillProgress(
                                      skill: 'Python',
                                      percentage: pythonSkillPercentage,
                                      icon: Icons.code,
                                      iconColor: Colors.limeAccent,
                                      aboutMeDescription:
                                          'Python is an interpreted, high-level and general-purpose programming language.',
                                    ),
                                    SkillProgress(
                                      skill: 'Django',
                                      percentage: djangoSkillPercentage,
                                      icon: Icons.web,
                                      iconColor: Colors.tealAccent,
                                      aboutMeDescription:
                                          'Django is a high-level Python web framework that encourages rapid development and clean, pragmatic design.',
                                    ),
                                  ],
                                },
                                {
                                  'title': 'Other Languages',
                                  'skills': [
                                    SkillProgress(
                                      skill: 'Matlab',
                                      percentage: matlabSkillPercentage,
                                      icon: Icons.calculate,
                                      iconColor: Colors.redAccent,
                                      aboutMeDescription:
                                          'MATLAB is a programming platform designed specifically for engineers and scientists.',
                                    ),
                                    SkillProgress(
                                      skill: 'C',
                                      percentage: cSkillPercentage,
                                      icon: Icons.computer,
                                      iconColor: Colors.lightBlueAccent,
                                      aboutMeDescription:
                                          'C is a general-purpose, procedural computer programming language.',
                                    ),
                                    SkillProgress(
                                      skill: 'C++',
                                      percentage: cppSkillPercentage,
                                      icon: Icons.computer,
                                      iconColor: Colors.greenAccent,
                                      aboutMeDescription:
                                          'C++ is a general-purpose programming language created as an extension of the C programming language.',
                                    ),
                                    SkillProgress(
                                      skill: 'C#',
                                      percentage: csharpSkillPercentage,
                                      icon: Icons.computer,
                                      iconColor: Colors.purpleAccent,
                                      aboutMeDescription:
                                          'C# is a modern, object-oriented programming language developed by Microsoft.',
                                    ),
                                    SkillProgress(
                                      skill: 'PHP',
                                      percentage: phpSkillPercentage,
                                      icon: Icons.web,
                                      iconColor: Colors.orangeAccent,
                                      aboutMeDescription:
                                          'PHP is a popular general-purpose scripting language that is especially suited to web development.',
                                    ),
                                    SkillProgress(
                                      skill: 'Assembly',
                                      percentage: assemblySkillPercentage,
                                      icon: Icons.memory,
                                      iconColor: Colors.grey,
                                      aboutMeDescription:
                                          'Assembly language is a low-level programming language for a computer or other programmable device.',
                                    ),
                                  ],
                                },
                                {
                                  'title': 'Networking Skills',
                                  'skills': [
                                    SkillProgress(
                                      skill: 'Network+',
                                      percentage: networkSkillPercentage,
                                      icon: Icons.network_wifi,
                                      iconColor: Colors.cyanAccent,
                                      aboutMeDescription:
                                          'Network+ is a certification that validates the technical skills needed to securely establish, maintain and troubleshoot the essential networks that businesses rely on.',
                                    ),
                                    SkillProgress(
                                      skill: 'Windows Server',
                                      percentage: windowsServerSkillPercentage,
                                      icon: Icons.desktop_windows,
                                      iconColor: Colors.greenAccent,
                                      aboutMeDescription:
                                          'Windows Server is a group of operating systems designed by Microsoft that supports enterprise-level management, data storage, applications, and communications.',
                                    ),
                                  ],
                                },
                                {
                                  'title': 'Virtualization & Routers',
                                  'skills': [
                                    SkillProgress(
                                      skill: 'Virtual Machine',
                                      percentage: virtualMachineSkillPercentage,
                                      icon: Icons.cloud,
                                      iconColor: Colors.pinkAccent,
                                      aboutMeDescription:
                                          'A virtual machine is an emulation of a computer system.',
                                    ),
                                    SkillProgress(
                                      skill: 'Mikrotik',
                                      percentage: mikrotikSkillPercentage,
                                      icon: Icons.router,
                                      iconColor: Colors.orangeAccent,
                                      aboutMeDescription:
                                          'MikroTik is a Latvian company that develops routers and wireless ISP systems.',
                                    ),
                                  ],
                                },
                                {
                                  'title':
                                      'Miscellaneous Skills & Applications',
                                  'skills': [
                                    SkillProgress(
                                      skill: 'Digital Marketing',
                                      percentage: 0.6,
                                      icon: Icons.mark_email_read,
                                      iconColor: Colors.redAccent,
                                      aboutMeDescription:
                                          'Digital marketing is the component of marketing that utilizes internet and online based digital technologies.',
                                    ),
                                    SkillProgress(
                                      skill: 'ICDL',
                                      percentage: 0.9,
                                      icon: Icons.book,
                                      iconColor: Colors.lightBlueAccent,
                                      aboutMeDescription:
                                          'The International Computer Driving Licence (ICDL) is a computer literacy certification program.',
                                    ),
                                  ],
                                },
                                {
                                  'title': 'Web & Version Control',
                                  'skills': [
                                    SkillProgress(
                                      skill: 'WordPress',
                                      percentage: 0.85,
                                      icon: Icons.web,
                                      iconColor: Colors.greenAccent,
                                      aboutMeDescription:
                                          'WordPress is a free and open-source content management system (CMS) written in PHP and paired with a MySQL or MariaDB database.',
                                    ),
                                    SkillProgress(
                                      skill: 'Git, GitHub',
                                      percentage: 0.88,
                                      icon: Icons.code,
                                      iconColor:
                                          Colors.purpleAccent, // Changed color
                                      aboutMeDescription:
                                          'Git is a distributed version-control system for tracking changes in source code during software development. GitHub is a provider of Internet hosting for software development and version control using Git.',
                                    ),
                                  ],
                                },
                                {
                                  'title': 'Operating Systems',
                                  'skills': [
                                    SkillProgress(
                                      skill: 'Windows',
                                      percentage: 0.95,
                                      icon: Icons.desktop_windows,
                                      iconColor: Colors.cyanAccent,
                                      aboutMeDescription:
                                          'Windows is a group of several proprietary graphical operating system families, all of which are developed and marketed by Microsoft.',
                                    ),
                                    SkillProgress(
                                      skill: 'Linux',
                                      percentage: 0.85,
                                      icon: Icons.laptop,
                                      iconColor: Colors.orangeAccent,
                                      aboutMeDescription:
                                          'Linux is a family of open-source Unix-like operating systems based on the Linux kernel.',
                                    ),
                                  ],
                                },
                              ],
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
                              email: 'sina4501@gmail.com',
                              phone: '+09167991896',
                              telegram: '@sina_telegram',
                              linkedIn: 'linkedin.com/in/sina-profile',
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
                    skills: [
                      {
                        'title': 'Programming Languages & Frameworks',
                        'skills': [
                          SkillProgress(
                            skill: 'Dart',
                            percentage: dartSkillPercentage,
                            icon: Icons.code,
                            iconColor: Colors.cyanAccent,
                            aboutMeDescription:
                                'Dart is a client-optimized language for fast apps on any platform.',
                          ),
                          SkillProgress(
                            skill: 'Flutter',
                            percentage: flutterSkillPercentage,
                            icon: Icons.phone_android,
                            iconColor: Colors.pinkAccent,
                            aboutMeDescription:
                                'Flutter is an open-source UI software development toolkit created by Google.',
                          ),
                        ],
                      },
                      {
                        'title': 'HTML, CSS & Tailwind',
                        'skills': [
                          SkillProgress(
                            skill: 'HTML',
                            percentage: htmlSkillPercentage,
                            icon: Icons.web,
                            iconColor: Colors.orangeAccent,
                            aboutMeDescription:
                                'HTML is the standard markup language for creating web pages.',
                          ),
                          SkillProgress(
                            skill: 'CSS',
                            percentage: cssSkillPercentage,
                            icon: Icons.style,
                            iconColor: Colors.lightBlueAccent,
                            aboutMeDescription:
                                'CSS is a style sheet language used for describing the presentation of a document written in HTML.',
                          ),
                          SkillProgress(
                            skill: 'Tailwind',
                            percentage: tailwindSkillPercentage,
                            icon: Icons.layers,
                            iconColor: Colors.greenAccent,
                            aboutMeDescription:
                                'Tailwind CSS is a utility-first CSS framework for rapidly building custom user interfaces.',
                          ),
                        ],
                      },
                      {
                        'title': 'JavaScript & Frameworks',
                        'skills': [
                          SkillProgress(
                            skill: 'JavaScript',
                            percentage: javascriptSkillPercentage,
                            icon: Icons.javascript,
                            iconColor: Colors.yellowAccent,
                            aboutMeDescription:
                                'JavaScript is a programming language that conforms to the ECMAScript specification.',
                          ),
                          SkillProgress(
                            skill: 'React',
                            percentage: reactSkillPercentage,
                            icon: Icons.refresh,
                            iconColor: Colors.blueAccent,
                            aboutMeDescription:
                                'React is a JavaScript library for building user interfaces.',
                          ),
                          SkillProgress(
                            skill: 'Next.js',
                            percentage: nextJsSkillPercentage,
                            icon: Icons.next_plan,
                            iconColor: Colors.tealAccent, // Changed color
                            aboutMeDescription:
                                'Next.js is a React framework that enables functionality such as server-side rendering and generating static websites.',
                          ),
                        ],
                      },
                      {
                        'title': 'Python & Django',
                        'skills': [
                          SkillProgress(
                            skill: 'Python',
                            percentage: pythonSkillPercentage,
                            icon: Icons.code,
                            iconColor: Colors.limeAccent,
                            aboutMeDescription:
                                'Python is an interpreted, high-level and general-purpose programming language.',
                          ),
                          SkillProgress(
                            skill: 'Django',
                            percentage: djangoSkillPercentage,
                            icon: Icons.web,
                            iconColor: Colors.tealAccent,
                            aboutMeDescription:
                                'Django is a high-level Python web framework that encourages rapid development and clean, pragmatic design.',
                          ),
                        ],
                      },
                      {
                        'title': 'Other Languages',
                        'skills': [
                          SkillProgress(
                            skill: 'Matlab',
                            percentage: matlabSkillPercentage,
                            icon: Icons.calculate,
                            iconColor: Colors.redAccent,
                            aboutMeDescription:
                                'MATLAB is a programming platform designed specifically for engineers and scientists.',
                          ),
                          SkillProgress(
                            skill: 'C',
                            percentage: cSkillPercentage,
                            icon: Icons.computer,
                            iconColor: Colors.lightBlueAccent,
                            aboutMeDescription:
                                'C is a general-purpose, procedural computer programming language.',
                          ),
                          SkillProgress(
                            skill: 'C++',
                            percentage: cppSkillPercentage,
                            icon: Icons.computer,
                            iconColor: Colors.greenAccent,
                            aboutMeDescription:
                                'C++ is a general-purpose programming language created as an extension of the C programming language.',
                          ),
                          SkillProgress(
                            skill: 'C#',
                            percentage: csharpSkillPercentage,
                            icon: Icons.computer,
                            iconColor: Colors.purpleAccent,
                            aboutMeDescription:
                                'C# is a modern, object-oriented programming language developed by Microsoft.',
                          ),
                          SkillProgress(
                            skill: 'PHP',
                            percentage: phpSkillPercentage,
                            icon: Icons.web,
                            iconColor: Colors.orangeAccent,
                            aboutMeDescription:
                                'PHP is a popular general-purpose scripting language that is especially suited to web development.',
                          ),
                          SkillProgress(
                            skill: 'Assembly',
                            percentage: assemblySkillPercentage,
                            icon: Icons.memory,
                            iconColor: Colors.grey,
                            aboutMeDescription:
                                'Assembly language is a low-level programming language for a computer or other programmable device.',
                          ),
                        ],
                      },
                      {
                        'title': 'Networking Skills',
                        'skills': [
                          SkillProgress(
                            skill: 'Network+',
                            percentage: networkSkillPercentage,
                            icon: Icons.network_wifi,
                            iconColor: Colors.cyanAccent,
                            aboutMeDescription:
                                'Network+ is a certification that validates the technical skills needed to securely establish, maintain and troubleshoot the essential networks that businesses rely on.',
                          ),
                          SkillProgress(
                            skill: 'Windows Server',
                            percentage: windowsServerSkillPercentage,
                            icon: Icons.desktop_windows,
                            iconColor: Colors.greenAccent,
                            aboutMeDescription:
                                'Windows Server is a group of operating systems designed by Microsoft that supports enterprise-level management, data storage, applications, and communications.',
                          ),
                        ],
                      },
                      {
                        'title': 'Virtualization & Routers',
                        'skills': [
                          SkillProgress(
                            skill: 'Virtual Machine',
                            percentage: virtualMachineSkillPercentage,
                            icon: Icons.cloud,
                            iconColor: Colors.pinkAccent,
                            aboutMeDescription:
                                'A virtual machine is an emulation of a computer system.',
                          ),
                          SkillProgress(
                            skill: 'Mikrotik',
                            percentage: mikrotikSkillPercentage,
                            icon: Icons.router,
                            iconColor: Colors.orangeAccent,
                            aboutMeDescription:
                                'MikroTik is a Latvian company that develops routers and wireless ISP systems.',
                          ),
                        ],
                      },
                      {
                        'title': 'Miscellaneous Skills & Applications',
                        'skills': [
                          SkillProgress(
                            skill: 'Digital Marketing',
                            percentage: 0.6,
                            icon: Icons.mark_email_read,
                            iconColor: Colors.redAccent,
                            aboutMeDescription:
                                'Digital marketing is the component of marketing that utilizes internet and online based digital technologies.',
                          ),
                          SkillProgress(
                            skill: 'ICDL',
                            percentage: 0.9,
                            icon: Icons.book,
                            iconColor: Colors.lightBlueAccent,
                            aboutMeDescription:
                                'The International Computer Driving Licence (ICDL) is a computer literacy certification program.',
                          ),
                        ],
                      },
                      {
                        'title': 'Web & Version Control',
                        'skills': [
                          SkillProgress(
                            skill: 'WordPress',
                            percentage: 0.85,
                            icon: Icons.web,
                            iconColor: Colors.greenAccent,
                            aboutMeDescription:
                                'WordPress is a free and open-source content management system (CMS) written in PHP and paired with a MySQL or MariaDB database.',
                          ),
                          SkillProgress(
                            skill: 'Git, GitHub',
                            percentage: 0.88,
                            icon: Icons.code,
                            iconColor: Colors.purpleAccent, // Changed color
                            aboutMeDescription:
                                'Git is a distributed version-control system for tracking changes in source code during software development. GitHub is a provider of Internet hosting for software development and version control using Git.',
                          ),
                        ],
                      },
                      {
                        'title': 'Operating Systems',
                        'skills': [
                          SkillProgress(
                            skill: 'Windows',
                            percentage: 0.95,
                            icon: Icons.desktop_windows,
                            iconColor: Colors.cyanAccent,
                            aboutMeDescription:
                                'Windows is a group of several proprietary graphical operating system families, all of which are developed and marketed by Microsoft.',
                          ),
                          SkillProgress(
                            skill: 'Linux',
                            percentage: 0.85,
                            icon: Icons.laptop,
                            iconColor: Colors.orangeAccent,
                            aboutMeDescription:
                                'Linux is a family of open-source Unix-like operating systems based on the Linux kernel.',
                          ),
                        ],
                      },
                    ],
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

class ProfileSection extends StatefulWidget {
  final String name;
  final String title;
  final String email;
  final String phone;
  final String telegram;
  final String linkedIn;

  const ProfileSection({
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.telegram,
    required this.linkedIn,
    Key? key,
  }) : super(key: key);

  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  bool _isHoveredEmail = false;
  bool _isHoveredPhone = false;
  bool _isHoveredTelegram = false;
  bool _isHoveredLinkedIn = false;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
        SizedBox(height: 16),
        Text(
          widget.name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          widget.title,
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Me:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHoveredEmail = true),
                    onExit: (_) => setState(() => _isHoveredEmail = false),
                    child: Icon(
                      Icons.email,
                      color: _isHoveredEmail ? Colors.red : Colors.white70,
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: GestureDetector(
                      onTap: () => _launchUrl('mailto:${widget.email}'),
                      child: Text(
                        widget.email,
                        style: TextStyle(
                          color: _isHoveredEmail ? Colors.red : Colors.white70,
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
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHoveredPhone = true),
                    onExit: (_) => setState(() => _isHoveredPhone = false),
                    child: Icon(
                      Icons.phone,
                      color: _isHoveredPhone ? Colors.green : Colors.white70,
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: GestureDetector(
                      onTap: () => _launchUrl('tel:${widget.phone}'),
                      child: Text(
                        widget.phone,
                        style: TextStyle(
                          color:
                              _isHoveredPhone ? Colors.green : Colors.white70,
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
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHoveredTelegram = true),
                    onExit: (_) => setState(() => _isHoveredTelegram = false),
                    child: Icon(
                      Icons.telegram,
                      color: _isHoveredTelegram ? Colors.blue : Colors.white70,
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: GestureDetector(
                      onTap:
                          () => _launchUrl('https://t.me/${widget.telegram}'),
                      child: Text(
                        widget.telegram,
                        style: TextStyle(
                          color:
                              _isHoveredTelegram ? Colors.blue : Colors.white70,
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
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHoveredLinkedIn = true),
                    onExit: (_) => setState(() => _isHoveredLinkedIn = false),
                    child: Icon(
                      Icons.link,
                      color:
                          _isHoveredLinkedIn
                              ? Colors.blueAccent
                              : Colors.white70,
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: GestureDetector(
                      onTap: () => _launchUrl('https://${widget.linkedIn}'),
                      child: Text(
                        widget.linkedIn,
                        style: TextStyle(
                          color:
                              _isHoveredLinkedIn
                                  ? Colors.blueAccent
                                  : Colors.white70,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
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

// Added spacing between skills in SkillGroup widget
class SkillGroup extends StatelessWidget {
  final String title;
  final List<SkillProgress> skills;

  const SkillGroup({required this.title, required this.skills, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          ...skills.asMap().entries.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: AnimatedSkillBox(
                child: entry.value,
                fromLeft: entry.key % 2 == 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Updated to show descriptions about me instead of the language
class SkillProgress extends StatefulWidget {
  final String skill;
  final double percentage;
  final IconData icon;
  final Color iconColor;
  final String aboutMeDescription; // Updated field for personal description

  const SkillProgress({
    required this.skill,
    required this.percentage,
    required this.icon,
    required this.iconColor,
    required this.aboutMeDescription, // Initialize personal description
    Key? key,
  }) : super(key: key);

  @override
  _SkillProgressState createState() => _SkillProgressState();
}

class _SkillProgressState extends State<SkillProgress>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );

  late final Animation<double> _animation = Tween<double>(
    begin: 0,
    end: widget.percentage,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

  late final AnimationController _hoverController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final Animation<double> _hoverAnimation = CurvedAnimation(
    parent: _hoverController,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.skill),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.1) {
          _controller.forward();
        }
      },
      child: GestureDetector(
        onTap: () {
          // Show personal description on tap
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text(widget.skill),
                  content: Text(widget.aboutMeDescription),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Close'),
                    ),
                  ],
                ),
          );
        },
        child: MouseRegion(
          onEnter:
              (_) => setState(() {
                _hoverController.forward();
              }),
          onExit:
              (_) => setState(() {
                _hoverController.reverse();
              }),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(widget.icon, color: widget.iconColor),
                  const SizedBox(width: 8),
                  Text(
                    widget.skill,
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              SizeTransition(
                sizeFactor: _hoverAnimation,
                axisAlignment: -1.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    widget.aboutMeDescription,
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    value: _animation.value,
                    color: widget.iconColor,
                    backgroundColor: Colors.grey[700],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedSkillBox extends StatefulWidget {
  final Widget child;
  final bool fromLeft;

  const AnimatedSkillBox({
    required this.child,
    required this.fromLeft,
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedSkillBoxState createState() => _AnimatedSkillBoxState();
}

class _AnimatedSkillBoxState extends State<AnimatedSkillBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1300,
      ), // Increased duration for slower animation
    );
    _animation = Tween<Offset>(
      begin: widget.fromLeft ? Offset(-1, 0) : Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.child.hashCode.toString()),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.1) {
          _controller.forward();
        }
      },
      child: SlideTransition(position: _animation, child: widget.child),
    );
  }
}
