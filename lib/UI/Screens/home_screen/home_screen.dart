import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_together/UI/Screens/all_categories/all_categories.dart';
import 'package:cook_together/UI/Screens/create_screen/create_screen.dart';
import 'package:cook_together/UI/Screens/recipe_detailscreen/Recipe_details.dart';
import 'package:cook_together/core/constants/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../providers/favrt_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> categories = [
    {
      'image': 'assets/images/afghani recipe.png',
      'name': 'Afghani recipe',
      'recipes': [
        {
          'name': 'Afghani Pulao',
          'image': 'assets/images/afghani rice.png',
          'ingredients': ['Rice', 'Lamb', 'Carrots', 'Raisins', 'Spices'],
          'instructions':
          'Cook rice with lamb and spices, then mix with fried carrots and raisins.'
        },
        {
          'name': 'Afghani Mantu',
          'image': 'assets/images/dumpling.png',
          'ingredients': ['Flour', 'Ground beef', 'Onions', 'Garlic', 'Yogurt'],
          'instructions':
          'Fill dough with beef mixture, steam, and top with garlic yogurt sauce.'
        },
        // Add more Afghani recipes
      ],
    },
    {
      'image': 'assets/images/chines food.png',
      'name': 'Chinese recipe',
      'recipes': [
        {
          'name': 'Kung Pao Chicken',
          'image': 'assets/images/kung pao chicken.png',
          'ingredients': [
            'Chicken',
            'Peanuts',
            'Chili peppers',
            'Garlic',
            'Ginger',
            'Soy sauce'
          ],
          'instructions':
          'Stir-fry chicken with garlic, ginger, peanuts, and chili peppers in soy sauce.'
        },
        {
          'name': 'Spring Rolls',
          'image': 'assets/images/spring rolls.png',
          'ingredients': ['Cabbage', 'Carrots', 'Rice paper', 'Soy sauce'],
          'instructions':
          'Fill rice paper with veggies, roll up, and fry until golden.'
        },
        // Add more Chinese recipes
      ],
    },
    {
      'image': 'assets/images/italian food.png',
      'name': 'Italian recipe',
      'recipes': [
        {
          'name': 'Pasta Carbonara',
          'image': 'assets/images/pasta carbonara.png',
          'ingredients': [
            'Pasta',
            'Eggs',
            'Pancetta',
            'Parmesan',
            'Black pepper'
          ],
          'instructions':
          'Cook pasta, mix with eggs, pancetta, and Parmesan, then season with pepper.'
        },
        {
          'name': 'Tiramisu',
          'image': 'assets/images/tiramisu-cake.png',
          'ingredients': [
            'Ladyfingers',
            'Mascarpone',
            'Coffee',
            'Cocoa powder',
            'Sugar'
          ],
          'instructions':
          'Layer ladyfingers soaked in coffee with mascarpone mixture, top with cocoa powder.'
        },
        // Add more Italian recipes
      ],
    },
    {
      'image': 'assets/images/indian food item.png',
      'name': 'Indian recipe',
      'recipes': [
        {
          'name': 'Butter Chicken',
          'image': 'assets/images/butter chicken.png',
          'ingredients': [
            'Chicken',
            'Tomato puree',
            'Butter',
            'Cream',
            'Spices'
          ],
          'instructions':
          'Cook chicken in tomato puree with butter and cream, then season with spices.'
        },
        {
          'name': 'Gulab Jamun',
          'image': 'assets/images/gulab jamaun.png',
          'ingredients': ['Milk powder', 'Flour', 'Sugar', 'Ghee', 'Cardamom'],
          'instructions':
          'Fry dough balls made from milk powder, then soak in sugar syrup flavored with cardamom.'
        },
        // Add more Indian recipes
      ],
    },
    {
      'image': 'assets/images/pakistani food.png',
      'name': 'Pakistani recipe',
      'recipes': [
        {
          'name': 'Biryani',
          'image': 'assets/images/biryani chicken.png',
          'ingredients': ['Rice', 'Chicken', 'Yogurt', 'Spices', 'Onions'],
          'instructions':
          'Layer cooked rice with spiced chicken and yogurt, then steam until flavors meld.'
        },
        {
          'name': 'Chapli Kebab',
          'image': 'assets/images/chapli kabab.png',
          'ingredients': [
            'Minced meat',
            'Spices',
            'Tomatoes',
            'Onions',
            'Coriander'
          ],
          'instructions':
          'Mix minced meat with spices and tomatoes, shape into patties, and fry.'
        },
        // Add more Pakistani recipes
      ],
    },
  ];
  List<Map<String, dynamic>> popularRecipes = [
    {
      'image': 'assets/images/baryani.png',
      'name': 'Biryani',
      'time': '45-50min',
      'people': '6 person',
      'ingredients': [
        '1 kg Basmati rice',
        '1 kg chicken',
        '2 cups yogurt',
        '4 onions, sliced',
        '3 tomatoes, chopped',
        '4 tbsp Biryani masala',
        '2 tsp ginger garlic paste',
        'Salt to taste',
        '1/2 cup oil',
        'Fresh coriander and mint leaves',
      ],
      'instructions':
      'Marinate chicken with yogurt, biryani masala, salt, and ginger garlic paste. Fry onions until golden brown, then add tomatoes and cook until soft. Add marinated chicken and cook until done. Layer cooked rice over the chicken mixture, garnish with coriander and mint leaves, and steam on low heat for 15-20 minutes. Serve hot.'
    },
    {
      'image': 'assets/images/gulab jamaun.png',
      'name': 'Gulab Jamun',
      'time': '50-1h',
      'people': '6 person',
      'ingredients': [
        '2 cups milk powder',
        '1/2 cup all-purpose flour',
        '1/4 tsp baking soda',
        '2 tbsp ghee',
        '1/2 cup milk',
        '2 cups sugar',
        '2 cups water',
        '4-5 cardamom pods',
        'Oil for frying',
      ],
      'instructions':
      'Mix milk powder, flour, baking soda, ghee, and milk to form a dough. Shape into small balls. Fry in hot oil until golden brown. Prepare sugar syrup by boiling sugar, water, and cardamom. Soak fried balls in warm sugar syrup for 30 minutes before serving.'
    },
    {
      'image': 'assets/images/kheer.png',
      'name': 'Kheer',
      'time': '1h-1.5h',
      'people': '4 person',
      'ingredients': [
        '1 liter full-fat milk',
        '1/4 cup rice',
        '1/2 cup sugar',
        '4-5 cardamom pods',
        '2 tbsp chopped almonds and pistachios',
        'Saffron strands (optional)',
      ],
      'instructions':
      'Rinse and soak rice for 30 minutes. Boil milk in a heavy-bottomed pan, add soaked rice, and cook on low heat until the rice is soft and the milk thickens. Stir in sugar, cardamom, and nuts. Cook for another 10-15 minutes. Garnish with saffron and more nuts before serving.'
    },
    {
      'image': 'assets/images/burger.png',
      'name': 'Burger',
      'time': '30-35min',
      'people': '4 person',
      'ingredients': [
        '4 burger buns',
        '500g ground beef or chicken',
        '1 onion, finely chopped',
        '1 egg',
        'Salt and pepper to taste',
        'Lettuce leaves',
        'Tomato slices',
        'Cheese slices (optional)',
        'Ketchup and mayonnaise',
        'Oil for frying',
      ],
      'instructions':
      'Mix ground meat with chopped onion, egg, salt, and pepper. Shape into patties and fry in hot oil until cooked through. Assemble burgers by placing lettuce, tomato, patties, and cheese inside buns. Add ketchup and mayonnaise to taste.'
    },
    {
      'image': 'assets/images/chowmein.png',
      'name': 'Chowmein',
      'time': '40min',
      'people': '4-6 person',
      'ingredients': [
        '250g noodles',
        '200g chicken breast, sliced',
        '1 onion, sliced',
        '1 bell pepper, sliced',
        '1 carrot, julienned',
        '2 tbsp soy sauce',
        '1 tbsp oyster sauce',
        '1 tbsp vinegar',
        '1 tbsp chili sauce',
        'Salt and pepper to taste',
        'Oil for frying',
      ],
      'instructions':
      'Boil noodles according to package instructions and set aside. Stir-fry chicken slices in hot oil until browned. Add onions, bell pepper, and carrot, and stir-fry until tender. Add cooked noodles, soy sauce, oyster sauce, vinegar, and chili sauce. Toss well to coat noodles evenly. Serve hot.'
    },
    {
      'image': 'assets/images/potato meat.png',
      'name': 'Aloo Gosht',
      'time': '1h',
      'people': '5-6 person',
      'ingredients': [
        '500g mutton',
        '4 potatoes, quartered',
        '2 onions, sliced',
        '2 tomatoes, chopped',
        '2 tsp ginger garlic paste',
        '2 tsp coriander powder',
        '1 tsp cumin powder',
        '1/2 tsp turmeric powder',
        'Salt to taste',
        '1/2 cup oil',
        'Fresh coriander for garnish',
      ],
      'instructions':
      'Heat oil in a pot, fry onions until golden, add ginger garlic paste, tomatoes, and spices. Cook until oil separates. Add mutton and cook until browned. Add water and simmer until meat is tender. Add potatoes and cook until done. Garnish with fresh coriander and serve hot.'
    },
    {
      'image': 'assets/images/cake.png',
      'name': 'Brownies',
      'time': '40-35min',
      'people': '2',
      'ingredients': [
        '1/2 cup butter',
        '1 cup sugar',
        '2 eggs',
        '1/3 cup cocoa powder',
        '1/2 cup flour',
        '1/4 tsp salt',
        '1/4 tsp baking powder',
        '1 tsp vanilla extract',
      ],
      'instructions':
      'Preheat oven to 350°F (175°C). Melt butter, stir in sugar, eggs, and vanilla. Add cocoa, flour, salt, and baking powder. Spread batter in a greased baking pan. Bake for 20-25 minutes or until the edges start to pull away from the pan. Cool before cutting into squares.'
    },
    {
      'image': 'assets/images/chapli kabab.png',
      'name': 'Chapli Kabab',
      'time': '40min',
      'people': '2-4',
      'ingredients': [
        '500g ground beef',
        '1 onion, finely chopped',
        '2 green chilies, chopped',
        '1 tomato, finely chopped',
        '1 egg',
        '1 tsp cumin seeds',
        '1 tsp coriander seeds, crushed',
        '1 tsp red chili powder',
        'Salt to taste',
        'Oil for frying',
      ],
      'instructions':
      'Mix ground beef with onion, green chilies, tomato, egg, cumin seeds, coriander seeds, red chili powder, and salt. Shape the mixture into flat patties. Fry in hot oil until browned and cooked through. Serve hot with naan or as a side dish.'
    },
    {
      'image': 'assets/images/chicken microni.png',
      'name': 'Macaroni',
      'time': '45min',
      'people': '5-6 person',
      'ingredients': [
        '250g macaroni',
        '200g chicken breast, diced',
        '1 onion, chopped',
        '1 bell pepper, chopped',
        '1 carrot, diced',
        '2 cups tomato sauce',
        '1 tsp Italian seasoning',
        'Salt and pepper to taste',
        'Cheese for topping (optional)',
        'Oil for frying',
      ],
      'instructions':
      'Cook macaroni according to package instructions. In a pan, sauté chicken with onions until cooked. Add bell pepper, carrot, and tomato sauce. Season with Italian seasoning, salt, and pepper. Mix in cooked macaroni, top with cheese if desired, and bake in the oven until cheese is melted.'
    },
    {
      'image': 'assets/images/gajra halwa.png',
      'name': 'Gajar Ka Halwa',
      'time': '45-50min',
      'people': '4-6 person',
      'ingredients': [
        '1 kg carrots, grated',
        '1 liter milk',
        '1 cup sugar',
        '4-5 cardamom pods',
        '2 tbsp ghee',
        '2 tbsp chopped nuts (almonds, pistachios)',
        'Raisins (optional)',
      ],
      'instructions':
      'Heat ghee in a pan, add grated carrots and cook until soft. Add milk and cardamom, and cook on low heat until milk reduces and thickens. Stir in sugar and cook until dissolved. Garnish with chopped nuts and raisins before serving.'
    },
    {
      'image': 'assets/images/haleem.png',
      'name': 'Haleem',
      'time': '1h-1.5h',
      'people': '6 person',
      'ingredients': [
        '500g meat (beef or mutton)',
        '1 cup lentils (chana dal, moong dal, masoor dal)',
        '1/2 cup wheat grains',
        '2 onions, sliced',
        '2 tsp ginger garlic paste',
        '1 tsp turmeric powder',
        '1 tsp red chili powder',
        'Salt to taste',
        '1/2 cup oil',
        'Garam masala for garnish',
        'Fried onions for garnish',
      ],
      'instructions':
      'Cook meat with ginger garlic paste, turmeric, red chili powder, and salt until tender. Cook lentils and wheat grains separately until soft. Blend meat and lentils into a smooth paste. Simmer the mixture on low heat, stirring occasionally. Garnish with garam masala and fried onions before serving.'
    },
    {
      'image': 'assets/images/keema peas karhai.png',
      'name': 'Keema Peas',
      'time': '1h',
      'people': '6-8 person',
      'ingredients': [
        '500g ground meat (beef or mutton)',
        '1 cup peas',
        '2 onions, chopped',
        '2 tomatoes, chopped',
        '2 tsp ginger garlic paste',
        '1 tsp cumin seeds',
        '1 tsp coriander powder',
        '1 tsp red chili powder',
        'Salt to taste',
        'Oil for frying',
      ],
      'instructions':
      'Heat oil, add cumin seeds and onions, and fry until golden. Add ginger garlic paste and tomatoes, and cook until soft. Add ground meat and cook until browned. Add peas and spices, and cook until peas are tender. Serve hot with rice or bread.'
    },
    {
      'image': 'assets/images/kuffta.png',
      'name': 'Kofta',
      'time': '35-40min',
      'people': '6-8 person',
      'ingredients': [
        '500g ground meat (beef or mutton)',
        '1 onion, finely chopped',
        '2 green chilies, chopped',
        '1 tsp cumin powder',
        '1 tsp coriander powder',
        'Salt to taste',
        '1 egg',
        'Oil for frying',
        '2 cups tomato puree',
        '1 tsp garam masala',
      ],
      'instructions':
      'Mix ground meat with onion, green chilies, cumin, coriander, salt, and egg. Shape into balls and fry until browned. Prepare a gravy with tomato puree and garam masala. Simmer koftas in the gravy for 10-15 minutes before serving.'
    },
    {
      'image': 'assets/images/mintmargirta.png',
      'name': 'Mint Margarita',
      'time': '10-15min',
      'people': '2 person',
      'ingredients': [
        '1/2 cup fresh mint leaves',
        '2 tbsp lemon juice',
        '2 tbsp sugar',
        '1 cup soda or sparkling water',
        'Ice cubes',
        'Lemon slices for garnish',
      ],
      'instructions':
      'Blend mint leaves, lemon juice, sugar, and a little water until smooth. Strain the mixture into a glass, add ice cubes, and top with soda or sparkling water. Garnish with lemon slices and serve chilled.'
    },
    {
      'image': 'assets/images/mutton karhai.png',
      'name': 'Mutton Karhai',
      'time': '1h-1.5h',
      'people': '8-10 person',
      'ingredients': [
        '1 kg mutton',
        '4 tomatoes, chopped',
        '4 green chilies, sliced',
        '2 tsp ginger garlic paste',
        '1 tsp cumin seeds',
        '1 tsp coriander powder',
        'Salt to taste',
        '1/2 cup oil',
        'Fresh coriander for garnish',
      ],
      'instructions':
      'Heat oil in a karhai (wok), add cumin seeds and ginger garlic paste, and sauté for a minute. Add mutton, tomatoes, green chilies, and spices. Cook on high heat until the mutton is browned. Lower the heat and cook until the meat is tender and the oil separates. Garnish with fresh coriander and serve hot.'
    },
    {
      'image': 'assets/images/pinacolada.png',
      'name': 'Pina Colada',
      'time': '10-15min',
      'people': '2 person',
      'ingredients': [
        '1 cup pineapple juice',
        '1/2 cup coconut milk',
        '2 tbsp sugar',
        '1/2 cup crushed ice',
        'Pineapple slices for garnish',
      ],
      'instructions':
      'Blend pineapple juice, coconut milk, sugar, and crushed ice until smooth. Pour into glasses, garnish with pineapple slices, and serve immediately.'
    },
    {
      'image': 'assets/images/red beans tarka.png',
      'name': 'Red Beans',
      'time': '2h-1.5h',
      'people': '10-12 person',
      'ingredients': [
        '500g red kidney beans, soaked overnight',
        '2 onions, chopped',
        '2 tomatoes, chopped',
        '2 tsp ginger garlic paste',
        '1 tsp cumin seeds',
        '1 tsp coriander powder',
        '1/2 tsp turmeric powder',
        'Salt to taste',
        '1/2 cup oil',
        'Fresh coriander for garnish',
      ],
      'instructions':
      'Cook soaked red kidney beans until tender. In another pan, heat oil and fry onions until golden. Add ginger garlic paste, tomatoes, and spices, and cook until oil separates. Add cooked beans and simmer for 10-15 minutes. Garnish with fresh coriander and serve with rice or bread.'
    },
    {
      'image': 'assets/images/seekh kabab.png',
      'name': 'Seekh Kabab',
      'time': '40min',
      'people': '4-6 person',
      'ingredients': [
        '500g ground beef or lamb',
        '1 onion, finely chopped',
        '2 green chilies, chopped',
        '1 tsp cumin powder',
        '1 tsp coriander powder',
        '1/2 tsp garam masala',
        'Salt to taste',
        'Skewers',
        'Oil for grilling',
      ],
      'instructions':
      'Mix ground meat with onion, green chilies, cumin powder, coriander powder, garam masala, and salt. Shape the mixture onto skewers. Grill on medium heat until browned and cooked through. Serve hot with naan or as a side dish.'
    },
    {
      'image': 'assets/images/white pasta.png',
      'name': 'White Sauce Pasta',
      'time': '40min',
      'people': '6 person',
      'ingredients': [
        '250g pasta (penne, fettuccine, etc.)',
        '2 tbsp butter',
        '2 tbsp all-purpose flour',
        '2 cups milk',
        '1/2 cup grated cheese',
        'Salt and pepper to taste',
        '1/2 tsp garlic powder',
        'Fresh parsley for garnish',
      ],
      'instructions':
      'Cook pasta according to package instructions. In a pan, melt butter, add flour, and cook for a minute. Gradually add milk, stirring continuously to avoid lumps. Add grated cheese, salt, pepper, and garlic powder, and cook until the sauce thickens. Toss cooked pasta in the sauce and garnish with fresh parsley.'
    },
    {
      'image': 'assets/images/strawberry shak.png',
      'name': 'Strawberry Shake',
      'time': '15min',
      'people': '2 person',
      'ingredients': [
        '1 cup fresh strawberries, hulled',
        '1 cup milk',
        '2 tbsp sugar',
        '1/2 cup vanilla ice cream',
        'Strawberry slices for garnish',
      ],
      'instructions':
      'Blend strawberries, milk, sugar, and vanilla ice cream until smooth. Pour into glasses, garnish with strawberry slices, and serve immediately.'
    },
    {
      'image': 'assets/images/sojii k halwa.png',
      'name': 'Suji Ka Halwa',
      'time': '35-30min',
      'people': '6 person',
      'ingredients': [
        '1 cup semolina (suji)',
        '1/2 cup ghee',
        '1 cup sugar',
        '2 cups water',
        '4-5 cardamom pods',
        'Chopped nuts for garnish (almonds, pistachios)',
      ],
      'instructions':
      'Heat ghee in a pan, add semolina, and roast on low heat until golden and fragrant. In a separate pot, boil water with sugar and cardamom. Slowly add the sugar syrup to the roasted semolina, stirring continuously to avoid lumps. Cook until the mixture thickens and ghee separates. Garnish with chopped nuts before serving.'
    },
    {
      'image': 'assets/images/chickenEgg.png',
      'name': 'Chicken Egg Handi',
      'time': '1h',
      'people': '10-12 person',
      'ingredients': [
        '1 kg chicken, cut into pieces',
        '4 eggs, boiled',
        '2 onions, chopped',
        '2 tomatoes, chopped',
        '2 tsp ginger garlic paste',
        '1 tsp cumin seeds',
        '1 tsp coriander powder',
        '1/2 tsp turmeric powder',
        'Salt to taste',
        '1/2 cup oil',
        'Fresh coriander for garnish',
      ],
      'instructions':
      'Heat oil in a handi (clay pot), fry onions until golden, add ginger garlic paste, tomatoes, and spices. Cook until oil separates. Add chicken pieces and cook until done. Add boiled eggs and simmer for a few minutes. Garnish with fresh coriander and serve hot.'
    },
  ];
  var picId = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: ConstColor.primaryColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => CreateScreen(
                      picId: picId,
                    )));
          },
          child: Icon(Icons.add,color: Colors.white,),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.h, right: 5.w, left: 0.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Hungry ? Choose a dish...',
                    style: TextStyle(
                        fontSize: 0.280.dp,
                        fontWeight: FontWeight.w700,
                        color: Colors.brown),
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 8.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 0.285.dp, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'see more',
                    style: TextStyle(
                        fontSize: 0.200.dp, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 28.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.h),
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.pink.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.brown)),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AllCategories(
                                          name: categories[index]['name']
                                              .toString(),
                                          specificRecipes: categories[index]
                                          ['recipes']),
                                    ));
                              },
                              child: Image.asset(
                                categories[index]['image'],
                                height: 20.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                categories[index]['name'],
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h, right: 66.w),
              child: Text(
                'All Recipes',
                style:
                TextStyle(fontSize: 0.315.dp, fontWeight: FontWeight.w700),
              ),
            ),
            // Expanded(
            //   child: GridView.builder(
            //     itemCount: popularRecipes.length,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       mainAxisSpacing: 8,
            //       crossAxisSpacing: 8,
            //       childAspectRatio: 2 / 2.5,
            //     ),
            //     itemBuilder: (ctx, index) {
            //       final recipe = popularRecipes[index];

            //       return Consumer<FavoriteProvider>(
            //         builder: (context, favoriteProvider, child) {
            //           final isFavorite = favoriteProvider.isFavorite(recipe);

            //           return InkWell(
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => RecipeDetails(
            //                     name: recipe['name'].toString(),
            //                     image: recipe['image'].toString(),
            //                     ingredients: recipe['ingredients'].toString(),
            //                     instructions: recipe['instructions'].toString(),
            //                   ),
            //                 ),
            //               );
            //             },
            //             child: Container(
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 border: Border.all(color: Colors.brown),
            //               ),
            //               child: Column(
            //                 children: [
            //                   Image.asset(
            //                     recipe['image'],
            //                     height: 15.h,
            //                     width: double.infinity,
            //                     fit: BoxFit.cover,
            //                   ),
            //                   Text(
            //                     recipe['name'],
            //                     style: TextStyle(
            //                       fontWeight: FontWeight.w800,
            //                       fontStyle: FontStyle.italic,
            //                       fontSize: 0.200.dp,
            //                     ),
            //                   ),
            //                   Text(
            //                     recipe['time'],
            //                     style: TextStyle(fontWeight: FontWeight.w500),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceAround,
            //                       children: [
            //                         Row(
            //                           children: [
            //                             Icon(Icons.group),
            //                             Text(
            //                               recipe['people'],
            //                               style: const TextStyle(
            //                                   fontWeight: FontWeight.w500),
            //                             ),
            //                           ],
            //                         ),
            //                         IconButton(
            //                           icon: Icon(
            //                             isFavorite
            //                                 ? Icons.favorite
            //                                 : Icons.favorite_border_outlined,
            //                             color: isFavorite
            //                                 ? Colors.yellow
            //                                 : Colors.brown,
            //                           ),
            //                           onPressed: () {
            //                             favoriteProvider.toggleFavorite(recipe);
            //                           },
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
            // getHomeScreenData(),
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('recipe')
                      .snapshots(),
                  builder: (BuildContext ctx,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    return Expanded(
                      child: GridView.builder(
                        itemCount: snapshot.data!.docs.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 2 / 2.5,
                        ),
                        itemBuilder: (ctx, index) {
                          var data = snapshot.data!.docs[index];
                          var picId = snapshot.data!.docs[index].id;

                          final recipe = popularRecipes[index];

                          return Consumer<FavoriteProvider>(
                            builder: (context, favoriteProvider, child) {
                              final isFavorite =
                              favoriteProvider.isFavorite(recipe);

                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipeDetails(
                                        name: data['name'].toString(),
                                        image: data['image'].toString(),
                                        ingredients:
                                        data['ingredients'].toString(),
                                        instructions:
                                        data['instructions'].toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.brown),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        snapshot.data!.docs[index]['image'],
                                        height: 15.h,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]['name'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 0.200.dp,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]['time'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.group),
                                                Text(
                                                  snapshot.data!.docs[index]
                                                  ['person'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                isFavorite
                                                    ? Icons.favorite
                                                    : Icons
                                                    .favorite_border_outlined,
                                                color: isFavorite
                                                    ? Colors.yellow
                                                    : Colors.brown,
                                              ),
                                              onPressed: () {
                                                favoriteProvider
                                                    .toggleFavorite(recipe);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget getHomeScreenData() {
    return Expanded(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('recipe').snapshots(),
          builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
            return Expanded(
              child: GridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 2 / 2.5,
                ),
                itemBuilder: (ctx, index) {
                  var data = snapshot.data!.docs[index];
                  var picId = snapshot.data!.docs[index].id;

                  final recipe = popularRecipes[index];

                  return Consumer<FavoriteProvider>(
                    builder: (context, favoriteProvider, child) {
                      final isFavorite = favoriteProvider.isFavorite(recipe);

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipeDetails(
                                name: data['name'].toString(),
                                image: recipe['image'].toString(),
                                ingredients: data['ingredients'].toString(),
                                instructions: data['instructions'].toString(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.brown),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                recipe['image'],
                                height: 15.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                snapshot.data!.docs[index]['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 0.200.dp,
                                ),
                              ),
                              Text(
                                snapshot.data!.docs[index]['time'],
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.group),
                                        Text(
                                          snapshot.data!.docs[index]['person'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        color: isFavorite
                                            ? Colors.yellow
                                            : Colors.brown,
                                      ),
                                      onPressed: () {
                                        favoriteProvider.toggleFavorite(recipe);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }),
    );
  }
}
