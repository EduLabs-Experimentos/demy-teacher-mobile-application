// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Demy Teachers';

  @override
  String get welcome => 'Welcome';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get signInTitle => 'Sign in';

  @override
  String get signInSubtitle =>
      'Enter your credentials provided by your administrator to continue';

  @override
  String get signInButton => 'Sign in';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get home => 'Home';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';

  @override
  String get homePageTitle => 'Welcome to Demy Teachers';

  @override
  String get homePagePlaceholder => 'Home content coming soon...';

  @override
  String get profilePageTitle => 'My Profile';

  @override
  String get profilePagePlaceholder => 'Profile information coming soon...';

  @override
  String get settingsPageTitle => 'Settings';

  @override
  String get settingsPagePlaceholder => 'Settings options coming soon...';

  @override
  String get registerAttendanceButtonLabel => 'Take Attendance';

  @override
  String get attendanceReportTitle => 'Attendance Report';

  @override
  String get studentsLabel => 'Students';

  @override
  String get saveAttendanceButton => 'Save Attendance';

  @override
  String get attendanceSavedSuccess => 'Attendance saved successfully';

  @override
  String get courseLabel => 'Course';

  @override
  String get startDateLabel => 'Start Date';

  @override
  String get endDateLabel => 'End Date';

  @override
  String get statusPresentAbbr => 'P';

  @override
  String get statusExcusedAbbr => 'E';

  @override
  String get statusAbsentAbbr => 'A';

  @override
  String errorLoadingStudents(String error) {
    return 'Error loading student list: $error';
  }

  @override
  String get viewAttendanceReportButton => 'View Attendance Report';

  @override
  String get teachingScheduleButton => 'Teaching Schedule';

  @override
  String get viewNotificationsButton => 'View Notifications';

  @override
  String get todayScheduleTitle => 'Today Schedule';

  @override
  String get viewAllLink => 'View all >';

  @override
  String get notificationsPageTitle => 'Notifications';

  @override
  String get welcomeNotificationTitle => 'Welcome to Demy for Teachers';

  @override
  String get welcomeNotificationDescription =>
      'You have successfully signed in to the app, start managing your schedules, attendance, and more.';

  @override
  String get teachingScheduleTitle => 'Teaching Schedule';

  @override
  String get teachingRescheduleTitle => 'Teaching Reschedule';

  @override
  String get dayOfWeek => 'Day of Week';

  @override
  String get startTime => 'Start Time';

  @override
  String get endTime => 'End Time';

  @override
  String get course => 'Course';

  @override
  String get campus => 'Campus';

  @override
  String get classroom => 'Classroom';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get confirmReschedule => 'Confirm Reschedule';

  @override
  String get confirmRescheduleMessage =>
      'Are you sure you want to reschedule this class with the selected changes?';

  @override
  String get yesSaveChanges => 'Yes, Save Changes';

  @override
  String get rescheduledSuccessfully => 'Rescheduled successfully!';

  @override
  String get selectDay => 'Select Day';

  @override
  String get monday => 'Monday';

  @override
  String get tuesday => 'Tuesday';

  @override
  String get wednesday => 'Wednesday';

  @override
  String get thursday => 'Thursday';

  @override
  String get friday => 'Friday';

  @override
  String get saturday => 'Saturday';

  @override
  String get sunday => 'Sunday';

  @override
  String errorLoadingSchedule(String error) {
    return 'Error loading schedule: $error';
  }

  @override
  String get noClassesScheduled => 'No classes scheduled for this day.';

  @override
  String get phoneNumberLabel => 'Phone Number';

  @override
  String get resetPasswordButton => 'Reset Password';

  @override
  String get forgotPasswordTitle => 'Forgot Password';

  @override
  String get forgotPasswordDescription =>
      'Enter your email address and we\'ll send you a verification code to reset your password';

  @override
  String get emailHint => 'Enter your email';

  @override
  String get emailInvalid => 'Please enter a valid email';

  @override
  String get sendVerificationCodeButton => 'Send Verification Code';

  @override
  String get verifyResetCodeTitle => 'Enter Verification Code';

  @override
  String get verifyResetCodeDescription =>
      'We sent a code to your email address, enter it to reset your password';

  @override
  String get verificationCodeLabel => 'Verification Code';

  @override
  String get verificationCodeHint => 'Enter code';

  @override
  String get verificationCodeRequired => 'Verification code is required';

  @override
  String get verifyCodeButton => 'Verify Code';

  @override
  String get resetPasswordTitle => 'Reset Password';

  @override
  String get resetPasswordDescription =>
      'Enter your new password and confirm it';

  @override
  String get oldPasswordLabel => 'Current Password';

  @override
  String get oldPasswordHint => 'Enter your current password';

  @override
  String get oldPasswordRequired => 'Current password is required';

  @override
  String get newPasswordLabel => 'New Password';

  @override
  String get newPasswordHint => 'Enter your new password';

  @override
  String get newPasswordRequired => 'New password is required';

  @override
  String get newPasswordTooShort => 'Password must be at least 6 characters';

  @override
  String get confirmPasswordLabel => 'Confirm Password';

  @override
  String get confirmPasswordHint => 'Confirm your new password';

  @override
  String get confirmPasswordRequired => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get submitButton => 'Submit';

  @override
  String get resetPasswordSuccessTitle => 'Password Reset Successful!';

  @override
  String get resetPasswordSuccessMessage =>
      'Your password has been reset successfully. You can now sign in with your new password.';

  @override
  String get goToHomeButton => 'Go to Home';

  @override
  String get termsAndConditions => 'Terms and Conditions';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get signOut => 'Sign Out';

  @override
  String get termsSection1Title => '1. Acceptance of Terms';

  @override
  String get termsSection1Content =>
      'By using the Demy platform, you accept these terms. Demy is an academic management system for academies and educational centers.';

  @override
  String get termsSection2Title => '2. Service Description';

  @override
  String get termsSection2Content => 'Demy offers tools for:';

  @override
  String get termsSection2Item1 => 'Enrollment and student management';

  @override
  String get termsSection2Item2 => 'Schedule and class administration';

  @override
  String get termsSection2Item3 => 'Payments, billing and financial control';

  @override
  String get termsSection2Item4 => 'Reports and academic tracking';

  @override
  String get termsSection2Item5 => 'Communication with students and parents';

  @override
  String get termsSection2Item6 => 'Teacher and staff management';

  @override
  String get termsSection3Title => '3. User Accounts';

  @override
  String get termsSection3Content =>
      'You must create an account with correct information. You are responsible for your password and activities within your account. If there is unauthorized use, you must report it.';

  @override
  String get termsSection4Title => '4. Acceptable Use';

  @override
  String get termsSection4Content =>
      'Demy can only be used for academic purposes. The following is not permitted:';

  @override
  String get termsSection4Item1 => 'Illegal or unauthorized activities';

  @override
  String get termsSection4Item2 => 'Interfering with the platform';

  @override
  String get termsSection4Item3 => 'Attempting to access other accounts';

  @override
  String get termsSection4Item4 => 'Providing false information';

  @override
  String get termsSection4Item5 => 'Infringing intellectual property';

  @override
  String get termsSection5Title => '5. Data and Content';

  @override
  String get termsSection5Content =>
      'The data you enter is yours. You give us permission to process and store it only to provide the service. We protect sensitive information and maintain its confidentiality.';

  @override
  String get termsSection6Title => '6. Billing and Payments';

  @override
  String get termsSection6Content =>
      'The service works through monthly or annual subscription. Renewal is automatic. You can cancel at any time from your control panel.';

  @override
  String get termsSection7Title => '7. Limitation of Liability';

  @override
  String get termsSection7Content =>
      'Demy is offered \"as is\". We do not guarantee that it is free of errors or interruptions. Our liability is limited to the amount paid during the last 12 months.';

  @override
  String get termsSection8Title => '8. Termination';

  @override
  String get termsSection8Content =>
      'We may suspend your access if you violate the terms. If the service ends, your data can be downloaded for 30 days before being deleted.';

  @override
  String get termsSection9Title => '9. Modifications';

  @override
  String get termsSection9Content =>
      'We may update these terms. If there are important changes, we will notify you 30 days in advance. Continuing to use Demy implies accepting the new terms.';

  @override
  String get termsSection10Title => '10. Contact';

  @override
  String get termsSection10Content =>
      'For inquiries:\ncontact.demyteam@gmail.com';

  @override
  String get termsLastUpdated => 'Last updated: December 2025';

  @override
  String get privacySection1Title => '1. Information We Collect';

  @override
  String get privacySection1Content =>
      'We collect data necessary to operate the platform:';

  @override
  String get privacySection1Item1 =>
      'Institution data (name, address, contact, tax information)';

  @override
  String get privacySection1Item2 => 'Administrators (name, email, roles)';

  @override
  String get privacySection1Item3 =>
      'Students (academic data, contact, payment history with authorization)';

  @override
  String get privacySection1Item4 =>
      'Teachers (professional information, schedules, courses)';

  @override
  String get privacySection1Item5 =>
      'Platform usage (activity, preferences, logs)';

  @override
  String get privacySection2Title => '2. Use of Information';

  @override
  String get privacySection2Content => 'We use the data to:';

  @override
  String get privacySection2Item1 => 'Provide and improve services';

  @override
  String get privacySection2Item2 =>
      'Manage enrollments, schedules and payments';

  @override
  String get privacySection2Item3 => 'Generate reports';

  @override
  String get privacySection2Item4 => 'Facilitate communication';

  @override
  String get privacySection2Item5 => 'Maintain system security';

  @override
  String get privacySection2Item6 => 'Comply with legal obligations';

  @override
  String get privacySection3Title => '3. Academic Data Protection';

  @override
  String get privacySection3Content => 'We apply special measures such as:';

  @override
  String get privacySection3Item1 => 'Encryption of sensitive data';

  @override
  String get privacySection3Item2 => 'Access by roles and permissions';

  @override
  String get privacySection3Item3 => 'Periodic audits';

  @override
  String get privacySection3Item4 => 'Secure backups';

  @override
  String get privacySection3Item5 => 'Compliance with educational standards';

  @override
  String get privacySection4Title => '4. Sharing Information';

  @override
  String get privacySection4Content =>
      'We do not sell data. We only share when:';

  @override
  String get privacySection4Item1 => 'Required by educational authorities';

  @override
  String get privacySection4Item2 =>
      'Needed by technical providers under confidentiality';

  @override
  String get privacySection4Item3 => 'The institution authorizes it';

  @override
  String get privacySection4Item4 => 'There is a legal or judicial obligation';

  @override
  String get privacySection5Title => '5. Data Retention';

  @override
  String get privacySection5Item1 => 'Academic: minimum 5 years';

  @override
  String get privacySection5Item2 => 'Billing: 7 years';

  @override
  String get privacySection5Item3 => 'Access logs: 2 years';

  @override
  String get privacySection5Item4 => 'Contact: until deletion is requested';

  @override
  String get privacySection6Title => '6. Your Rights';

  @override
  String get privacySection6Content => 'The institution can:';

  @override
  String get privacySection6Item1 => 'Access and export its data';

  @override
  String get privacySection6Item2 => 'Correct information';

  @override
  String get privacySection6Item3 => 'Request portability';

  @override
  String get privacySection6Item4 => 'Restrict processing';

  @override
  String get privacySection6Item5 => 'Request deletion (according to law)';

  @override
  String get privacySection6Item6 => 'Be notified of security breaches';

  @override
  String get privacySection7Title => '7. International Transfers';

  @override
  String get privacySection7Content =>
      'Data may be processed outside the country under international standards and approved protection clauses.';

  @override
  String get privacySection8Title => '8. Minors';

  @override
  String get privacySection8Content =>
      'We require consent from parents or guardians. Minor data is handled with additional protection and only for educational purposes.';

  @override
  String get privacySection9Title => '9. Policy Changes';

  @override
  String get privacySection9Content =>
      'We will notify important changes 30 days in advance. Minor changes will be published directly.';

  @override
  String get privacySection10Title => '10. Contact and DPO';

  @override
  String get privacySection10Content =>
      'Privacy inquiries: contact.demyteam@gmail.com\n\nData Protection Officer (DPO): dpo@demy.com';

  @override
  String get privacyLastUpdated => 'Last updated: December 2025';

  @override
  String get byUsingDemyYouAccept =>
      'By using Demy for Teachers, you accept the';

  @override
  String get and => 'and the';
}
