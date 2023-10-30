// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Member {
  final String name;
  final String team;
  final String role;
  final int years;
  final String phone;
  final String email;

  Member({
    required this.name,
    required this.team,
    required this.role,
    required this.years,
    required this.phone,
    required this.email,
  });
}

final List<Member> members = [];

class MemberAddScreen extends StatefulWidget {
  const MemberAddScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MemberAddScreenState createState() => _MemberAddScreenState();
}

class _MemberAddScreenState extends State<MemberAddScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _yearsController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? _selectedTeam;

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    _yearsController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Member'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _buildTextField(
                name: 'name',
                labelText: 'Name',
                controller: _nameController,
              ),
              _buildDropdownField(
                name: 'team',
                labelText: 'Team',
              ),
              _buildTextField(
                name: 'role',
                labelText: 'Role',
                controller: _roleController,
              ),
              _buildTextField(
                name: 'years',
                labelText: 'Years of Experience',
                controller: _yearsController,
                keyboardType: TextInputType.number,
              ),
              _buildTextField(
                name: 'phone',
                labelText: 'Phone',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),
              _buildTextField(
                name: 'email',
                labelText: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final formData = _formKey.currentState!.value;

                    // final newMember = Member(
                    //   name: formData['name'],
                    //   team: _selectedTeam ?? '',
                    //   role: formData['role'],
                    //   years: int.tryParse(formData['years'].toString()) ?? 0,
                    //   phone: formData['phone'],
                    //   email: formData['email'],
                    // );

                    // members.add(newMember);

                    _nameController.clear();
                    _roleController.clear();
                    _yearsController.clear();
                    _phoneController.clear();
                    _emailController.clear();

                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String name,
    required String labelText,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: FormBuilderTextField(
        name: name,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
        // validator: FormBuilderValidators.required(context),
        keyboardType: keyboardType,
        controller: controller,
      ),
    );
  }

  Widget _buildDropdownField({
    required String name,
    required String labelText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: FormBuilderDropdown(
        name: name,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
        items: [
          'Engineering',
          'UI/UX Design',
          'Finance',
          'Marketing',
          'Sales',
          'Human Resource'
        ]
            .map((team) => DropdownMenuItem(
                  value: team,
                  child: Text(team),
                ))
            .toList(),
        // validator: FormBuilderValidators.required(context),
        onChanged: (value) {
          setState(() {
            _selectedTeam = value;
          });
        },
      ),
    );
  }
}
