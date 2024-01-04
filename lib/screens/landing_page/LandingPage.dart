import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../states/glass_container/notifier.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<LandingPage> createState() => _LandingPageState();

  // @override
  // ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  Artboard? riveArtboard;
  SMIBool? isDance;
  SMITrigger? isLookUp;
  SMINumber? glassFillVal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rootBundle.load('assets/glass.riv').then((ByteData data) async {
      try {
        final RiveFile file = RiveFile.import(data);
        final Artboard artBoard = file.mainArtboard;
        final StateMachineController? controller =
            StateMachineController.fromArtboard(artBoard, 'default');
        if (controller != null) {
          artBoard.addController(controller);
          glassFillVal = controller.findSMI('input');
          glassFillVal!.value = ref.watch(glassContainerProivder).filledValue;
        }
        setState(() => riveArtboard = artBoard);
      } catch (e) {
        print(e);
      }
    });
  }

  void toggleDance(bool newValue) {
    setState(() => isDance!.value = newValue);
  }

  @override
  Widget build(BuildContext context) {
    // final int navIndex = ref.watch(navProvider).index;

    // final int xx = ref.watch(glassContainerProivder).filledValue;

    return Container(
      child: riveArtboard == null
          ? const SizedBox()
          : Column(
              children: <Widget>[
                const Spacer(),
                Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Rive(artboard: riveArtboard!)),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Spacer(),
                    ElevatedButton(
                      child: const Text('-'),
                      onPressed: () {
                        if (glassFillVal!.value <= 0) {
                          return;
                        }
                        glassFillVal!.value -= 10;
                        ref
                            .read(glassContainerProivder.notifier)
                            .decrementFilledValue();
                      },
                    ),
                    const Spacer(),
                    Text(ref
                        .watch(glassContainerProivder)
                        .filledValue
                        .toString()),
                    const Spacer(),
                    ElevatedButton(
                      child: const Text('+'),
                      onPressed: () {
                        if (glassFillVal!.value >= 100) {
                          return;
                        }
                        glassFillVal!.value += 10;
                        ref
                            .read(glassContainerProivder.notifier)
                            .incrementFilledValue();
                      },
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
              ],
            ),
    );
  }
}
