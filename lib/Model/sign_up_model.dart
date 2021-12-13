class SignUpModel{
  int code;
  String message;
  SignUpModel({required this.code,required this.message});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}