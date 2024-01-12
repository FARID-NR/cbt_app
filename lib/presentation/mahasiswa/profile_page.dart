import 'package:cbt_app/bloc/logout/logout_bloc.dart';
import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/presentation/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasource/login/login_local_datasource.dart';

class ProfilePageMhs extends StatefulWidget {
  const ProfilePageMhs({Key? key}) : super(key: key);

  @override
  State<ProfilePageMhs> createState() => _ProfilePageMhsState();
}

class _ProfilePageMhsState extends State<ProfilePageMhs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorName.light,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocProvider(
                create: (context) => LogoutBloc(),
                child: BlocConsumer<LogoutBloc, LogoutState>(
                  listener: (context, state) {
                    state.maybeWhen(
                        orElse: () {},
                        loaded: () {
                          LoginLocalDatasource().removeLoginData();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const AuthPage();
                            }),
                          );
                        },
                        error: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('logout error')));
                        }
                        );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(orElse: () {
                      return ElevatedButton(
                        onPressed: () {
                          // Aksi logout
                          context.read<LogoutBloc>().add(
                                const LogoutEvent.logout(),
                              );
                        },
                        child: const Text('Logout'),
                      );
                    }, loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
