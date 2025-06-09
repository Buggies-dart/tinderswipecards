import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_tinder_swipe_cards/pages/profile_card.dart';


class TinderSwipeScreen extends StatefulWidget {
  const TinderSwipeScreen({super.key});

  @override
  State<TinderSwipeScreen> createState() => _TinderSwipeScreenState();
}

class _TinderSwipeScreenState extends State<TinderSwipeScreen> {
  final CardSwiperController controller = CardSwiperController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
return Scaffold(
body: SafeArea(
child: Column(mainAxisAlignment: MainAxisAlignment.center,
children: [
SizedBox( height: 500, width: 350,
child: CardSwiper( controller: controller, cardsCount: profiles.length,
cardBuilder: (context, index, x, y) => ProfileCard(
profile: profiles[index], swipeProgress: x.toDouble(),
 ),
onSwipe: (previousIndex, currentIndex, direction) {
final profile = profiles[previousIndex];
print('${profile['name']} swiped: $direction');
if (direction == CardSwiperDirection.left) {
print('Disliked ${profile['name']}');
} else if (direction == CardSwiperDirection.right) {
print('Liked ${profile['name']}');
} else if (direction == CardSwiperDirection.top) {
print('Super Liked ${profile['name']}');
} else if (direction == CardSwiperDirection.bottom) {
print('Passed ${profile['name']}');
}
return true; 
},
               
allowedSwipeDirection: AllowedSwipeDirection.symmetric(
horizontal: true,
vertical: true,
),
numberOfCardsDisplayed: 3,
scale: 0.9,
padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
),
),
const SizedBox(height: 40),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
FloatingActionButton( onPressed: () => controller.swipe(CardSwiperDirection.left),
backgroundColor: Colors.white, elevation: 4,
child: const Icon(Icons.close, color: Colors.red, size: 30),
),
const SizedBox(width: 30),
FloatingActionButton(onPressed: () => controller.swipe(CardSwiperDirection.top), backgroundColor: Colors.white,
elevation: 4,
child: const Icon(Icons.star, color: Colors.blue, size: 30),
),
const SizedBox(width: 30),
FloatingActionButton(onPressed: () => controller.swipe(CardSwiperDirection.right), backgroundColor: Colors.white,
elevation: 4,
child: const Icon(Icons.favorite, color: Colors.green, size: 30),
),
],
),
],
),
),
);
  }

 final List<Map<String, dynamic>> profiles = [
    {
      'name': 'Buggies',
      'age': 35,
      'bio': 'Fun loving and adventurous.',
      'image': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cG9ydHJhaXR8ZW58MHx8MHx8fDA%3D',
    },
    {
      'name': 'Smith',
      'age': 25,
      'bio': 'A devout catholic and a lover of God.',
      'image': 'https://images.unsplash.com/photo-1562904403-a5106bef8319?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEwfHx8ZW58MHx8fHx8',
    },
    {
      'name': 'George',
      'age': 56,
      'bio': 'Golf club and hiking.',
      'image': 'https://images.unsplash.com/photo-1560250097-0b93528c311a?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    
    {
      'name': 'Jessica',
      'age': 30,
      'bio': 'Fitness enthusiast and a yoga lover.',
      'image': 'https://images.unsplash.com/photo-1531123414780-f74242c2b052?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
    },
  ];
}


// This code defines a Tinder-like swipe interface using Flutter.