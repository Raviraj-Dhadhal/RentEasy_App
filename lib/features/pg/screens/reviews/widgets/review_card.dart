import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({
    super.key,
    required this.name,
    required this.timeAgo,
    required this.comment,
    this.rating = 5,
    this.helpfulCount = 0,
    this.attachedImage,
    this.avatarImage,
  });

  final String name;
  final String timeAgo;
  final String comment;
  final int rating;
  final int helpfulCount;
  final String? attachedImage;
  final String? avatarImage;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  late int likes;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likes = widget.helpfulCount;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Avatar, Name & Stars
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: const Color(0xFFEDEAFD),
                child: Text(
                  widget.name.isNotEmpty ? widget.name[0] : 'U',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.button,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    Text(
                      widget.timeAgo,
                      style: const TextStyle(
                        fontSize: 10.0,
                        color: AppColors.secondaryTextColor,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: List.generate(
                  widget.rating,
                  (index) => const Icon(Icons.star, color: Color(0xFFF59E0B), size: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),

          // Comment
          Text(
            widget.comment,
            style: const TextStyle(
              fontSize: 12.0,
              height: 1.4,
              color: AppColors.primaryTextColor,
              fontFamily: 'poppins',
            ),
          ),

          // Optional Attached Photo
          if (widget.attachedImage != null) ...[
            const SizedBox(height: 10.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                widget.attachedImage!,
                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
            ),
          ],
          const SizedBox(height: 10.0),

          // Footer: Helpful count & 3-dots
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLiked = !isLiked;
                    likes += isLiked ? 1 : -1;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                      size: 14,
                      color: isLiked ? AppColors.button : AppColors.secondaryTextColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Helpful ($likes)',
                      style: TextStyle(
                        fontSize: 11.0,
                        fontFamily: 'poppins',
                        fontWeight: isLiked ? FontWeight.bold : FontWeight.normal,
                        color: isLiked ? AppColors.button : AppColors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, size: 16, color: AppColors.secondaryTextColor),
                onPressed: () {},
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
