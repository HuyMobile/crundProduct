
import 'package:crundproduct/add_product.dart';
import 'package:crundproduct/edit_product.dart';
import 'package:crundproduct/models/product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("List Products"), centerTitle: true, actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct()));
          },
        ),
      ]),
      body: ListView.builder(
          itemCount: listProducts.length,
          itemBuilder: (context, index) {
            return ListTile(
                title:
                    Text(listProducts[index].name),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage("${listProducts[index].image}"),
                  backgroundColor: Colors.transparent,
                   ),
                trailing: SizedBox(
                  width: screenSize.width/4,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProduct(product: listProducts[index],)));
                      }, icon: Icon(Icons.edit,color: Colors.purple,)),
                      IconButton(onPressed: (){
                        setState((){
                          listProducts.removeAt(index);
                        });
                      }, icon: Icon(Icons.delete,color: Colors.red,)),
                    ],
                  ),
                ));
          }),
    );
  }
}

List<Product> listProducts = [
  Product(
      name: "Chuột",
      description: "Dùng rất êm ả",
      coin: 18,
      image:
      "https://cdn.tgdd.vn/Files/2020/08/18/1281090/geniusdx-125_901x527-800-resize.png"),
  Product(
      name: "Bàn phím",
      description: "Bàn phím được yêu thích nhất",
      coin: 20,
      image:
      "https://salt.tikicdn.com/ts/product/fc/d3/c7/9bc40ab0099653bd1929c500db640771.jpg"),
  Product(
      name: "Màn hình",
      description: "Màn hình xem bóng đá",
      coin: 50,
      image:
      "https://tinhocanhphat.vn/media/lib/man-hinh-may-tinh-gia-re.jpg"),
];
