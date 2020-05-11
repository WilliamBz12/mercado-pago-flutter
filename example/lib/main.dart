import 'package:flutter/material.dart';
import 'package:mercado_pago_flutter/mercado_pago_flutter.dart';

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


  Future<String> createAnCustomer() async {
    final customerService = MercadoPagoCustomerService(
      credentials: _myCredentials,
    );

    final customerId = await customerService.create(
      customer: MercadoPagoCustomerModel(
        email: "ana@gmail.com",
        firstName: "will",
        lastName: "santos",
        identification: MercadoPagoIdentificationModel(
          number: "10205236030",
          type: "CPF",
        ),
      ),
    );

    return customerId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: createAnCustomer,
          child: Text("Criar cliente"),
        ),
      ),
    );
  }
}
