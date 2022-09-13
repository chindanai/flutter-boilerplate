import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String createdAt;
  final String updatedAt;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.pure() => const User(
      id: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      createdAt: '',
      updatedAt: '');

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        phoneNumber,
        createdAt,
        updatedAt,
      ];
}
