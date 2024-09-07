import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.init());

  void onNotificationTap() {
    emit(state.copyWith(notificationToggle: !state.notificationToggle));
    log(state.notificationToggle.toString());
  }
   void onTextMessageTap() {
    emit(state.copyWith(txtMessageToggle: !state.txtMessageToggle));
    log(state.txtMessageToggle.toString());
  }
   void onCustomerCallsTap() {
    emit(state.copyWith(customerCallsToggle: !state.customerCallsToggle));
    log(state.customerCallsToggle.toString());
  }
}

