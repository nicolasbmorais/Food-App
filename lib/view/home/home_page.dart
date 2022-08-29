import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/data.dart';
import 'package:food_app/view/home/section_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Column(
              children: [
                Text(
                  'Entregar para'.toUpperCase(),
                  style: Theme.of(context).textTheme.caption!.copyWith(color: AppColors.kActiveColor),
                ),
                Text('São Paulo'.toUpperCase(), style: const TextStyle(color: Colors.black)),
              ],
            ),
            actions: const [
              TextButton(
                onPressed: null,
                child: Text(
                  'Filtro',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: ImageCarrousel(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: SectionTitle(
                onPressed: () {},
                title: 'Parceiros em Destaque',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  demoMediumCardData.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: RestaurantInfoCard(
                      title: demoMediumCardData[index]['name'],
                      image: demoMediumCardData[index]['image'],
                      location: demoMediumCardData[index]['location'],
                      rating: demoMediumCardData[index]['rating'],
                      deliveryFee: demoMediumCardData[index]['deliveryFee'],
                      deliveryTime: demoMediumCardData[index]['deliveryTime'],
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Image.asset(AppImages.bannerImage),
            ),
          )
        ],
      ),
    );
  }
}

class RestaurantInfoCard extends StatelessWidget {
  const RestaurantInfoCard({
    Key? key,
    required this.title,
    required this.image,
    required this.location,
    required this.rating,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String image;
  final String location;
  final double rating;
  final int deliveryTime;
  final String deliveryFee;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.25,
              child: Image.asset(image),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              location,
              style: const TextStyle(color: AppColors.kBodyTextColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: DefaultTextStyle(
                style: const TextStyle(color: Colors.black, fontSize: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: const BoxDecoration(
                        color: AppColors.kActiveColor,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Text(rating.toString(), style: const TextStyle(color: Colors.white)),
                    ),
                    Text('$deliveryTime min'),
                    const CircleAvatar(radius: 2, backgroundColor: AppColors.kBodyTextColor),
                    Text(deliveryFee)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
