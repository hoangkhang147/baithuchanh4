import 'package:flutter/material.dart';
import '../cart/cart_screen.dart';
import 'package:provider/provider.dart';
import '../shared/app_drawer.dart';
import 'products_grid.dart';
import '../cart/cart_manager_dart';
import 'top_right_badge.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          buildProductFilterMenu(),
          buildShoppingCartIcon(),
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }

  Widget buildShoppingCartIcon() {
    /* return TopRightBadge (
    data: CartManager().productCount,
      child: IconButton(
        icon: const Icon(
          Icons.shopping_cart,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(CartScreen.routeName);
        },
      ),
   ); */
    return Consumer<CartManager>(
      builder: (ctx, cartManager, child) {
        return TopRightBadge(
          data: cartManager.productCount,
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.of(ctx).pushNamed(CartScreen.routeName);
            },
          ),
        );
      },
    );
  }

  Widget buildProductFilterMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue) {
        setState(() {
          if (selectedValue == FilterOptions.favorites) {
            _showOnlyFavorites = true;
          } else {
            _showOnlyFavorites = false;
          }
        });
      },
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('Only Favorites'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Show All'),
        ),
      ],
    );
  }
}
// enum FilterOptions { favorites, all }

// class ProductsOverviewScreen extends StatefulWidget {
//   const ProductsOverviewScreen({super.key});

//   @override
//   State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
// }

// class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
//   var _showOnlyFavorites = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MyShop'),
//         actions: <Widget>[
//           buildProductFilterMenu(),
//           buildShoppingCartIcon(),
//         ],
//       ),
//       drawer: const AppDrawer(),
//       body: ProductsGrid(_showOnlyFavorites),
      // body: ProductsGrid(_showOnlyFavorites),
      //   appBar: AppBar(
      //     title: const Text('MyShop'),
      //     actions: <Widget>[
      //       buildProductFilterMenu(),
      //       buildShoppingCartIcon(),
      //     ]
      //   ),
  //   );
  // }

  // onPressed:(){
  //   Navigator.of(context).pushNamed(CartScreen.routeName);
  // }
  // return TopRightBadge(
  //   data: CartManager.productCount,
  //   child:IconButton(
  //     Icons.shopping_cart,
  //   ),
  //   onPressed: () {
  //     Navigator.of(context).pushNamed(CartSreen.routeName);
  //   },
  //   )
//         return Consumer<CartManager>(
// builder: (ctx, cartManager, child){
// return TopRightBadge(
// data: cartManager.productCount,
// child: IconButton(
// icon: const Icon(
// Icons.shopping_cart,),
// onPressed:(){
// Navigator.of(ctx)pushNamed(CartScreen.routeName);
// }))})}
  //     )
  //   );
  // }
  // Widget buildShoppingCartIcon() {
  //   return IconButton(
  //     icon: const Icon(
  //       Icons.shopping_cart,
  //     ),
  //     onPressed: () {
  //       print('Go to cart sreen');
  //     },
  //   );
  // }

//   Widget buildProductFilterMenu() {
//     return PopupMenuButton(
//       onSelected: (FilterOptions selectedValue) {
//         setState(() {
//           if (selectedValue == FilterOptions.favorites) {
//             _showOnlyFavorites = true;
//           } else {
//             _showOnlyFavorites = false;
//           }
//         });
//       },
//       icon: const Icon(
//         Icons.more_vert,
//       ),
//       itemBuilder: (ctx) => [
//         const PopupMenuItem(
//           value: FilterOptions.favorites,
//           child: Text('Only Favorites'),
//         ),
//         const PopupMenuItem(
//           value: FilterOptions.all,
//           child: Text('Show All'),
//         ),
//       ],
//     );
//   }

//   Widget buildShoppingCartIcon() {
//     return TopRightBadge(
//       data: CartManager().productCount,
//       child: IconButton(
//         icon: const Icon(
//           Icons.shopping_cart,
//         ),
//         onPressed: () {
//           Navigator.of(context).pushNamed(CartScreen.routeName);
//         },
//       ),
//     );
//   }
// }
