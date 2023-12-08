import 'package:flutter/material.dart';

class SynergyHelperView extends StatefulWidget {
  const SynergyHelperView({super.key});

  @override
  State<SynergyHelperView> createState() => _SynergyHelperViewState();
}

class _SynergyHelperViewState extends State<SynergyHelperView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(),
                          Container(),
                          Container(),
                        ],
                      ),
                    ],
                  ));
            },
          ),
        )
      ],
    );
  }
}
