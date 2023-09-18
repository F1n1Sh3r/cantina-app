import 'package:cantina_app/providers/cart.dart';
import 'package:cantina_app/providers/products.dart';
import 'package:cantina_app/screens/cart_screen.dart';
import 'package:cantina_app/screens/place_order_screen.dart';
import 'package:cantina_app/screens/place_product_screen.dart';
import 'package:cantina_app/screens/place_sales_screen.dart';
import 'package:cantina_app/screens/product_detail_screen.dart';
import 'package:cantina_app/screens/product_overview_screen.dart';
import 'package:cantina_app/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Cantina App',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          hintColor: Colors.deepOrange,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
          ),
        ),
        home: MyHomePage(title: 'Teste', key: this.key),

        //register all routes here
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          PlaceOrderScreen.routeName: (context) => PlaceOrderScreen(),
          PlaceProductScreen.routeName: (context) => PlaceProductScreen(),
          PlaceSalesScreen.routeName: (context) => PlaceSalesScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

enum PopupValue {
  showFavorite,
  showAll,
}



class MyHomePage extends StatelessWidget {
  MyHomePage({ Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Badge(
            label: Text(cart.itemCount.toString()),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (_popupValue) {
              if (_popupValue == PopupValue.showFavorite) {
                productContainer.showFavorite();
              } else {
                productContainer.showAll();
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                value: PopupValue.showFavorite,
                child: Text("Only Favorite"),
              ),
              PopupMenuItem(
                value: PopupValue.showAll,
                child: Text("Show All"),
              ),
            ],
          ),
        ],
        title: Text(title),
        centerTitle: true,
      ),
      body: ProductOverviewScreen(),
      drawer: DrawerMenu(),
    );
  }
}
