import 'dart:convert';

class UserModel {
  int? id;
  String? firstName;
  String? email;
  List<dynamic>? sexualOrientation;
  bool? showOrientation;
  String? gender;
  bool? showGender;
  DateTime? birthDay;
  List<dynamic>? interests;
  String? lookingFor;
  String? interestedInSeeing;
  String? bio;


  UserModel(
      {this.id,
      this.firstName,
      this.email,
      this.sexualOrientation,
      this.showOrientation,
      this.gender,
      this.showGender,
      this.birthDay,
      this.interests,
      this.lookingFor,
      this.interestedInSeeing,
      this.bio
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    email = json['email'];
    sexualOrientation = json['sexualOrientation'];
    showOrientation = json['showOrientation'];
    gender = json['gender'];
    showGender = json['showGender'];
    birthDay = DateTime.parse(json["birthDay"]);
    interests = json["interests"];
    lookingFor = json["lookingFor"];
    interestedInSeeing = json["interestedInSeeing"];
    bio = json["bio"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "email": email,
      "sexualOrientation": sexualOrientation,
      "showOrientation": showOrientation,
      "gender":  gender,
      "showGender": showGender,
      "birthDay": birthDay!.toIso8601String(),
      "interests": interests,
      "lookingFor": lookingFor,
      "interestedInSeeing":  interestedInSeeing,
      "bio": bio 
    };
  }
 
 @override
  String toString() {
    return 'UserModel{id: $id, firstName: $firstName, email: $email, '
        'sexualOrientation: $sexualOrientation, showOrientation: $showOrientation, '
        'gender: $gender, showGender: $showGender, birthDay: $birthDay, '
        'interests: $interests, lookingFor: $lookingFor, '
        'interestedInSeeing: $interestedInSeeing}';
  }
}
