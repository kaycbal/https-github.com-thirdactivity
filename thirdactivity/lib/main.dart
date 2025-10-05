import 'package:flutter/material.dart';

void main() {
  runApp(const MassageAtHomeApp());
}

class MassageAtHomeApp extends StatelessWidget {
  const MassageAtHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Massage at Home Service",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.teal.shade50,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

// ---------------- LOGIN PAGE ----------------
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ReservationPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Welcome Back 👋",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),

                    // Email
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) =>
                          value == null || !value.contains("@")
                              ? "Enter a valid email"
                              : null,
                    ),
                    const SizedBox(height: 12),

                    // Password
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? "Password cannot be empty"
                          : null,
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: _login, child: const Text("Login"))),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      child: const Text("Don’t have an account? Register"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- REGISTER PAGE ----------------
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("✅ Registration Successful! Please log in.")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register"), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text("Create Account ✨",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),

                    // Name
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: "Full Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? "Enter your name"
                          : null,
                    ),
                    const SizedBox(height: 12),

                    // Email
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) =>
                          value == null || !value.contains("@")
                              ? "Enter a valid email"
                              : null,
                    ),
                    const SizedBox(height: 12),

                    // Password
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? "Password cannot be empty"
                          : null,
                    ),
                    const SizedBox(height: 12),

                    // Confirm Password
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Confirm Password",
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                      validator: (value) => value != _passwordController.text
                          ? "Passwords do not match"
                          : null,
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: _register,
                            child: const Text("Register"))),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- RESERVATION PAGE ----------------
class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _notesController = TextEditingController();

  bool _subscribe = false;
  bool _addOilMassage = false;
  String _role = "Customer"; // limited roles
  String _paymentMethod = "Cash";
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  List<Map<String, dynamic>> reservations = [];

  // Pickers
  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _pickTime() async {
    final picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) setState(() => _selectedTime = picked);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        reservations.add({
          "username": _usernameController.text,
          "role": _role,
          "payment": _paymentMethod,
          "date": _selectedDate?.toString().split(" ")[0] ?? "Not set",
          "time": _selectedTime?.format(context) ?? "Not set",
          "notes": _notesController.text,
          "oilMassage": _addOilMassage,
          "subscribe": _subscribe,
        });
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ Reservation Submitted!")),
      );

      _formKey.currentState!.reset();
      _usernameController.clear();
      _notesController.clear();
      _subscribe = false;
      _addOilMassage = false;
      _role = "Customer";
      _paymentMethod = "Cash";
      _selectedDate = null;
      _selectedTime = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Massage Reservation"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: "Username",
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? "Enter username"
                            : null,
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        title: const Text("Add Aromatherapy Oil Massage"),
                        value: _addOilMassage,
                        onChanged: (val) =>
                            setState(() => _addOilMassage = val ?? false),
                      ),
                      SwitchListTile(
                        title: const Text("Subscribe to Promos & Updates"),
                        value: _subscribe,
                        onChanged: (val) => setState(() => _subscribe = val),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: _role,
                        items: const [
                          DropdownMenuItem(
                              value: "Customer", child: Text("Customer")),
                          DropdownMenuItem(
                              value: "Admin", child: Text("Admin")),
                        ],
                        onChanged: (value) => setState(() => _role = value!),
                        decoration: const InputDecoration(
                          labelText: "Select Role",
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: _paymentMethod,
                        items: const [
                          DropdownMenuItem(value: "Cash", child: Text("Cash")),
                          DropdownMenuItem(
                              value: "GCash", child: Text("GCash")),
                          DropdownMenuItem(
                              value: "Credit Card", child: Text("Credit Card")),
                        ],
                        onChanged: (value) =>
                            setState(() => _paymentMethod = value!),
                        decoration: const InputDecoration(
                          labelText: "Payment Method",
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _pickDate,
                              child: Text(_selectedDate == null
                                  ? "Pick Date"
                                  : "Date: ${_selectedDate!.toLocal()}"
                                      .split(" ")[0]),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _pickTime,
                              child: Text(_selectedTime == null
                                  ? "Pick Time"
                                  : "Time: ${_selectedTime!.format(context)}"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _notesController,
                        decoration: const InputDecoration(
                          labelText: "Special Requests / Notes",
                          prefixIcon: Icon(Icons.note),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          child: const Text("Submit Reservation"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "📋 Submitted Reservations",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            for (var res in reservations)
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: const Icon(Icons.spa, color: Colors.teal),
                  title: Text("${res['username']} - ${res['role']}"),
                  subtitle: Text(
                    "Payment: ${res['payment']}\n"
                    "Date: ${res['date']} 🕒 Time: ${res['time']}\n"
                    "Oil Massage: ${res['oilMassage'] ? 'Yes' : 'No'}\n"
                    "Subscribed: ${res['subscribe'] ? 'Yes' : 'No'}\n"
                    "Notes: ${res['notes']}",
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
