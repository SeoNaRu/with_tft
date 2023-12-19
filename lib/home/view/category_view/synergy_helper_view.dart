import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_state.dart';
import 'package:with_tft/home/widget/get_most_frequent_color.dart';

class SynergyHelperView extends StatefulWidget {
  const SynergyHelperView({super.key});

  @override
  State<SynergyHelperView> createState() => _SynergyHelperViewState();
}

class _SynergyHelperViewState extends State<SynergyHelperView> {
  Future<Color> getImagePalette(String imagePath) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      AssetImage(imagePath),
    );
    return paletteGenerator.dominantColor?.color ?? Colors.black;
  }

  Map<String, Color> colorCache = {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Expanded(
        child: ListView.builder(
          // scrollDirection: Axis.vertical,
          itemCount: state.champion.length,
          itemBuilder: (context, index) {
            final imagePath =
                'assets/tft_champions/${state.champion[index].id}.png';
            return FutureBuilder<Color>(
              future: colorCache.containsKey(imagePath)
                  ? Future.value(colorCache[imagePath])
                  : getImagePalette(imagePath).then((color) {
                      colorCache[imagePath] = color;
                      return color;
                    }),
              builder: (context, snapshot) {
                Color chamColor = snapshot.data ?? Colors.transparent;
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 3),
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: chamColor.withOpacity(0.8),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(imagePath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(state.champion[index].name)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      );
    });
  }
}
