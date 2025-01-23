import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Policies extends StatefulWidget {
  const Policies({super.key});

  @override
  State<Policies> createState() => _PoliciesState();
}

class _PoliciesState extends State<Policies> {
  String content = '';

  @override
  void initState(){
    super.initState();
    loadFileContent();
  }

  Future<void> loadFileContent() async{
    final String fileContent = await rootBundle.loadString('assets/Text/policies_privacity.txt');
    setState(() {
      content = fileContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Politicas de privacidad'),),
      body: content.isEmpty? const Center(child: CircularProgressIndicator(),)
      :  Padding(padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Text(content,
        style: const TextStyle(fontSize: 16),),
      ),),
      
    );
  }
}