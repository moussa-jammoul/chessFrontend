// ignore_for_file: prefer_function_declarations_over_variables, unused_import

import 'package:chessgame/core/loadingOverlay/loadingOverlayManagment.dart';
import 'package:chessgame/features/Authentication/presentation/authdataDomain.dart';
import 'package:chessgame/features/Authentication/presentation/error_display.dart';
import 'package:chessgame/features/Authentication/service/authentication_service_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class Loginpage extends ConsumerStatefulWidget {
  const Loginpage({super.key});

  @override
  ConsumerState<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends ConsumerState<Loginpage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    try{

    Future<void> Function() f = () => ref.read(authenticationServiceProvider.notifier).signIn(
      _usernameController.text,
      _passwordController.text,
    );

    await ref.read(loadingOverlayProvider.notifier).passAfunctionToshowLoading(f, context);
    ref.read(errorDisplayProvider.notifier).clearError();
    debugPrint('Sign in: ${_usernameController.text}');
    }
    catch(e){
    ref.read(errorDisplayProvider.notifier).addError('$e');
    }
   
  }

  Future<void> _handleCreateAccount() async {
    try{
       Future<void> Function() f = () => ref.read(authenticationServiceProvider.notifier).createAccount(
      _usernameController.text,
      _passwordController.text,
    );
    await ref.read(loadingOverlayProvider.notifier).passAfunctionToshowLoading(f, context);
    ref.read(errorDisplayProvider.notifier).clearError();
    debugPrint('Sign in: ${_usernameController.text}');
    }
    catch(e){
    ref.read(errorDisplayProvider.notifier).addError('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final err = ref.watch(errorDisplayProvider);
   
    return Scaffold(
      body: 
      Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
  colorFilter: const ColorFilter.matrix(<double>[ // color filter to make the lottie between black-white
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0,      0,      0,      1, 0,
  ]),
  child:Lottie.asset(
  'assets/lotties/Starrybackground.json',
  fit: BoxFit.contain,
  repeat: true,      
  animate: true,       
),
),
      Positioned.fill(child: Container(color: const Color.fromARGB(62, 0, 0, 0),)),
      
      SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Image.asset(
                  'assets/images/chess-chesscom.png',
                   width: 70,
                   height: 70,
                  
                ),
                const SizedBox(height: 12),
                Text(
                  'Chess',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                ),
                const SizedBox(height: 32),

                // Username field
                TextField(
                  controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 16),

                // Password field
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _handleSignIn(),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10,),

                err == null ? SizedBox.shrink() : Text(
                  err,
                  style: TextStyle(
                    color: Colors.red
                  ),
                  ),

                const SizedBox(height: 26),

                // Sign in button
                ElevatedButton(
                  onPressed: _handleSignIn,
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 12),

                // Create account button
                OutlinedButton(
                  onPressed: _handleCreateAccount,
                  child: const Text('Create Account'),
                ),
              ],
            ),
          ),
        ),
      ),
        ]
      )
    );
  }
}