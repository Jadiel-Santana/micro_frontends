import 'package:flutter/material.dart';

import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:shared/shared.dart';

import '../../domain/entities/entities.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.neutral7,
          border: Border.all(
            color: AppColors.neutral5,
          ),
        ),
        child: Material(
          color: AppColors.transparent,
          child: InkWell(
            splashColor: AppColors.neutral5,
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      imageBuilder: (_, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      placeholder: (_, __) => const CustomLoading(),
                      errorWidget: (_, __, ___) => const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title.capitalize(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextTheme.subtitle1.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          product.category.capitalize(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextTheme.paragraph1.copyWith(
                            fontSize: 14,
                            color: AppColors.neutral3,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: product.rating,
                                  itemBuilder: (_, __) => const Icon(
                                    Icons.star,
                                    color: AppColors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 14,
                                  direction: Axis.horizontal,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '(${product.count})',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextTheme.paragraph1.copyWith(
                                    fontSize: 12,
                                    color: AppColors.neutral3,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              product.price.toCurrency(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextTheme.paragraph1.copyWith(
                                fontSize: 16,
                                color: AppColors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
