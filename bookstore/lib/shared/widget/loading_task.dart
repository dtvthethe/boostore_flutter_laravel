import 'package:bookstore/base/base_bloc.dart';
import 'package:bookstore/shared/widget/scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

// Loading popup.
class LoadingTask extends StatelessWidget {
  final BaseBloc bloc;
  final Widget child;

  LoadingTask({required this.bloc, required this.child});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<bool>.value(
      value: bloc.loadingStream,
      initialData: false,
      child: Stack(
        children: [
          child,
          Consumer<bool>(
            builder: (context, value, child) => Center(
              child: value
                  ? ScaleAnimation(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: const SpinKitPouringHourGlass(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
