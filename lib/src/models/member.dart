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

final List<Member> members = [
  Member(
    name: 'Alice Johnson',
    role: 'Software Engineer',
    years: 3,
    team: 'Development Team A',
    phone: '+1 (555) 123-4567',
    email: 'alice@example.com',
  ),
  Member(
    name: 'Bob Smith',
    role: 'Frontend Developer',
    years: 2,
    team: 'UI/UX Team',
    phone: '+1 (555) 987-6543',
    email: 'bob@example.com',
  ),
  Member(
    name: 'Catherine Brown',
    role: 'Data Scientist',
    years: 5,
    team: 'Data Science Team',
    phone: '+1 (555) 789-0123',
    email: 'catherine@example.com',
  ),
  Member(
    name: 'David Wilson',
    role: 'Mobile App Developer',
    years: 4,
    team: 'Mobile App Team',
    phone: '+1 (555) 456-7890',
    email: 'david@example.com',
  ),
  Member(
    name: 'Eva Martinez',
    role: 'Product Manager',
    years: 6,
    team: 'Product Management Team',
    phone: '+1 (555) 234-5678',
    email: 'eva@example.com',
  ),
  Member(
    name: 'Franklin Turner',
    role: 'QA Tester',
    years: 3,
    team: 'Quality Assurance Team',
    phone: '+1 (555) 345-6789',
    email: 'franklin@example.com',
  ),
  Member(
    name: 'Grace Taylor',
    role: 'Graphic Designer',
    years: 2,
    team: 'Design Team',
    phone: '+1 (555) 456-7891',
    email: 'grace@example.com',
  ),
  Member(
    name: 'Henry Davis',
    role: 'Database Administrator',
    years: 4,
    team: 'Database Team',
    phone: '+1 (555) 567-8912',
    email: 'henry@example.com',
  ),
  Member(
    name: 'Ivy White',
    role: 'HR Specialist',
    years: 3,
    team: 'HR Team',
    phone: '+1 (555) 678-9123',
    email: 'ivy@example.com',
  ),
  Member(
    name: 'Jack Harris',
    role: 'Network Engineer',
    years: 5,
    team: 'Network Team',
    phone: '+1 (555) 789-1234',
    email: 'jack@example.com',
  ),
  Member(
    name: 'Katherine Clark',
    role: 'Marketing Coordinator',
    years: 2,
    team: 'Marketing Team',
    phone: '+1 (555) 891-2345',
    email: 'katherine@example.com',
  ),
];
