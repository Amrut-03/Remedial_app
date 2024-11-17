import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class shimmer_resuable extends StatelessWidget {
  const shimmer_resuable({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: Shimmer.fromColors(
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        highlightColor: Colors.grey.shade100,
        baseColor: Colors.grey.shade500,
      ),
    );
  }
}
