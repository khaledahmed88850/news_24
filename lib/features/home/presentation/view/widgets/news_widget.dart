import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_24/core/utils/assets.dart';
import 'package:news_24/core/utils/text_styles.dart';
import 'package:news_24/features/home/data/model/news_model/news_model.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            await launchUrl(Uri.parse(newsModel.url!));
          },
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl:
                          newsModel.urlToImage ??
                          'https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg',
                      errorWidget:
                          (context, url, error) =>
                              Image.asset(Assets.assetsImagesPlaceholder),
                      placeholder:
                          (context, url) => Skeletonizer(
                            child: Image.asset(Assets.assetsImagesTest),
                          ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth:
                      MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width * 0.4) -
                      32 -
                      10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsModel.title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: Styles.bold14,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      newsModel.author ?? '',
                      style: Styles.medium13.copyWith(
                        color: const Color(0xFF909090),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      newsModel.source!.name ?? '',
                      style: Styles.bold13.copyWith(
                        color: const Color(0xff69BDFD),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Divider(color: Color(0xFFEEEEEE), thickness: 2),
      ],
    );
  }
}
