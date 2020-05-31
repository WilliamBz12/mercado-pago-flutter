import 'package:flutter/material.dart';
import 'package:mercado_pago_flutter/mercado_pago_flutter.dart';

class AddCardPage extends StatefulWidget {
  final MercadoPagoCredentials mercadoPagoCredentials;

  AddCardPage({this.mercadoPagoCredentials});

  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  MercadoPagoCardService _cardService;

  final _cardNumber$ = TextEditingController();
  final _cardExpiry$ = TextEditingController();
  final _cardHolderName$ = TextEditingController();
  final _cvv$ = TextEditingController();
  final _identification$ = TextEditingController();
  final _identificationType$ = TextEditingController();

  void _addCard() async {
    final _card = MercadoPagoCreditCardModel(
      cardNumber: _cardNumber$.text,
      expirationMonth: _cardExpiry$.text.substring(0, 2),
      expirationYear: _cardExpiry$.text.substring(2, 6),
      lastFourDigits: _cardNumber$.text.substring(12, 16),
      securityCode: _cvv$.text,
      cardholder: Cardholder(
        identification: MercadoPagoIdentificationModel(
          number: _identification$.text,
          type: _identificationType$.text,
        ),
        name: _cardHolderName$.text,
      ),
    );

    try {
      final response = await _cardService.register(card: _card);
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
              controller: _cardNumber$,
              maxLength: 16,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Card Number"),
            ),
            TextField(
              controller: _cardExpiry$,
              maxLength: 6,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Expiry date mmYYYY"),
            ),
            TextField(
              controller: _cvv$,
              maxLength: 3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Security Code"),
            ),
            TextField(
              controller: _cardHolderName$,
              decoration: InputDecoration(hintText: "Name in Card"),
            ),
            TextField(
              controller: _identification$,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Identification Number"),
            ),
            TextField(
              controller: _identificationType$,
              decoration: InputDecoration(
                hintText: "Identification Type (usually CPF)",
              ),
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
