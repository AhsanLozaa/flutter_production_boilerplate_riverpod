import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'glass_container/notifier.dart';

void resetProviders(WidgetRef ref) {
  ref.invalidate(glassContainerProivder);
}
