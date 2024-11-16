import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.init());

  void onNotificationTap(val) {
    emit(state.copyWith(notificationToggle: val));
    log(state.notificationToggle.toString());
  }
   void onTextMessageTap(val) {
    emit(state.copyWith(txtMessageToggle: val));
    log(state.txtMessageToggle.toString());
  }
   void onCustomerCallsTap(val) {
    emit(state.copyWith(customerCallsToggle: val));
    log(state.customerCallsToggle.toString());
  }
}

