import 'package:Psynexa/components/custom_bottom_nav_bar.dart';
import 'package:Psynexa/components/exit_alert.dart';
import 'package:Psynexa/riverpod/base_scaffold_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final baseScaffoldRiverpod =
    ChangeNotifierProvider((ref) => BaseScaffoldRiverpod());

class BaseScaffold extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  Future<bool> _onWillPop() async {
    return await onWillPop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(),
        body: ref.watch(baseScaffoldRiverpod).body(),
      ),
    );
  }
}
