class Users{
  final String? usrId;
  final String usrName;
  final String usrPass;
  final String? usrNamePerson;
  final String? usrEmail;

  Users({this.usrId,  required this.usrName ,required this.usrPass, this.usrEmail, this.usrNamePerson});

   factory Users.fromJson(Map<String, dynamic> json)=>Users(
    usrId: json['usrId'],
    usrName: json['usrName'],
    usrPass: json['usrPass'],
    usrEmail: json['usrEmail'],
    usrNamePerson: json['usrNamePerson']
  );

  Map<String, dynamic> toMap(){
    return{
      'usrId': usrId,
      'usrName': usrName,
      'usrPass': usrPass,
      'usrEmail': usrEmail,
      'usrNamePerson': usrNamePerson
    };
  }
}
