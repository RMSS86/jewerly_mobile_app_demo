import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Route _animatedRoute(BuildContext context, Widget _child)
{
    return PageRouteBuilder(
        pageBuilder: (context, animation, secundaryAnimation) => _child,
        transitionsBuilder: (context, animation, secundaryAnimation, _child)
        {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(position: animation.drive(tween),
                child: _child

            );

        }
    );
}
