import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDestinationScreen extends StatefulWidget {
  @override
  _AddDestinationScreenState createState() => _AddDestinationScreenState();
}

class _AddDestinationScreenState extends State<AddDestinationScreen> {
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _latController = TextEditingController();
  final _lonController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _saveDestination() async {
    if (_cityController.text.isEmpty || _countryController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Ciudad y país son obligatorios';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      
      await FirebaseFirestore.instance.collection('destinations').add({
        'userId': userId,
        'city': _cityController.text.trim(),
        'country': _countryController.text.trim(),
        'latitude': _latController.text.isNotEmpty ? _latController.text.trim() : '',
        'longitude': _lonController.text.isNotEmpty ? _lonController.text.trim() : '',
        'createdAt': FieldValue.serverTimestamp(),
      });

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Destino guardado correctamente')),
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Error al guardar el destino';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar destino')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Información del destino',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'Ciudad *',
                  hintText: 'Ej: Quito',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _countryController,
                decoration: InputDecoration(
                  labelText: 'País *',
                  hintText: 'Ej: Ecuador',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _latController,
                decoration: InputDecoration(
                  labelText: 'Latitud (opcional)',
                  hintText: 'Ej: -0.1807',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _lonController,
                decoration: InputDecoration(
                  labelText: 'Longitud (opcional)',
                  hintText: 'Ej: -78.4678',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _saveDestination,
                  child: _isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Guardar destino', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cityController.dispose();
    _countryController.dispose();
    _latController.dispose();
    _lonController.dispose();
    super.dispose();
  }
}
