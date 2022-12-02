import 'package:crundproduct/main.dart';
import 'package:flutter/material.dart';

import 'models/product.dart';


class EditProduct extends StatefulWidget {
  const EditProduct({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  void initState() {
    super.initState();
    txtName.text= widget.product.name;
    txtPrice.text= widget.product.coin.toString();
    txtDescription.text=widget.product.description;
    txtImageUrl.text=widget.product.image;
  }

  TextEditingController txtName=TextEditingController();
  TextEditingController txtPrice=TextEditingController();
  TextEditingController txtDescription=TextEditingController();
  TextEditingController txtImageUrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: txtName,
                    decoration: InputDecoration(
                      labelText: "Name"
                    ),

              )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: txtPrice,
                    decoration: InputDecoration(
                        labelText: "Price"
                    ),

                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: txtDescription,
                    decoration: InputDecoration(
                        labelText: "Description"
                    ),

                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Image.network(widget.product.image,width:50,)),
                      SizedBox(width: 10,),
                      Expanded(
                        flex: 2,
                          child: TextField(
                            controller:txtImageUrl ,
                            decoration: InputDecoration(
                              labelText: "Image url"
                            ),
                          )
                      ),

                    ],
                  )),
              ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

              }, child: Text("Update")),
            ],
          ),
        ),
      ),
    );
  }
}
