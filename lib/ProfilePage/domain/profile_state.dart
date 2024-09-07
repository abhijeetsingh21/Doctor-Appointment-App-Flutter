part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  ProfileState({
    required this.customerCallsToggle,
    required this.notificationToggle,
    required this.txtMessageToggle,
  });
  factory ProfileState.init() {
    return ProfileState(
      customerCallsToggle: false,
      notificationToggle: false,
      txtMessageToggle: false,
    );
  }
  ProfileState copyWith({
    bool? customerCallsToggle,
    bool? notificationToggle,
    bool? txtMessageToggle,
  }) {
    return ProfileState(
      customerCallsToggle: customerCallsToggle ?? this.customerCallsToggle,
      txtMessageToggle: txtMessageToggle ?? this.txtMessageToggle,
      notificationToggle: notificationToggle ?? this.notificationToggle,
    );
  }

  bool notificationToggle;
  bool txtMessageToggle;
  bool customerCallsToggle;
  @override
  List<Object?> get props => [
        notificationToggle,
        txtMessageToggle,
        customerCallsToggle,
      ];
}