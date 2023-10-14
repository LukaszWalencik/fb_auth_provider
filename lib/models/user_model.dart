// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final int point;
  final String rank;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.point,
    required this.rank,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      profileImage,
      point,
      rank,
    ];
  }

  @override
  bool get stringify => true;
}
