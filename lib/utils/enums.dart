enum ThemeName { darkTheme, lightTheme }

enum PersonalDetailsType {
  challenges,
  activities,
  decisions,
  goalsAndAspirations,
}

enum NavigationType {
  loginWithEmail('loginWithEmail'),
  loginWithPhone('loginWithPhone'),
  forgotPassword('forgotPassword');

  final String value;

  const NavigationType(this.value);
}

enum GenderChange {
  male('Male'),
  female('Female');

  final String value;

  const GenderChange(this.value);
}

enum ReminderType {
  everyDay('EVERY_DAY'),
  specificWeek('SPECIFIC_DAY_OF_THEWEEK'),
  specificMonth('SPECIFIC_DAYS_OF_THE_MONTH'),
  specificYear('SPECIFIC_DAYS_OF_THE_YEAR');

  final String value;

  const ReminderType(this.value);
}

enum HealthIconSelection {
  weightLifting("WEIGHTLIFING"),
  cycling('CYCLING'),
  swimming("SWIMMING"),
  running("RUNNING"),
  pushUp("PUSHUP"),
  exercise("EXERCISE");

  final String value;

  const HealthIconSelection(this.value);
}
