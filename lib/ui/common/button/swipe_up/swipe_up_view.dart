import 'package:flutter/material.dart';
import 'package:menu_app/extentions/animation_controller_ext.dart';
import 'package:menu_app/extentions/global_key_ext.dart';
import 'package:menu_app/ui/common/button/swipe_up/controllers/swipe_up_controller.dart';
import 'package:menu_app/ui/common/button/swipe_up/painter/custom_painter.dart';

class SwipeUpView extends StatefulWidget {
  final List<Widget> options;
  final void Function(SwipeUpViewController) onController;
  final void Function() dispose;

  const SwipeUpView({
    super.key,
    required this.options,
    required this.onController,
    required this.dispose,
  });

  @override
  State<SwipeUpView> createState() => _SwipeUpViewState();
}

class _SwipeUpViewState extends State<SwipeUpView>
    with TickerProviderStateMixin
    implements SwipeUpViewController {
  final GlobalKey _key = GlobalKey();

  AnimationController? _buttonController;
  AnimationController? _colorController;

  @override
  void initState() {
    widget.onController(this);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _buttonController = AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
        lowerBound: _key.dy,
        upperBound: MediaQuery.of(context).size.height,
      );

      _colorController = AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
        lowerBound: _key.dy,
        upperBound: MediaQuery.of(context).size.height,
      );

      _buttonController?.addListener(_buttonControllerUpdate);
      _buttonController?.addStatusListener(_buttonControllerStatusUpdate);
      _colorController?.addListener(_colorControllerUpdate);
    });
  }

  @override
  void dispose() {
    _buttonController?.removeListener(_buttonControllerUpdate);
    _buttonController?.removeStatusListener(_buttonControllerStatusUpdate);
    _colorController?.removeListener(_colorControllerUpdate);
    _buttonController?.dispose();
    _colorController?.dispose();
    super.dispose();
  }

  @override
  void dragUpdate(DragUpdateDetails details) {
    if (!mounted) return;
    final double dy = details.globalPosition.dy;
    _buttonController?.value = dy;
    _colorController?.value = dy;
  }

  @override
  void dragEnd(DragEndDetails details) {
    if (!mounted) return;
    _buttonController?.reverse();
    _colorController?.reverse();
  }

  void _buttonControllerUpdate() {
    setState(() {});
  }

  void _buttonControllerStatusUpdate(
    AnimationStatus status,
  ) {
    switch (status) {
      case AnimationStatus.completed:
        widget.dispose();
        break;
      case AnimationStatus.dismissed:
       _colorController?.forward();
      case AnimationStatus.forward:
      case AnimationStatus.reverse:
        break;
    }
  }

  void _colorControllerUpdate() {
    setState(() {});
  }

  Widget _closeButtonView() {
    return GestureDetector(
      onTap: () {
        _buttonController?.forward();
        _colorController?.forward();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.close,
          size: 32,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buttonView() {
    if (_buttonController?.isDismissed == true) {
      return _closeButtonView();
    }

    final double value = (_buttonController?.value ?? 0) - _key.dy;

    return SizedBox(
      key: _key,
      width: 50,
      height: 50,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            width: 50,
            height: 50,
            bottom: -value,
            child: _closeButtonView(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double opacity = _buttonController?.convertToZeroOne() ?? 0;
    return Scaffold(
      body: CustomPaint(
        painter: CurvedPainter(
          opacity: 1 - opacity,
          yValue: _colorController?.value ?? 0,
          color: Theme.of(context).colorScheme.primary,
          inReverse: _colorController?.status == AnimationStatus.reverse,
        ),
        child: SizedBox.expand(
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buttonView(),
                  const SizedBox(height: 50),
                  Opacity(
                    opacity: _colorController?.isCompleted == true ? 1 : 0,
                    child: Column(
                      children: widget.options,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
