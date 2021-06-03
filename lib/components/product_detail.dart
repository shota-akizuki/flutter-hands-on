import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hands_on/models/product.dart';

class ProductDetail extends StatelessWidget {
  // 画面を遷移するために必要なウィジェットの名前を定義する
  static const routeName = "/productdetail";
  @override
  Widget build(BuildContext context) {
    // 画面遷移する際に渡した引数が格納されている
    // この引数はObject型として扱われるので、明示的にProduct型を指定する必要がある
    final Product product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("商品詳細"),
      ),
      body: _body(context, product),
    );
  }

  Widget _body(BuildContext context, Product product) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(product.sampleImageUrl),
          Text("${product.title}"),
          Text("作った人:${product.material.user.name}"),
          // product.material.descriptionは商品の説明
          // 空っぽであることもあるので、三項演算子で出すウィジェットを変える
          // String.isEmtpyは空文字の時trueを返す
          product.material.description.isEmpty
              ? Container()
              : _descriptionSection(context, product)
        ],
      ),
    );
  }

  Widget _descriptionSection(BuildContext context, Product product) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "このアイテムについて",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Text("${product.material.description}"),
          )
        ],
      ),
    );
  }
}
