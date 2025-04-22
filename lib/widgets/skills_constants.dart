import 'package:flutter/material.dart';
import './skills_widget.dart';
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

// Moved the selected skills section to this file
const List<Map<String, dynamic>> skills = [
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
];
