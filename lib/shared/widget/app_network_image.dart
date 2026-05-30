import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:memory_map/shared/constants/theme/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.errorWidget,
    super.key,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, Object)? errorWidget;

  @override
  Widget build(BuildContext context) {
    if (Skeletonizer.maybeOf(context)?.enabled ?? false) {
      return SizedBox(
        width: width,
        height: height,
        child: const ColoredBox(
          color: AppColors.slate700,
        ),
      );
    }

    final uri = Uri.tryParse(imageUrl);
    final hasHost = uri != null && uri.hasAuthority && uri.host.isNotEmpty;

    if (imageUrl.isEmpty || !hasHost) {
      return SizedBox(
        width: width,
        height: height,
        child: errorWidget?.call(context, imageUrl, 'Invalid URL') ??
            _buildDefaultFallback(),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: placeholder,
      errorWidget: errorWidget != null
          ? (context, url, error) => SizedBox(
                width: width,
                height: height,
                child: errorWidget!(context, url, error),
              )
          : (context, url, error) => _buildDefaultFallback(),
    );
  }

  Widget _buildDefaultFallback() {
    return SizedBox(
      width: width,
      height: height,
      child: const ColoredBox(
        color: AppColors.slate700,
        child: Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            color: Colors.white24,
          ),
        ),
      ),
    );
  }
}
