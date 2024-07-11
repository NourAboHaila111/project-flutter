
import 'package:petopia/model/login_model.dart';

abstract class PetRegisterState{}

class PetRegisterInitialState extends PetRegisterState{}

class PetRegisterLoadingState extends PetRegisterState{}

class PetRegisterSuccessState extends PetRegisterState{
  final PetLoginModel ? RegisterModel;

  PetRegisterSuccessState(this.RegisterModel);

}

class PetRegisterErrorState extends PetRegisterState{
  late String error;
   PetRegisterErrorState(this.error);
}

class PetRegisterChangePasswordVisipilityState extends PetRegisterState{}

class PetRegisterChangeTimeState extends PetRegisterState{}
class PetRegisterChangeDeliveryOptionState extends PetRegisterState {
  final String? deliveryOption;
  PetRegisterChangeDeliveryOptionState(this.deliveryOption);
}