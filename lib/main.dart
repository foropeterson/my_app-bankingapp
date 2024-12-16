import 'package:flutter/material.dart';

void main() {
  runApp(const BankingApp());
}

class BankingApp extends StatelessWidget {
  const BankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const BankingDashboard(),
    );
  }
}

class BankingDashboard extends StatelessWidget {
  const BankingDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsiveness

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Banking App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, peterson foro',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              // Account Balance Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Account Balance'),
                    Text(
                      'KSh 12,345.67',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.blue.shade900),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Recent Transactions
              Text(
                'Recent Transactions',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade200,
                      child: const Icon(Icons.monetization_on),
                    ),
                    title: const Text('Payment to Merchant'),
                    subtitle: Text('Date: ${DateTime.now().toLocal()}'),
                    trailing: const Text('- KSh 50.00'),
                  );
                },
              ),
              const SizedBox(height: 20),
              // Actions Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ActionButton(
                    icon: Icons.send,
                    label: 'Transfer',
                    onPressed: () {
                      // Handle transfer
                    },
                  ),
                  _ActionButton(
                    icon: Icons.receipt_long,
                    label: 'Statement',
                    onPressed: () {
                      // Handle statement
                    },
                  ),
                  _ActionButton(
                    icon: Icons.settings,
                    label: 'Settings',
                    onPressed: () {
                      // Handle settings
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          color: Colors.blue,
          iconSize: 32,
        ),
        Text(label),
      ],
    );
  }
}
