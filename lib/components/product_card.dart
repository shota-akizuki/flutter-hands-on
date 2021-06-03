import 'package:flutter/widgets.dart';
import 'package:flutter_hands_on/components/product_detail.dart';
import 'package:flutter_hands_on/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    @required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Navigator.of(context).pushNamedで遷移を実行する
      // 第一引数はルーティング名、argumentsはoptionalでパラメータを渡せる
      // ProductDetailで書いた通り、遷移先のウィジェットでは、
      // ModalRoute.of(context).settings.argumentsでこの引数が取得できる
      onTap: () async {
        Navigator.of(context)
            .pushNamed(ProductDetail.routeName, arguments: this.product);
      },
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(product.sampleImageUrl),
            SizedBox(
              height: 40,
              child: Text("${product.title}"),
            ),
            Text("${product.price.toString()}円")
          ],
        ),
      ),
    );
  }
}
