import 'package:flutter/material.dart';

class CategoriesListMallika1 extends StatelessWidget {
  const CategoriesListMallika1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryCardMallika1(
            title: "Cake",
            image:
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-1.png?alt=media&token=245741de-7966-4f5b-805f-6dd8e5dbea80",
            onTap: () {},
          ),
          CategoryCardMallika1(
            title: "Pasta",
            image:
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-2.png?alt=media&token=3ae6f4e6-53cd-4ac1-9e12-b491c351771a",
            onTap: () {},
          ),
          CategoryCardMallika1(
            title: "Drinks",
            image:
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-3.png?alt=media&token=43ed89ab-93de-42ca-90df-0231699eebf0",
            onTap: () {},
          ),
          CategoryCardMallika1(
            title: "Rice",
            image:
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-4.png?alt=media&token=0c2592ca-7bbc-40fa-80ae-163d739e308f",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class CategoryCardMallika1 extends StatefulWidget {
  final String title;
  final String image;
  final Function() onTap;
  final bool selected;

  const CategoryCardMallika1({
    required this.title,
    required this.image,
    required this.onTap,
    this.selected = false,
    Key? key,
  }) : super(key: key);

  @override
  _CategoryCardMallika1State createState() => _CategoryCardMallika1State();
}

class _CategoryCardMallika1State extends State<CategoryCardMallika1> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
          widget.onTap();
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: _isSelected ? 2 : 0,
                  color: const Color(0xffFF8527),
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ClipRRect(
                child: Image.network(
                  widget.image,
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 12.5,
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                color: _isSelected ? const Color(0xffFF8527) : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
