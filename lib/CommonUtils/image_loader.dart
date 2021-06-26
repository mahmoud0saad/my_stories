import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'image_utils.dart';

class ImageLoader {
  static CachedNetworkImage loadDefault(String url, {BoxFit fit: BoxFit.fitHeight,
    double height:double.infinity,double width:double.infinity}) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
     placeholder: (context, url) => Image.asset(
       ImageUtils.getImagePath("ic_logo"),
       fit:BoxFit.fitHeight,
     ),
     errorWidget: (context, url, error) => Image.asset(
       ImageUtils.getImagePath("ic_logo"),
       fit:BoxFit.fitHeight,
     ),
    );
  }

  static CachedNetworkImage loadQuran(String url, {BoxFit fit: BoxFit.fill,
    double height:double.infinity,double width:double.infinity}) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,

      placeholder: (context, url) => Image.asset(
        'assets/images/loading.gif',
        fit:BoxFit.scaleDown,
      ),
      errorWidget: (context, url, error) => Image.asset(
        ImageUtils.getImagePath("ic_logo"),
        fit:BoxFit.none,
      ),
    );
  }


  static CachedNetworkImage loadNoPlaceHolder(String url, {BoxFit fit: BoxFit.fill,
    double height:double.infinity,double width:double.infinity}) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
    );
  }
}
