// ignore_for_file: unused_import

import 'package:chessgame/features/Authentication/presentation/authdataDomain.dart';
import 'package:chessgame/features/Authentication/presentation/error_display.dart';
import 'package:chessgame/features/Authentication/service/authentication_service_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    await ref.read(authenticationServiceProvider.notifier).signIn(_usernameController.text , _passwordController.text);
    ref.read(errorDisplayProvider.notifier).clearError();
    debugPrint('Sign in: ${_usernameController.text}');
    }
    catch(e){
    ref.read(errorDisplayProvider.notifier).addError('$e');
    }
   
  }

  Future<void> _handleCreateAccount() async {
    try{
    await ref.read(authenticationServiceProvider.notifier).createAccount(_usernameController.text , _passwordController.text);
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.grid_view_rounded,
                  size: 64,
                  color: colorScheme.primary,
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
    );
  }
}