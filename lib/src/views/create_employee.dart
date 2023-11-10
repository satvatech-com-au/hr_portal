import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hr_app/src/widgets/custom_textfield.dart';

class CreateEmployeeScreen extends StatefulWidget {
  const CreateEmployeeScreen({Key? key}) : super(key: key);

  @override
  _CreateEmployeeScreenState createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormBuilderState> _employmentDetailsFormKey =
      GlobalKey<FormBuilderState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _yearsController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? _selectedTeam;

  TabController? _tabController;

  final _teamsList = [
    'Engineering',
    'UI/UX Design',
    'Finance',
    'Marketing',
    'Sales',
    'Human Resource'
  ];

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
        title: const Text('Add New Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
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
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: FormBuilderDropdown(
                  onChanged: (value) {
                    setState(() {
                      _selectedTeam = value;
                    });
                  },
                  name: 'team',
                  decoration: const InputDecoration(
                    labelText: 'Team',
                    border: OutlineInputBorder(),
                  ),
                  items: _teamsList
                      .map((team) => DropdownMenuItem(
                            value: team,
                            child: Text(team),
                          ))
                      .toList(),
                ),
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
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Send link'))
            ],
          ),
        ),
      ),
    );
  }
}
