import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
          ),
          body: Column(
            children: [MyCustomForm()],
          )),
    );
  }
}

String parin = 'init';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  //String parin = 'init';
  void parinnaja(value) {
    setState(() {
      parin = value;
    });
  }

  void parinkuynoy(value) {
    setState(() {
      if (value == null || value.isEmpty || value.contains('@')) {
        parin = 'ture';
      } else {
        parin = 'sud kuy';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            // The validator receives the text that the user has entered.
            // validator: (value) {
            //   if (value == null || value.isEmpty || value.contains('@')) {
            //     return '';
            //   }
            //   return null;
            // },
            onChanged: (value) {
              parinkuynoy(value);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   // ScaffoldMessenger.of(context)
                //   //     .showSnackBar(SnackBar(content: Text('Processing Data')));
                //   return parinnaja(
                //       _formKey.currentState!.validate().toString());
                // }
                return parinnaja(_formKey.currentState!.validate().toString());
              },
              child: Text('$parin'),
            ),
          ),
          //nongnogn('$parin'),
          showkuyparin()
        ],
      ),
    );
  }
}

//-----------------------------------------------------------------------------------

class nongnogn extends StatefulWidget {
  //nongnogn({Key? key}) : super(key: key);
  String para;
  nongnogn(this.para);

  @override
  _nongnognState createState() => _nongnognState();
}

class _nongnognState extends State<nongnogn> {
  @override
  Widget build(BuildContext context) {
    parin = widget.para;
    return Container(
      child: Text('${widget.para}'),
    );
  }
}

//-----------------------------------------------------------------------------------

class showkuyparin extends StatefulWidget {
  showkuyparin({Key? key}) : super(key: key);

  @override
  _showkuyparinState createState() => _showkuyparinState();
}

class _showkuyparinState extends State<showkuyparin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.pink,
      child: Text(parin),
    );
  }
}
