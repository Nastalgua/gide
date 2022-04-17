import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String fullName;
  final String username;

  const User({
    required this.id, 
    required this.fullName, 
    required this.username, 
  });

  @override
  List<Object?> get props => [id, fullName, username];

  // static List<User> users = [User(id: "0", name: "Matthew"), User(id: "1", name: "Sam")];
}
