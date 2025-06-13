import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uiwidgets/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class AddNewPersonScreen extends StatefulWidget {
  const AddNewPersonScreen({super.key});

  @override
  State<AddNewPersonScreen> createState() => _AddNewPersonScreenState();
}

class _AddNewPersonScreenState extends State<AddNewPersonScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _notesController = TextEditingController();

  late Box _hiveBox;
  String? _lastSavedName;

  @override
  void initState() {
    super.initState();
    _hiveBox = Hive.box("settings");

    _loadLastSavedName();
  }

  void _loadLastSavedName() {
    setState(() {
      _lastSavedName = _hiveBox.get("lastUserName");
    });
  }

  Future<void> _savePersonToHive() async {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final age = int.tryParse(_ageController.text.trim()) ?? 0;
    final email = _emailController.text.trim();
    final notes = _notesController.text.trim();

    final personMap = {
      "firstName": firstName,
      "lastName": lastName,
      "age": age,
      "email": email,
      "notes": notes,
    };

    final persons =
        _hiveBox.get("persons", defaultValue: <Map>[])?.cast<Map>() ?? [];
    persons.add(personMap);
    await _hiveBox.put("persons", persons);

    await _hiveBox.put("lastUserName", "$firstName $lastName");

    _loadLastSavedName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                "Add a new personel",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              if (_lastSavedName != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Last saved person: $_lastSavedName",
                    style: const TextStyle(color: Colors.amber, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 20),
              _buildTextField("Name", _firstNameController),
              _buildTextField("Surname", _lastNameController),
              _buildTextField("Age", _ageController,
                  keyboardType: TextInputType.number),
              _buildTextField("E-mail", _emailController,
                  keyboardType: TextInputType.emailAddress),
              _buildTextField("Additional information", _notesController,
                  maxLines: 3),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _savePersonToHive();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Personnel successfully added to Hive')),
                    );

                    _formKey.currentState!.reset();

                    _firstNameController.clear();
                    _lastNameController.clear();

                    _ageController.clear();
                    _emailController.clear();
                    _notesController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text("Add",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '$label field cannot be left blanks';
          }
          return null;
        },
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _notesController.dispose();
    super.dispose();
  }
}
