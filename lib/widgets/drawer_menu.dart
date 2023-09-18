import 'package:flutter/material.dart';

import '../screens/place_order_screen.dart';
import '../screens/place_product_screen.dart';
import '../screens/place_sales_screen.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Sistema Cantina'),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            title: Text('Gerenciar Estoque'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.of(context).pushNamed(PlaceProductScreen.routeName);
            },
          ),
          ListTile(
            title: Text('Efetuar Pedido'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.of(context).pushNamed(PlaceOrderScreen.routeName);
            },
          ),
          ListTile(
            title: Text('Consultar Vendas'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.of(context).pushNamed(PlaceSalesScreen.routeName);

            },
          ),
        ],
      ),
    );
  }
}
