import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cart = [
    {'name': 'Product 1', 'price': 49.99, 'quantity': 1},
    {'name': 'Product 2', 'price': 29.99, 'quantity': 2},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              'https://via.placeholder.com/50',
              fit: BoxFit.cover,
            ),
            title: Text(cart[index]['name']),
            subtitle: Text('\$${cart[index]['price'].toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (cart[index]['quantity'] > 1) {
                        cart[index]['quantity']--;
                      }
                    });
                  },
                ),
                Text('${cart[index]['quantity']}'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      cart[index]['quantity']++;
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/checkout');
            },
            child: Text('Proceed to Checkout'),
          ),
        ),
      ),
    );
  }
}
