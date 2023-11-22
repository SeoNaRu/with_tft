import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('WITH TFT'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: SizedBox(
                width: 48,
                height: 48,
                child: Image.network(
                  'https://ddragon.leagueoflegends.com/cdn/13.23.1/img/profileicon/4568.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: double.infinity,
                        minHeight: MediaQuery.of(context).size.height / 8,
                        maxHeight: MediaQuery.of(context).size.height / 3,
                      ),
                    );
                  },
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: double.infinity,
                        minHeight: MediaQuery.of(context).size.height / 8,
                        maxHeight: MediaQuery.of(context).size.height / 3,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
