class Team {
  final String name;
  final int numberOfMembers;
  Team({
    required this.name,
    required this.numberOfMembers,
  });
}

final List<Team> teams = [
  Team(name: 'Product Design', numberOfMembers: 6),
  Team(name: 'Mobile App Development', numberOfMembers: 8),
  Team(name: 'Data Science', numberOfMembers: 5),
  Team(name: 'Quality Assurance', numberOfMembers: 7),
  Team(name: 'UI/UX Design', numberOfMembers: 4),
  Team(name: 'Marketing', numberOfMembers: 9),
  Team(name: 'Backend Development', numberOfMembers: 6),
  Team(name: 'Sales', numberOfMembers: 5),
  Team(name: 'Customer Support', numberOfMembers: 6),
  Team(name: 'Finance', numberOfMembers: 5),
];
