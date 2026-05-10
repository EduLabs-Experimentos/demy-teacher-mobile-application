import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Demy Teachers'**
  String get appTitle;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signInTitle;

  /// No description provided for @signInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your credentials provided by your administrator to continue'**
  String get signInSubtitle;

  /// No description provided for @signInButton.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signInButton;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @homePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Demy Teachers'**
  String get homePageTitle;

  /// No description provided for @homePagePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Home content coming soon...'**
  String get homePagePlaceholder;

  /// No description provided for @profilePageTitle.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get profilePageTitle;

  /// No description provided for @profilePagePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Profile information coming soon...'**
  String get profilePagePlaceholder;

  /// No description provided for @settingsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsPageTitle;

  /// No description provided for @settingsPagePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Settings options coming soon...'**
  String get settingsPagePlaceholder;

  /// Label for attendance registration button
  ///
  /// In en, this message translates to:
  /// **'Take Attendance'**
  String get registerAttendanceButtonLabel;

  /// No description provided for @attendanceReportTitle.
  ///
  /// In en, this message translates to:
  /// **'Attendance Report'**
  String get attendanceReportTitle;

  /// No description provided for @studentsLabel.
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get studentsLabel;

  /// No description provided for @saveAttendanceButton.
  ///
  /// In en, this message translates to:
  /// **'Save Attendance'**
  String get saveAttendanceButton;

  /// No description provided for @attendanceSavedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Attendance saved successfully'**
  String get attendanceSavedSuccess;

  /// No description provided for @courseLabel.
  ///
  /// In en, this message translates to:
  /// **'Course'**
  String get courseLabel;

  /// No description provided for @startDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDateLabel;

  /// No description provided for @endDateLabel.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDateLabel;

  /// No description provided for @statusPresentAbbr.
  ///
  /// In en, this message translates to:
  /// **'P'**
  String get statusPresentAbbr;

  /// No description provided for @statusExcusedAbbr.
  ///
  /// In en, this message translates to:
  /// **'E'**
  String get statusExcusedAbbr;

  /// No description provided for @statusAbsentAbbr.
  ///
  /// In en, this message translates to:
  /// **'A'**
  String get statusAbsentAbbr;

  /// No description provided for @errorLoadingStudents.
  ///
  /// In en, this message translates to:
  /// **'Error loading student list: {error}'**
  String errorLoadingStudents(String error);

  /// No description provided for @viewAttendanceReportButton.
  ///
  /// In en, this message translates to:
  /// **'View Attendance Report'**
  String get viewAttendanceReportButton;

  /// No description provided for @teachingScheduleButton.
  ///
  /// In en, this message translates to:
  /// **'Teaching Schedule'**
  String get teachingScheduleButton;

  /// No description provided for @viewNotificationsButton.
  ///
  /// In en, this message translates to:
  /// **'View Notifications'**
  String get viewNotificationsButton;

  /// No description provided for @todayScheduleTitle.
  ///
  /// In en, this message translates to:
  /// **'Today Schedule'**
  String get todayScheduleTitle;

  /// No description provided for @viewAllLink.
  ///
  /// In en, this message translates to:
  /// **'View all >'**
  String get viewAllLink;

  /// No description provided for @notificationsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsPageTitle;

  /// No description provided for @welcomeNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Demy for Teachers'**
  String get welcomeNotificationTitle;

  /// No description provided for @welcomeNotificationDescription.
  ///
  /// In en, this message translates to:
  /// **'You have successfully signed in to the app, start managing your schedules, attendance, and more.'**
  String get welcomeNotificationDescription;

  /// No description provided for @teachingScheduleTitle.
  ///
  /// In en, this message translates to:
  /// **'Teaching Schedule'**
  String get teachingScheduleTitle;

  /// No description provided for @teachingRescheduleTitle.
  ///
  /// In en, this message translates to:
  /// **'Teaching Reschedule'**
  String get teachingRescheduleTitle;

  /// No description provided for @dayOfWeek.
  ///
  /// In en, this message translates to:
  /// **'Day of Week'**
  String get dayOfWeek;

  /// No description provided for @startTime.
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get startTime;

  /// No description provided for @endTime.
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get endTime;

  /// No description provided for @course.
  ///
  /// In en, this message translates to:
  /// **'Course'**
  String get course;

  /// No description provided for @campus.
  ///
  /// In en, this message translates to:
  /// **'Campus'**
  String get campus;

  /// No description provided for @classroom.
  ///
  /// In en, this message translates to:
  /// **'Classroom'**
  String get classroom;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @confirmReschedule.
  ///
  /// In en, this message translates to:
  /// **'Confirm Reschedule'**
  String get confirmReschedule;

  /// No description provided for @confirmRescheduleMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reschedule this class with the selected changes?'**
  String get confirmRescheduleMessage;

  /// No description provided for @yesSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Yes, Save Changes'**
  String get yesSaveChanges;

  /// No description provided for @rescheduledSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Rescheduled successfully!'**
  String get rescheduledSuccessfully;

  /// No description provided for @selectDay.
  ///
  /// In en, this message translates to:
  /// **'Select Day'**
  String get selectDay;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @errorLoadingSchedule.
  ///
  /// In en, this message translates to:
  /// **'Error loading schedule: {error}'**
  String errorLoadingSchedule(String error);

  /// No description provided for @noClassesScheduled.
  ///
  /// In en, this message translates to:
  /// **'No classes scheduled for this day.'**
  String get noClassesScheduled;

  /// No description provided for @phoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumberLabel;

  /// No description provided for @resetPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordButton;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address and we\'ll send you a verification code to reset your password'**
  String get forgotPasswordDescription;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailHint;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get emailInvalid;

  /// No description provided for @sendVerificationCodeButton.
  ///
  /// In en, this message translates to:
  /// **'Send Verification Code'**
  String get sendVerificationCodeButton;

  /// No description provided for @verifyResetCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter Verification Code'**
  String get verifyResetCodeTitle;

  /// No description provided for @verifyResetCodeDescription.
  ///
  /// In en, this message translates to:
  /// **'We sent a code to your email address, enter it to reset your password'**
  String get verifyResetCodeDescription;

  /// No description provided for @verificationCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verificationCodeLabel;

  /// No description provided for @verificationCodeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter code'**
  String get verificationCodeHint;

  /// No description provided for @verificationCodeRequired.
  ///
  /// In en, this message translates to:
  /// **'Verification code is required'**
  String get verificationCodeRequired;

  /// No description provided for @verifyCodeButton.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get verifyCodeButton;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordTitle;

  /// No description provided for @resetPasswordDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password and confirm it'**
  String get resetPasswordDescription;

  /// No description provided for @oldPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get oldPasswordLabel;

  /// No description provided for @oldPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your current password'**
  String get oldPasswordHint;

  /// No description provided for @oldPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Current password is required'**
  String get oldPasswordRequired;

  /// No description provided for @newPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPasswordLabel;

  /// No description provided for @newPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password'**
  String get newPasswordHint;

  /// No description provided for @newPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'New password is required'**
  String get newPasswordRequired;

  /// No description provided for @newPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get newPasswordTooShort;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordLabel;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm your new password'**
  String get confirmPasswordHint;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get confirmPasswordRequired;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @submitButton.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submitButton;

  /// No description provided for @resetPasswordSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Password Reset Successful!'**
  String get resetPasswordSuccessTitle;

  /// No description provided for @resetPasswordSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your password has been reset successfully. You can now sign in with your new password.'**
  String get resetPasswordSuccessMessage;

  /// No description provided for @goToHomeButton.
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get goToHomeButton;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsAndConditions;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @termsSection1Title.
  ///
  /// In en, this message translates to:
  /// **'1. Acceptance of Terms'**
  String get termsSection1Title;

  /// No description provided for @termsSection1Content.
  ///
  /// In en, this message translates to:
  /// **'By using the Demy platform, you accept these terms. Demy is an academic management system for academies and educational centers.'**
  String get termsSection1Content;

  /// No description provided for @termsSection2Title.
  ///
  /// In en, this message translates to:
  /// **'2. Service Description'**
  String get termsSection2Title;

  /// No description provided for @termsSection2Content.
  ///
  /// In en, this message translates to:
  /// **'Demy offers tools for:'**
  String get termsSection2Content;

  /// No description provided for @termsSection2Item1.
  ///
  /// In en, this message translates to:
  /// **'Enrollment and student management'**
  String get termsSection2Item1;

  /// No description provided for @termsSection2Item2.
  ///
  /// In en, this message translates to:
  /// **'Schedule and class administration'**
  String get termsSection2Item2;

  /// No description provided for @termsSection2Item3.
  ///
  /// In en, this message translates to:
  /// **'Payments, billing and financial control'**
  String get termsSection2Item3;

  /// No description provided for @termsSection2Item4.
  ///
  /// In en, this message translates to:
  /// **'Reports and academic tracking'**
  String get termsSection2Item4;

  /// No description provided for @termsSection2Item5.
  ///
  /// In en, this message translates to:
  /// **'Communication with students and parents'**
  String get termsSection2Item5;

  /// No description provided for @termsSection2Item6.
  ///
  /// In en, this message translates to:
  /// **'Teacher and staff management'**
  String get termsSection2Item6;

  /// No description provided for @termsSection3Title.
  ///
  /// In en, this message translates to:
  /// **'3. User Accounts'**
  String get termsSection3Title;

  /// No description provided for @termsSection3Content.
  ///
  /// In en, this message translates to:
  /// **'You must create an account with correct information. You are responsible for your password and activities within your account. If there is unauthorized use, you must report it.'**
  String get termsSection3Content;

  /// No description provided for @termsSection4Title.
  ///
  /// In en, this message translates to:
  /// **'4. Acceptable Use'**
  String get termsSection4Title;

  /// No description provided for @termsSection4Content.
  ///
  /// In en, this message translates to:
  /// **'Demy can only be used for academic purposes. The following is not permitted:'**
  String get termsSection4Content;

  /// No description provided for @termsSection4Item1.
  ///
  /// In en, this message translates to:
  /// **'Illegal or unauthorized activities'**
  String get termsSection4Item1;

  /// No description provided for @termsSection4Item2.
  ///
  /// In en, this message translates to:
  /// **'Interfering with the platform'**
  String get termsSection4Item2;

  /// No description provided for @termsSection4Item3.
  ///
  /// In en, this message translates to:
  /// **'Attempting to access other accounts'**
  String get termsSection4Item3;

  /// No description provided for @termsSection4Item4.
  ///
  /// In en, this message translates to:
  /// **'Providing false information'**
  String get termsSection4Item4;

  /// No description provided for @termsSection4Item5.
  ///
  /// In en, this message translates to:
  /// **'Infringing intellectual property'**
  String get termsSection4Item5;

  /// No description provided for @termsSection5Title.
  ///
  /// In en, this message translates to:
  /// **'5. Data and Content'**
  String get termsSection5Title;

  /// No description provided for @termsSection5Content.
  ///
  /// In en, this message translates to:
  /// **'The data you enter is yours. You give us permission to process and store it only to provide the service. We protect sensitive information and maintain its confidentiality.'**
  String get termsSection5Content;

  /// No description provided for @termsSection6Title.
  ///
  /// In en, this message translates to:
  /// **'6. Billing and Payments'**
  String get termsSection6Title;

  /// No description provided for @termsSection6Content.
  ///
  /// In en, this message translates to:
  /// **'The service works through monthly or annual subscription. Renewal is automatic. You can cancel at any time from your control panel.'**
  String get termsSection6Content;

  /// No description provided for @termsSection7Title.
  ///
  /// In en, this message translates to:
  /// **'7. Limitation of Liability'**
  String get termsSection7Title;

  /// No description provided for @termsSection7Content.
  ///
  /// In en, this message translates to:
  /// **'Demy is offered \"as is\". We do not guarantee that it is free of errors or interruptions. Our liability is limited to the amount paid during the last 12 months.'**
  String get termsSection7Content;

  /// No description provided for @termsSection8Title.
  ///
  /// In en, this message translates to:
  /// **'8. Termination'**
  String get termsSection8Title;

  /// No description provided for @termsSection8Content.
  ///
  /// In en, this message translates to:
  /// **'We may suspend your access if you violate the terms. If the service ends, your data can be downloaded for 30 days before being deleted.'**
  String get termsSection8Content;

  /// No description provided for @termsSection9Title.
  ///
  /// In en, this message translates to:
  /// **'9. Modifications'**
  String get termsSection9Title;

  /// No description provided for @termsSection9Content.
  ///
  /// In en, this message translates to:
  /// **'We may update these terms. If there are important changes, we will notify you 30 days in advance. Continuing to use Demy implies accepting the new terms.'**
  String get termsSection9Content;

  /// No description provided for @termsSection10Title.
  ///
  /// In en, this message translates to:
  /// **'10. Contact'**
  String get termsSection10Title;

  /// No description provided for @termsSection10Content.
  ///
  /// In en, this message translates to:
  /// **'For inquiries:\ncontact.demyteam@gmail.com'**
  String get termsSection10Content;

  /// No description provided for @termsLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: December 2025'**
  String get termsLastUpdated;

  /// No description provided for @privacySection1Title.
  ///
  /// In en, this message translates to:
  /// **'1. Information We Collect'**
  String get privacySection1Title;

  /// No description provided for @privacySection1Content.
  ///
  /// In en, this message translates to:
  /// **'We collect data necessary to operate the platform:'**
  String get privacySection1Content;

  /// No description provided for @privacySection1Item1.
  ///
  /// In en, this message translates to:
  /// **'Institution data (name, address, contact, tax information)'**
  String get privacySection1Item1;

  /// No description provided for @privacySection1Item2.
  ///
  /// In en, this message translates to:
  /// **'Administrators (name, email, roles)'**
  String get privacySection1Item2;

  /// No description provided for @privacySection1Item3.
  ///
  /// In en, this message translates to:
  /// **'Students (academic data, contact, payment history with authorization)'**
  String get privacySection1Item3;

  /// No description provided for @privacySection1Item4.
  ///
  /// In en, this message translates to:
  /// **'Teachers (professional information, schedules, courses)'**
  String get privacySection1Item4;

  /// No description provided for @privacySection1Item5.
  ///
  /// In en, this message translates to:
  /// **'Platform usage (activity, preferences, logs)'**
  String get privacySection1Item5;

  /// No description provided for @privacySection2Title.
  ///
  /// In en, this message translates to:
  /// **'2. Use of Information'**
  String get privacySection2Title;

  /// No description provided for @privacySection2Content.
  ///
  /// In en, this message translates to:
  /// **'We use the data to:'**
  String get privacySection2Content;

  /// No description provided for @privacySection2Item1.
  ///
  /// In en, this message translates to:
  /// **'Provide and improve services'**
  String get privacySection2Item1;

  /// No description provided for @privacySection2Item2.
  ///
  /// In en, this message translates to:
  /// **'Manage enrollments, schedules and payments'**
  String get privacySection2Item2;

  /// No description provided for @privacySection2Item3.
  ///
  /// In en, this message translates to:
  /// **'Generate reports'**
  String get privacySection2Item3;

  /// No description provided for @privacySection2Item4.
  ///
  /// In en, this message translates to:
  /// **'Facilitate communication'**
  String get privacySection2Item4;

  /// No description provided for @privacySection2Item5.
  ///
  /// In en, this message translates to:
  /// **'Maintain system security'**
  String get privacySection2Item5;

  /// No description provided for @privacySection2Item6.
  ///
  /// In en, this message translates to:
  /// **'Comply with legal obligations'**
  String get privacySection2Item6;

  /// No description provided for @privacySection3Title.
  ///
  /// In en, this message translates to:
  /// **'3. Academic Data Protection'**
  String get privacySection3Title;

  /// No description provided for @privacySection3Content.
  ///
  /// In en, this message translates to:
  /// **'We apply special measures such as:'**
  String get privacySection3Content;

  /// No description provided for @privacySection3Item1.
  ///
  /// In en, this message translates to:
  /// **'Encryption of sensitive data'**
  String get privacySection3Item1;

  /// No description provided for @privacySection3Item2.
  ///
  /// In en, this message translates to:
  /// **'Access by roles and permissions'**
  String get privacySection3Item2;

  /// No description provided for @privacySection3Item3.
  ///
  /// In en, this message translates to:
  /// **'Periodic audits'**
  String get privacySection3Item3;

  /// No description provided for @privacySection3Item4.
  ///
  /// In en, this message translates to:
  /// **'Secure backups'**
  String get privacySection3Item4;

  /// No description provided for @privacySection3Item5.
  ///
  /// In en, this message translates to:
  /// **'Compliance with educational standards'**
  String get privacySection3Item5;

  /// No description provided for @privacySection4Title.
  ///
  /// In en, this message translates to:
  /// **'4. Sharing Information'**
  String get privacySection4Title;

  /// No description provided for @privacySection4Content.
  ///
  /// In en, this message translates to:
  /// **'We do not sell data. We only share when:'**
  String get privacySection4Content;

  /// No description provided for @privacySection4Item1.
  ///
  /// In en, this message translates to:
  /// **'Required by educational authorities'**
  String get privacySection4Item1;

  /// No description provided for @privacySection4Item2.
  ///
  /// In en, this message translates to:
  /// **'Needed by technical providers under confidentiality'**
  String get privacySection4Item2;

  /// No description provided for @privacySection4Item3.
  ///
  /// In en, this message translates to:
  /// **'The institution authorizes it'**
  String get privacySection4Item3;

  /// No description provided for @privacySection4Item4.
  ///
  /// In en, this message translates to:
  /// **'There is a legal or judicial obligation'**
  String get privacySection4Item4;

  /// No description provided for @privacySection5Title.
  ///
  /// In en, this message translates to:
  /// **'5. Data Retention'**
  String get privacySection5Title;

  /// No description provided for @privacySection5Item1.
  ///
  /// In en, this message translates to:
  /// **'Academic: minimum 5 years'**
  String get privacySection5Item1;

  /// No description provided for @privacySection5Item2.
  ///
  /// In en, this message translates to:
  /// **'Billing: 7 years'**
  String get privacySection5Item2;

  /// No description provided for @privacySection5Item3.
  ///
  /// In en, this message translates to:
  /// **'Access logs: 2 years'**
  String get privacySection5Item3;

  /// No description provided for @privacySection5Item4.
  ///
  /// In en, this message translates to:
  /// **'Contact: until deletion is requested'**
  String get privacySection5Item4;

  /// No description provided for @privacySection6Title.
  ///
  /// In en, this message translates to:
  /// **'6. Your Rights'**
  String get privacySection6Title;

  /// No description provided for @privacySection6Content.
  ///
  /// In en, this message translates to:
  /// **'The institution can:'**
  String get privacySection6Content;

  /// No description provided for @privacySection6Item1.
  ///
  /// In en, this message translates to:
  /// **'Access and export its data'**
  String get privacySection6Item1;

  /// No description provided for @privacySection6Item2.
  ///
  /// In en, this message translates to:
  /// **'Correct information'**
  String get privacySection6Item2;

  /// No description provided for @privacySection6Item3.
  ///
  /// In en, this message translates to:
  /// **'Request portability'**
  String get privacySection6Item3;

  /// No description provided for @privacySection6Item4.
  ///
  /// In en, this message translates to:
  /// **'Restrict processing'**
  String get privacySection6Item4;

  /// No description provided for @privacySection6Item5.
  ///
  /// In en, this message translates to:
  /// **'Request deletion (according to law)'**
  String get privacySection6Item5;

  /// No description provided for @privacySection6Item6.
  ///
  /// In en, this message translates to:
  /// **'Be notified of security breaches'**
  String get privacySection6Item6;

  /// No description provided for @privacySection7Title.
  ///
  /// In en, this message translates to:
  /// **'7. International Transfers'**
  String get privacySection7Title;

  /// No description provided for @privacySection7Content.
  ///
  /// In en, this message translates to:
  /// **'Data may be processed outside the country under international standards and approved protection clauses.'**
  String get privacySection7Content;

  /// No description provided for @privacySection8Title.
  ///
  /// In en, this message translates to:
  /// **'8. Minors'**
  String get privacySection8Title;

  /// No description provided for @privacySection8Content.
  ///
  /// In en, this message translates to:
  /// **'We require consent from parents or guardians. Minor data is handled with additional protection and only for educational purposes.'**
  String get privacySection8Content;

  /// No description provided for @privacySection9Title.
  ///
  /// In en, this message translates to:
  /// **'9. Policy Changes'**
  String get privacySection9Title;

  /// No description provided for @privacySection9Content.
  ///
  /// In en, this message translates to:
  /// **'We will notify important changes 30 days in advance. Minor changes will be published directly.'**
  String get privacySection9Content;

  /// No description provided for @privacySection10Title.
  ///
  /// In en, this message translates to:
  /// **'10. Contact and DPO'**
  String get privacySection10Title;

  /// No description provided for @privacySection10Content.
  ///
  /// In en, this message translates to:
  /// **'Privacy inquiries: contact.demyteam@gmail.com\n\nData Protection Officer (DPO): dpo@demy.com'**
  String get privacySection10Content;

  /// No description provided for @privacyLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: December 2025'**
  String get privacyLastUpdated;

  /// No description provided for @byUsingDemyYouAccept.
  ///
  /// In en, this message translates to:
  /// **'By using Demy for Teachers, you accept the'**
  String get byUsingDemyYouAccept;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and the'**
  String get and;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
