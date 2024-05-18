import 'package:e_store/widgets/shimmer_placeholder_widget.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;

  const ImageLoader({
    required this.imagePath,
    required this.width,
    required this.height,
    super.key,
  });

  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  bool _isImageLoaded = false;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (!_isDisposed) {
        setState(() {
          _isImageLoaded = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: _isImageLoaded
            ? Image.network(
                widget.imagePath,
                width: widget.width,
                height: widget.height,
                fit: BoxFit.cover,
              )
            : ShimmerPlaceholder(
                width: widget.width,
                height: widget.height,
              ),
      ),
    );
  }
}
