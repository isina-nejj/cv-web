import 'package:flutter/material.dart';
import 'skills_widget.dart';

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
