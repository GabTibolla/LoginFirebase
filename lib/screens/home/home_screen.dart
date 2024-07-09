import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_barber/blocs/sign_in_bloc/sign_in_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore with Bloc'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(const SignOutRequired());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: const Text("You are gay?"),
      ),
    );
  }
}
