
abstract class LoginStates {}

class InitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates{
  final String uId;
  LoginSuccessState(this.uId);
}
class LoginErrorState extends LoginStates
{
  final String error;

  LoginErrorState(this.error);
}

class LoginGoogleUserLoadingState extends LoginStates{}
class LoginFaceBookUserLoadingState extends LoginStates{}

class LoginGoogleUserSuccessState extends LoginStates{
  final  String uId;
  LoginGoogleUserSuccessState(this.uId);
}

class LoginFaceBookUserSuccessState extends LoginStates{
  final  String uId;
  LoginFaceBookUserSuccessState(this.uId);
}

class CreateGoogleUserSuccessState extends LoginStates{
  final  String uId;
  CreateGoogleUserSuccessState(this.uId);
}
class CreateFaceBookUserSuccessState extends LoginStates{
  final  String uId;
  CreateFaceBookUserSuccessState(this.uId);
}

class CreateGoogleUserErrorState extends LoginStates
{
  final String error;

  CreateGoogleUserErrorState(this.error);
}
class CreateFaceBookUserErrorState extends LoginStates
{
  final String error;

  CreateFaceBookUserErrorState(this.error);
}

class ChangeSuffixIconState extends LoginStates{}
class GetUserLoadingState extends LoginStates{}
class GetUserSuccessState extends LoginStates{}
class GetUserErrorState extends LoginStates{
  final String error;

  GetUserErrorState(this.error);
}
class SetUSerTokenLoadingState extends LoginStates{}
class SetUSerTokenSuccessState extends LoginStates{}
class SetUSerTokenErrorState extends LoginStates{
  final String error;

  SetUSerTokenErrorState(this.error);
}