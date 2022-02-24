import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_puzzle_hack/models/dash.dart';
import 'package:flutter_puzzle_hack/presentation/common/animations/utils/animations_manager.dart';
import 'package:flutter_puzzle_hack/presentation/layout/phrase_bubble_layout.dart';
import 'package:flutter_puzzle_hack/presentation/providers/phrases_provider.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class DashRiveAnimation extends StatefulWidget {
  const DashRiveAnimation({Key? key}) : super(key: key);

  @override
  _DashRiveAnimationState createState() => _DashRiveAnimationState();
}

class _DashRiveAnimationState extends State<DashRiveAnimation> {
  late final PhrasesProvider phrasesProvider;

  final ValueNotifier<bool> _canTapDashNotifier = ValueNotifier<bool>(true);

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'dashtronaut');

    artboard.addController(controller!);
  }

  @override
  void initState() {
    phrasesProvider = Provider.of<PhrasesProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Dash _dash = Dash(context);

    return Positioned(
      right: _dash.position.right,
      bottom: _dash.position.bottom,
      child: ValueListenableBuilder(
        valueListenable: _canTapDashNotifier,
        child: SizedBox(
          width: _dash.size.width,
          height: _dash.size.height,
          child: RiveAnimation.asset(
            'assets/rive/dashtronaut.riv',
            onInit: _onRiveInit,
            stateMachines: const ['dashtronaut'],
          ),
        ),
        builder: (c, bool _canTapDash, child) => GestureDetector(
          onTap: () {
            if (_canTapDash) {
              _canTapDashNotifier.value = false;
              phrasesProvider.setPhraseState(PhraseState.dashTapped);
              HapticFeedback.lightImpact();
              Future.delayed(AnimationsManager.phraseBubbleTotalAnimationDuration, () {
                phrasesProvider.setPhraseState(PhraseState.none);
                _canTapDashNotifier.value = true;
              });
            }
          },
          child: child,
        ),
      ),
    );
  }
}
