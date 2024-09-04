import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:largest_prime/presentation/pages/selection_page.dart';
import '../bloc/largest_prime_bloc.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  void initState() {
    super.initState();
    context.read<LargestPrimeBloc>().add(GetAllEntitiesEvent());
  }

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
        appBar: AppBar(title: Text('Admin')),
        body: BlocBuilder<LargestPrimeBloc, LargestPrimeState>(
          builder: (context, state) {
            if (state is LargestPrimeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is EntitiesLoaded) {
              final reversedEntities = state.entities.reversed.toList();
              return ListView.builder(
                itemCount: reversedEntities.length,
                itemBuilder: (context, index) {
                  final entry = reversedEntities[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Sol Taraf: Girilen Sayilar ve En Buyukk Asal
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 24),
                                  Text(
                                    'Sayılar: ${entry.numbersList}',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'En Büyük Asal: ${entry.largestPrime == 0 ? 'Asal yok' : '${entry.largestPrime}'}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Sag Taraf: ID ve Olusturulma Tarihi
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ID: ${entry.id}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Oluşturulma Tarihi: ${entry.createdAt}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is LargestPrimeError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<LargestPrimeBloc>().add(GetAllEntitiesEvent()),
          child: Icon(Icons.refresh_rounded),
        ),
      ),
    );
  }
}