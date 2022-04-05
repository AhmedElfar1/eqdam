abstract class LayoutStates{}

class LayoutInitialState extends LayoutStates{}

class LayoutBottomNavState extends LayoutStates{}

class HomeSelectedState extends LayoutStates{}

class GetUserLoadingState extends LayoutStates {}

class GetEqdamLoadingState extends LayoutStates {}

class GetUserSuccessState extends LayoutStates {}

class GetEqdamSuccessState extends LayoutStates {}

class LogoutSuccessState extends LayoutStates {}

class GetUserErrorState extends LayoutStates {
  final String error;

  GetUserErrorState(this.error);
}

class GetEqdamErrorState extends LayoutStates {
  final String error;

  GetEqdamErrorState(this.error);
}

class SendMessageSuccessState extends LayoutStates{}

class SendMessageErrorState extends LayoutStates {}

class GetMessageSuccessState extends LayoutStates {}

class GetCustomersSuccessState extends LayoutStates {}

class GetPartnersSuccessState extends LayoutStates {}

class ChangeState extends LayoutStates {}

class SetUSerTokenLoadingState extends LayoutStates {}

class SetUSerTokenSuccessState extends LayoutStates {}

class ScrollSuccess extends LayoutStates {}

class SetUSerTokenErrorState extends LayoutStates
{
  final String error;

  SetUSerTokenErrorState(this.error);
}


