import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_product_screen.dart';
import 'user_product_list.dart';
import 'products_manager.dart';

import '../shared/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductsManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          buildAddButton(context),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () async => print('refresh products'),
        child: buildUserProductListView(),
      ),
    );
  }

  Widget buildUserProductListView() {
    return Consumer<ProductsManager>(
      builder: (ctx, productsManager, child) {
        return ListView.builder(
          itemCount: productsManager.itemCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              UserProductListTile(
                productsManager.items[i],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditProductScreen.routeName,
        );
      },
    );
  }
}


// class UserProductsScreen extends StatelessWidget {
//   static const routeName = '/user-products';
//   const UserProductsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final productsManager = ProductManager();

//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Your Products'),
//           actions: <Widget>[
//             buildAddButton(),
//           ],
//         ),
//         drawer: const AppDrawer(),
//         body: RefreshIndicator(
//           onRefresh: () async => print('refresh products'),
//           child: buildUserProductListView(productsManager),
//         ));
//   }

//   Widget buildUserProductListView(ProductManager productsManager) {
//     return ListView.builder(
//       itemCount: productsManager.itemCount,
//       itemBuilder: (ctx, i) => Column(
//         children: [
//           UserProductListTile(
//             productsManager.items[i],
//           ),
//           const Divider(),
//         ],
//       ),
//     );
//   }

//   Widget buildAddButton() {
//     return IconButton(
//       icon: const Icon(Icons.add),
//       onPressed: () {
//         print('Go to edit product screen');
//       },
//     );
//   }
// }
// // widget buildUserProductListView(){
// // return Consumer<ProductsManager>(
// // builder: (ctx, productsManager,child){
// // return ListView.buildder(
// // itemCount: productsManager.itenCount,
// // itemBuilder: (ctx,i ) => Column(
// // children: [
// // UserProductListTile(
// // productsManager.items[i],
// // ),
// // const Divider(),
// // ],),);},);}



// // widget buildAddButton(BuildContext context){
// // return IconButton (
// // icon: consy Icon(Icons.add),
// // onPressed:(){
// // Navigator.of(context).pushNamed(
// // EditProductScreen.routeName,
// // );
// // }
// // );
// // }