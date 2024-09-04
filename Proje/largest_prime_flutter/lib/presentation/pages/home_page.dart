import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:largest_prime/presentation/pages/selection_page.dart';
import '../bloc/largest_prime_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String? _errorMessage;
  String? _inputText;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SelectionPage()),
              (route) => false,
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('En Büyük Asalı Bul')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Sayıları virgüllerle ayrılmış şekilde giriniz.',
                  errorText: _errorMessage,
                ),
                onChanged: (value) {
                  setState(() {
                    _errorMessage = _validateInput(value);
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: _errorMessage == null ? () {
                final numbersList = _controller.text.split(',')
                    .map((e) => int.tryParse(e.trim()))
                    .whereType<int>()
                    .toList();
                if (numbersList.isNotEmpty) {
                  context.read<LargestPrimeBloc>().add(CreateEntityEvent(numbersList));
                  setState(() {
                    _inputText = _controller.text;
                    _controller.clear();
                  });
                } else {
                  setState(() {
                    _errorMessage = 'Geçerli sayılar girin.';
                  });
                }
              } : null,
              child: Text('Asalı Bul'),
            ),
            BlocBuilder<LargestPrimeBloc, LargestPrimeState>(
              builder: (context, state) {
                if (state is LargestPrimeLoading) {
                  return CircularProgressIndicator();
                } else if (state is EntityCreated) {
                  final displayText = state.entity == 0 ? 'Asal yok' : 'En büyük asal: ${state.entity}';
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayText,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Girilen sayılar: ${_inputText ?? ''}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  );
                } else if (state is LargestPrimeError) {
                  return Text('Error: ${state.message}');
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  String? _validateInput(String value) {
    if (value.trim().isEmpty) {
      return 'Boş giriş kabul edilmez.';
    }

    final parts = value.split(',');
    for (final part in parts) {
      final number = int.tryParse(part.trim());
      if (number == null) {
        return 'Geçersiz sayı: "$part".';
      }
    }

    return null;
  }
}
