import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:books_app/widgets/image_frame.dart';
import 'package:books_app/widgets/empty_holder.dart';
import 'package:books_app/common/utils.dart';

class BannerFrame extends StatelessWidget{

  final dynamic bannerModule;
  static const double radius = 3.0;
  SwiperController controller = new SwiperController();

  BannerFrame(this.bannerModule);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: new Swiper(
        onTap: (int index) {
          toast('你点击了第${index+1}个图片，但是它尚待开发 /(ㄒoㄒ)/~~');
        },
        itemBuilder: (BuildContext context, int index) {
          if (bannerModule != null) {
            return Padding(
              padding: EdgeInsets.only(right: 5,left: 5),
              child: ImageFrame(url: bannerModule.items[index].imgUrl, radius: radius),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(right: 5,left: 5),
              child: EmptyHolder(-1, -1, 3)
            );
          }
        },
        itemCount: bannerModule==null ? 3 : bannerModule.items.length,
        viewportFraction: .9,
        controller: controller
      ),
    );
  }
}