import 'dart:ui';
import 'package:flutter/material.dart';

class GlassmorphicContainer extends StatefulWidget {
  final Widget child;
  final double? height;
  final double? width;

  const GlassmorphicContainer({Key? key, required this.child, this.height, this.width})
      : super(key: key);

  @override
  State<GlassmorphicContainer> createState() => _GlassmorphicContainerState();
}

class _GlassmorphicContainerState extends State<GlassmorphicContainer> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.4),
                  Colors.white.withOpacity(0.2),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10),),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.child,
              ),
            ),
          ),
        ),
      )],
    );
  }
}
