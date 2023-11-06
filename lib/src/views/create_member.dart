import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CreateMemberScreen extends StatefulWidget {
  const CreateMemberScreen({Key? key}) : super(key: key);

  @override
  _CreateMemberScreenState createState() => _CreateMemberScreenState();
}

class _CreateMemberScreenState extends State<CreateMemberScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormBuilderState> _employmentDetailsFormKey =
      GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _contactFormKey =
      GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _compensationFormKey =
      GlobalKey<FormBuilderState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _yearsController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? _selectedTeam;

  TabController? _tabController;

  Widget _buildDropdownField({
    required String name,
    required String labelText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: FormBuilderDropdown(
        onChanged: (value) {
          setState(() {
            _selectedTeam = value;
          });
        },
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
      ),
    );
  }

  final dateController = TextEditingController();
  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;

    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    _yearsController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Member'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Tab>[
            Tab(text: 'Employment Details'),
            Tab(text: 'Contact'),
            Tab(text: 'Compensation and Benefits'),
          ],
          isScrollable: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            FormBuilder(
              key: _employmentDetailsFormKey,
              child: Column(
                children: <Widget>[
                  const CustomTextField(
                    name: 'employeeName',
                    labelText: 'Employee name',
                  ),
                  const CustomTextField(
                    name: 'employeeId',
                    labelText: 'Employee ID',
                  ),
                  const CustomTextField(
                    name: 'jobTitle',
                    labelText: 'Job Title',
                  ),
                  _buildDropdownField(
                    name: 'team',
                    labelText: 'Team',
                  ),
                  const CustomTextField(
                    name: 'reportingManager',
                    labelText: 'Reporting Manager',
                  ),
                  TextFormField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      labelText: 'Date of hire',
                      border: OutlineInputBorder(),
                    ),
                    onTap: () => _selectDate(context),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const CustomTextField(
                    name: 'employmentType',
                    labelText: 'Employment Type',
                  ),
                ],
              ),
            ),
            FormBuilder(
              key: _contactFormKey,
              child: Column(
                children: <Widget>[
                  CustomTextField(
                    name: 'phoneNumber',
                    labelText: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                  ),
                  CustomTextField(
                    name: 'emailAddress',
                    labelText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  const CustomTextField(
                    name: 'address',
                    labelText: 'Address',
                  ),
                  const CustomTextField(
                    name: 'emergencyContactName',
                    labelText: 'Emergency Contact Name',
                  ),
                  const CustomTextField(
                    name: 'emergencyContactRelationship',
                    labelText: 'Emergency Contact Relationship',
                  ),
                  const CustomTextField(
                    name: 'emergencyContactNumber',
                    labelText: 'Emergency Contact Number',
                    keyboardType: TextInputType.phone,
                  ),
                  const CustomTextField(
                    name: 'alternateNumber',
                    labelText: 'Alternate Number',
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
            ),
            FormBuilder(
              key: _compensationFormKey,
              child: const Column(
                children: <Widget>[
                  CustomTextField(
                    name: 'salaryOrPayRate',
                    labelText: 'Salary or Pay Rate',
                  ),
                  CustomTextField(
                    name: 'compensationStructure',
                    labelText: 'Compensation Structure',
                  ),
                  CustomTextField(
                    name: 'benefitsEnrollment',
                    labelText: 'Benefits Enrollment Information',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String name;
  final String labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.name,
    required this.labelText,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: FormBuilderTextField(
        name: name,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        controller: controller,
      ),
    );
  }
}
