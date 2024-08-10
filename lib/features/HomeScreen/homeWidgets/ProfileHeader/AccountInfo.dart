import "package:flutter/material.dart";
import "package:iconsax/iconsax.dart";

class AccountInfo extends StatelessWidget {
  const AccountInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: const Color(0XFFF5F5F5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // ranking level
          Row(
            children: [
              // icon
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: const Color(0XFF75D4F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Iconsax.medal_star5,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              // text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rising Star',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'Level 2',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: const Color(0XFF75D4F6)),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              // icon
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: const Color(0XFFF97891),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Iconsax.book_1,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              // text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Learning',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'Score 80%',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: const Color(0XFFF97891)),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
