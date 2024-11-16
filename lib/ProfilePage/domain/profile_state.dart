part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  bool notificationToggle;
  bool txtMessageToggle;
  bool customerCallsToggle;
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

  @override
  List<Object?> get props => [
        notificationToggle,
        txtMessageToggle,
        customerCallsToggle,
      ];
}
