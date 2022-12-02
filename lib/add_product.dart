import 'package:flutter/material.dart';

import 'models/product.dart';


class AddProduct extends StatelessWidget {
   AddProduct({Key? key}) : super(key: key);
   
  TextEditingController  txtName=TextEditingController();
   TextEditingController  txtPrice=TextEditingController();
   TextEditingController  txtDescription=TextEditingController();
   List<Product> listProduct=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add product"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtName,
                  decoration: InputDecoration(
                    labelText: "Title",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtPrice,
                  decoration: InputDecoration(
                    labelText: "Price",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtDescription,
                  decoration: InputDecoration(
                    labelText: "Description",
                  ),
                ),
              ),
            ElevatedButton(onPressed: (){
              listProduct.add(
                  Product(
                      name: txtName.text,
                      image: "https://upload.wikimedia.org/wikipedia/commons/7/75/Wikipedia_mobile_app_logo.png",
                      description: txtDescription.text,
                      coin: double.parse(txtPrice.text)));
              Navigator.pop(context);
            }, child: Text(""
                "Add Product"))
            ],
          ),
        ),
      ),
    );
  }
}
