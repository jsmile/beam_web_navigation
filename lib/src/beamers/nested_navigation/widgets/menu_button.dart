import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({
    Key? key,
    required this.beamer,
    required this.uri,
    required this.child,
  }) : super(key: key);

  final GlobalKey<BeamerState> beamer;
  final String uri;
  final Widget child;

  @override
  createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => widget
        .beamer.currentState?.routerDelegate
        .addListener(_setStateListener));
  }

  @override
  Widget build(BuildContext context) {
    // 버튼에 대한 현재 경로
    final path = (context.currentBeamLocation.state as BeamState).uri.path;

    return ElevatedButton(
      onPressed: () =>
          widget.beamer.currentState?.routerDelegate.beamToNamed(widget.uri),
      style: ButtonStyle(
        // 버튼이 경로에 포함되면 색상 변경( 선택된 버튼 색상 변경 )
        backgroundColor: path.contains(widget.uri)
            ? MaterialStateProperty.all<Color>(Colors.green)
            : MaterialStateProperty.all<Color>(Colors.blue),
      ),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    widget.beamer.currentState?.routerDelegate
        .removeListener(_setStateListener);
    super.dispose();
  }
}
