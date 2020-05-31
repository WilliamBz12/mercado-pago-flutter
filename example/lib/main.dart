import 'package:example/pages/add_card_page.dart';
import 'package:example/pages/associate_card_with_user_page.dart';
import 'package:flutter/material.dart';
import 'package:mercado_pago_flutter/mercado_pago_flutter.dart';

import 'pages/create_user_page.dart';
import 'pages/generate_token_to_payment_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _myCredentials = MercadoPagoCredentials(
    publicKey: "TEST-c4dddf49-fb1d-4255-a533-771893450ca1",
    accessToken:
        "TEST-5561621576284332-050814-31ec2e6e955becf249b25184d0f12114-172873986",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddCardPage(
                          mercadoPagoCredentials: _myCredentials,
                        )),
              );
            },
            child: Text("Adicionar Cartão"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreateUserPage(
                          mercadoPagoCredentials: _myCredentials,
                        )),
              );
            },
            child: Text("Adicionar usuario"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AssociateCardWithUserPage(
                          mercadoPagoCredentials: _myCredentials,
                        )),
              );
            },
            child: Text("Associar cartão com usuario"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GeneateTokentoPaymentePage(
                          mercadoPagoCredentials: _myCredentials,
                        )),
              );
            },
            child: Text("Gerar Toekn de Pagamento"),
          ),
        ],
      ),
    );
  }
}
