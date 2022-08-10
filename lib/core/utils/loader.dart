import 'package:flutter/material.dart';

// !! Loader
class Loader extends StatefulWidget {
  Loader({Key? key}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600))
          ..repeat(reverse: true);
    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: FadeTransition(
          opacity: _animation,
          child: SizedBox(height: 35, child: Image.asset('assets/loading.png')),
        ),
      ),
    );
  }
}
