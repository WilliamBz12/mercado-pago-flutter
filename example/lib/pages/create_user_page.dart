import 'package:flutter/material.dart';
import 'package:mercado_pago_flutter/mercado_pago_flutter.dart';

class CreateUserPage extends StatefulWidget {
  final MercadoPagoCredentials mercadoPagoCredentials;

  CreateUserPage({this.mercadoPagoCredentials});

  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  MercadoPagoCustomerService _customerService;

  final _email$ = TextEditingController();
  final _firstName$ = TextEditingController();
  final _lastName$ = TextEditingController();
  final _identification$ = TextEditingController();
  final _identificationType$ = TextEditingController();

  void _addUser() async {
    final _customer = MercadoPagoCustomerModel(
      email: _email$.text,
      firstName: _firstName$.text,
      lastName: _lastName$.text,
      identification: MercadoPagoIdentificationModel(
        number: _identification$.text,
        type: _identificationType$.text,
      ),
    );

    try {
      final response = await _customerService.create(customer: _customer);
      print(response);
      
    } catch (e) {
      print(e.code);
    }
  }

  @override
  void initState() {
    super.initState();
    _customerService = MercadoPagoCustomerService(
      credentials: widget.mercadoPagoCredentials,
    );
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
              controller: _email$,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: "email"),
            ),
            TextField(
              controller: _firstName$,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: "First Name"),
            ),
        
            TextField(
              controller: _lastName$,
              decoration: InputDecoration(hintText: "Last Name"),
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
              onPressed: _addUser,
              child: Text("Enviar"),
            )
          ],
        ),
      ),
    );
  }
}