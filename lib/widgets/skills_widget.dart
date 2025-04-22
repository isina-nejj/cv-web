import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'skill_group.dart';

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

class SkillProgress extends StatefulWidget {
  final String skill;
  final double percentage;
  final IconData icon;
  final Color iconColor;
  final String aboutMeDescription;

  const SkillProgress({
    required this.skill,
    required this.percentage,
    required this.icon,
    required this.iconColor,
    required this.aboutMeDescription,
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
      duration: const Duration(milliseconds: 1300),
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
