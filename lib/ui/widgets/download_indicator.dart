import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

enum Indicator { web, list, image, nextPage }

class DownloadIndicator extends StatelessWidget {
  const DownloadIndicator({super.key, required this.style});

  final Indicator style;

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case Indicator.list:
        return Shimmer.fromColors(

            baseColor: Colors.grey.shade400,
            highlightColor: Colors.grey.shade100,
            enabled: true,
            child: SingleChildScrollView(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const Card(
                    elevation: 1.0,
                    child: SizedBox(height: 100),
                  );
                },
              ),
            ));
      case Indicator.web:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade400,
          highlightColor: Colors.grey.shade100,
          child: const Card(
              elevation: 1.0,
              child: SizedBox(height: double.infinity, width: double.infinity)),
        );
      case Indicator.image:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: const Card(elevation: 1.0, child: SizedBox(height: 30, width: 60)),
        );
      case Indicator.nextPage:
        return const CircularProgressIndicator();
      default:
        return const CircularProgressIndicator();
    }

    //));
  }
}
