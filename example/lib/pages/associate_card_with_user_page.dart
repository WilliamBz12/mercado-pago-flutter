import 'package:flutter/material.dart';
import 'package:mercado_pago_flutter/mercado_pago_flutter.dart';

class AssociateCardWithUserPage extends StatefulWidget {
  final MercadoPagoCredentials mercadoPagoCredentials;

  AssociateCardWithUserPage({this.mercadoPagoCredentials});

  @override
  _AssociateCardWithUserPageState createState() =>
      _AssociateCardWithUserPageState();
}

class _AssociateCardWithUserPageState extends State<AssociateCardWithUserPage> {
  MercadoPagoCardService _cardService;

  final _userID$ = TextEditingController(text: "577125651-qy7QDtzZ5Lg76l");
  final _cardID$ = TextEditingController(text: "45ec82c0ae2a75abdf8f9067b02f4705");

  void _addCard() async {
    try {
      final response = await _cardService.associateCardWithCustomer(
        cardToken: _cardID$.text,
        customerID: _userID$.text,
      );
      print(response);
    } catch (e) {
      print(e.code);
    }
  }

  @override
  void initState() {
    super.initState();
    _cardService =
        MercadoPagoCardService(credentials: widget.mercadoPagoCredentials);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _userID$,
              maxLength: 16,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Customer ID"),
            ),
            TextField(
              controller: _cardID$,
              maxLength: 6,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Card ID"),
            ),
            RaisedButton(
              onPressed: _addCard,
              child: Text("Enviar"),
            )
          ],
        ),
      ),
    );
  }
}
