import 'package:flutter/material.dart';
import 'package:mercado_pago_flutter/mercado_pago_flutter.dart';

class GeneateTokentoPaymentePage extends StatefulWidget {
  final MercadoPagoCredentials mercadoPagoCredentials;

  GeneateTokentoPaymentePage({this.mercadoPagoCredentials});

  @override
  _GeneateTokentoPaymentePageState createState() =>
      _GeneateTokentoPaymentePageState();
}

class _GeneateTokentoPaymentePageState extends State<GeneateTokentoPaymentePage> {
  MercadoPagoCardService _cardService;

  final _securityCode$ = TextEditingController();
  final _cardID$ = TextEditingController(text: "45ec82c0ae2a75abdf8f9067b02f4705");

  void _addCard() async {
    try {
      final response = await _cardService.token(
        cardId: _cardID$.text,
        securityCode: _securityCode$.text,
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
              controller: _securityCode$,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Security Code"),
            ),
            TextField(
              controller: _cardID$,
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
