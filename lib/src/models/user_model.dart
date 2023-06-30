import 'dart:convert';

class UserModel {
  int? id;
  String? firstName;
  String? email;
  List<String>? sexualOrientation;
  bool? showOrientation;
  String? gender;
  bool? showGender;
  DateTime? birthDay;
  List<String>? interests;
  String? lookingFor;
  String? interestedInSeeing;


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
      this.interestedInSeeing
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    email = json['email'];
    sexualOrientation = jsonDecode(json['sexualOrientation']);
    showOrientation = json['showOrientation'];
    gender = json['gender'];
    showGender = json['showGender'];
    birthDay = json["birthDay"];
    interests = json["interests"];
    lookingFor = json["lookingFor"];
    interestedInSeeing = jsonDecode(json["interestedInSeeing"]);
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
      "interestedInSeeing":  interestedInSeeing 
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
