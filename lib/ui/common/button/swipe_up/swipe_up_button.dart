import 'package:flutter/material.dart';
import 'package:menu_app/ui/common/button/swipe_up/controllers/swipe_up_controller.dart';
import 'package:menu_app/ui/common/button/swipe_up/swipe_up_view.dart';

class SwipeUpButton extends StatefulWidget {
  final List<Widget> options;

  const SwipeUpButton({
    super.key,
    required this.options,
  });

  @override
  State<SwipeUpButton> createState() => _SwipeUpButtonState();
}

class _SwipeUpButtonState extends State<SwipeUpButton>
    with TickerProviderStateMixin {
  final GlobalKey _key = GlobalKey();

  SwipeUpViewController? _viewController;
  OverlayEntry? _overlay;

  void _addOverlay() {
    if (_overlay != null) return;
    _overlay = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: SwipeUpView(
          options: widget.options,
          onController: (ctrl) => _viewController = ctrl,
          dispose: () => _removeOverlay(),
        ),
      ),
    );
    Overlay.maybeOf(context)?.insert(_overlay!);
  }

  void _removeOverlay() {
    if (_overlay == null) return;
   setState(() {
     _overlay?.remove();
     _overlay = null;
     _viewController = null;
   });
  }

  Widget _buttonView() {
    if (_overlay != null) {
      return const SizedBox.shrink();
    }

    return Container(
      key: _key,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: _overlay != null
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.tertiary,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.add,
        size: 32,
        color: _overlay != null
            ? Theme.of(context).colorScheme.tertiary
            : Theme.of(context).colorScheme.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (details) {
        _addOverlay();
      },
      onVerticalDragUpdate: (details) {
        _viewController?.dragUpdate(details);
      },
      onVerticalDragEnd: (details) {
        _viewController?.dragEnd(details);
      },
      child: _buttonView(),
    );
  }
}
