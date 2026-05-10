// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Demy Teachers';

  @override
  String get welcome => 'Bienvenido';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get email => 'Correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get signInTitle => 'Iniciar sesión';

  @override
  String get signInSubtitle =>
      'Ingrese sus credenciales otorgadas por su administrador para continuar';

  @override
  String get signInButton => 'Iniciar sesión';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get emailRequired => 'El correo electrónico es obligatorio';

  @override
  String get passwordRequired => 'La contraseña es obligatoria';

  @override
  String get home => 'Inicio';

  @override
  String get profile => 'Perfil';

  @override
  String get settings => 'Configuración';

  @override
  String get homePageTitle => 'Bienvenido a Demy Teachers';

  @override
  String get homePagePlaceholder =>
      'El contenido del inicio estará disponible pronto...';

  @override
  String get profilePageTitle => 'Mi Perfil';

  @override
  String get profilePagePlaceholder =>
      'La información del perfil estará disponible pronto...';

  @override
  String get settingsPageTitle => 'Configuración';

  @override
  String get settingsPagePlaceholder =>
      'Las opciones de configuración estarán disponibles pronto...';

  @override
  String get registerAttendanceButtonLabel => 'Registrar Asistencia';

  @override
  String get attendanceReportTitle => 'Reporte de Asistencia';

  @override
  String get studentsLabel => 'Estudiantes';

  @override
  String get saveAttendanceButton => 'Guardar Asistencia';

  @override
  String get attendanceSavedSuccess => 'Asistencia guardada exitosamente';

  @override
  String get courseLabel => 'Curso';

  @override
  String get startDateLabel => 'Fecha Inicio';

  @override
  String get endDateLabel => 'Fecha Fin';

  @override
  String get statusPresentAbbr => 'A';

  @override
  String get statusExcusedAbbr => 'J';

  @override
  String get statusAbsentAbbr => 'F';

  @override
  String errorLoadingStudents(String error) {
    return 'Error al cargar la lista: $error';
  }

  @override
  String get viewAttendanceReportButton => 'Ver Reporte de Asistencia';

  @override
  String get teachingScheduleButton => 'Horario de Clases';

  @override
  String get viewNotificationsButton => 'Ver Notificaciones';

  @override
  String get todayScheduleTitle => 'Agenda de Hoy';

  @override
  String get viewAllLink => 'Ver todo >';

  @override
  String get notificationsPageTitle => 'Notificaciones';

  @override
  String get welcomeNotificationTitle => 'Bienvenido a Demy for Teachers';

  @override
  String get welcomeNotificationDescription =>
      'Has iniciado sesión en la aplicación, comienza a gestionar tus horarios, asistencia y más.';

  @override
  String get teachingScheduleTitle => 'Horario de Clases';

  @override
  String get teachingRescheduleTitle => 'Reprogramar Clase';

  @override
  String get dayOfWeek => 'Día de la Semana';

  @override
  String get startTime => 'Hora de Inicio';

  @override
  String get endTime => 'Hora de Fin';

  @override
  String get course => 'Curso';

  @override
  String get campus => 'Campus';

  @override
  String get classroom => 'Aula';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get confirmReschedule => 'Confirmar Reprogramación';

  @override
  String get confirmRescheduleMessage =>
      '¿Estás seguro de que quieres reprogramar esta clase con los cambios seleccionados?';

  @override
  String get yesSaveChanges => 'Sí, Guardar Cambios';

  @override
  String get rescheduledSuccessfully => '¡Reprogramado exitosamente!';

  @override
  String get selectDay => 'Seleccionar Día';

  @override
  String get monday => 'Lunes';

  @override
  String get tuesday => 'Martes';

  @override
  String get wednesday => 'Miércoles';

  @override
  String get thursday => 'Jueves';

  @override
  String get friday => 'Viernes';

  @override
  String get saturday => 'Sábado';

  @override
  String get sunday => 'Domingo';

  @override
  String errorLoadingSchedule(String error) {
    return 'Error al cargar el horario: $error';
  }

  @override
  String get noClassesScheduled => 'No hay clases programadas para este día.';

  @override
  String get phoneNumberLabel => 'Número de teléfono';

  @override
  String get resetPasswordButton => 'Restablecer Contraseña';

  @override
  String get forgotPasswordTitle => 'Olvidé mi Contraseña';

  @override
  String get forgotPasswordDescription =>
      'Ingresa tu dirección de correo electrónico y te enviaremos un código de verificación para restablecer tu contraseña';

  @override
  String get emailHint => 'Ingresa tu correo electrónico';

  @override
  String get emailInvalid => 'Por favor ingresa un correo válido';

  @override
  String get sendVerificationCodeButton => 'Enviar Código de Verificación';

  @override
  String get verifyResetCodeTitle => 'Ingresa tu Código de Verificación';

  @override
  String get verifyResetCodeDescription =>
      'Enviamos un código a tu correo electrónico, ingrésalo para restablecer tu contraseña';

  @override
  String get verificationCodeLabel => 'Código de Verificación';

  @override
  String get verificationCodeHint => 'Ingresa el código';

  @override
  String get verificationCodeRequired =>
      'El código de verificación es obligatorio';

  @override
  String get verifyCodeButton => 'Verificar Código';

  @override
  String get resetPasswordTitle => 'Restablecer Contraseña';

  @override
  String get resetPasswordDescription =>
      'Ingresa tu nueva contraseña y confírmala';

  @override
  String get oldPasswordLabel => 'Contraseña Actual';

  @override
  String get oldPasswordHint => 'Ingresa tu contraseña actual';

  @override
  String get oldPasswordRequired => 'La contraseña actual es obligatoria';

  @override
  String get newPasswordLabel => 'Nueva Contraseña';

  @override
  String get newPasswordHint => 'Ingresa tu nueva contraseña';

  @override
  String get newPasswordRequired => 'La nueva contraseña es obligatoria';

  @override
  String get newPasswordTooShort =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get confirmPasswordLabel => 'Confirmar Contraseña';

  @override
  String get confirmPasswordHint => 'Confirma tu nueva contraseña';

  @override
  String get confirmPasswordRequired => 'Por favor confirma tu contraseña';

  @override
  String get passwordsDoNotMatch => 'Las contraseñas no coinciden';

  @override
  String get submitButton => 'Enviar';

  @override
  String get resetPasswordSuccessTitle =>
      '¡Contraseña Restablecida Exitosamente!';

  @override
  String get resetPasswordSuccessMessage =>
      'Tu contraseña ha sido restablecida exitosamente. Ahora puedes iniciar sesión con tu nueva contraseña.';

  @override
  String get goToHomeButton => 'Ir al Inicio';

  @override
  String get termsAndConditions => 'Términos y Condiciones';

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get signOut => 'Cerrar Sesión';

  @override
  String get termsSection1Title => '1. Aceptación de los Términos';

  @override
  String get termsSection1Content =>
      'Al usar la plataforma Demy aceptas estos términos. Demy es un sistema de gestión académica para academias y centros educativos.';

  @override
  String get termsSection2Title => '2. Descripción del Servicio';

  @override
  String get termsSection2Content => 'Demy ofrece herramientas para:';

  @override
  String get termsSection2Item1 => 'Gestión de matrículas y estudiantes';

  @override
  String get termsSection2Item2 => 'Administración de horarios y clases';

  @override
  String get termsSection2Item3 => 'Pagos, facturación y control financiero';

  @override
  String get termsSection2Item4 => 'Reportes y seguimiento académico';

  @override
  String get termsSection2Item5 => 'Comunicación con estudiantes y padres';

  @override
  String get termsSection2Item6 => 'Gestión de profesores y personal';

  @override
  String get termsSection3Title => '3. Cuentas de Usuario';

  @override
  String get termsSection3Content =>
      'Debes crear una cuenta con información correcta. Eres responsable de tu contraseña y de las actividades dentro de tu cuenta. Si hay uso no autorizado, debes reportarlo.';

  @override
  String get termsSection4Title => '4. Uso Aceptable';

  @override
  String get termsSection4Content =>
      'Demy solo puede usarse para fines académicos. No está permitido:';

  @override
  String get termsSection4Item1 => 'Actividades ilegales o no autorizadas';

  @override
  String get termsSection4Item2 => 'Interferir con la plataforma';

  @override
  String get termsSection4Item3 => 'Intentar acceder a cuentas ajenas';

  @override
  String get termsSection4Item4 => 'Proporcionar información falsa';

  @override
  String get termsSection4Item5 => 'Infringir propiedad intelectual';

  @override
  String get termsSection5Title => '5. Datos y Contenido';

  @override
  String get termsSection5Content =>
      'Los datos que ingresas son tuyos. Nos das permiso para procesarlos y almacenarlos solo para ofrecer el servicio. Protegemos la información sensible y mantenemos su confidencialidad.';

  @override
  String get termsSection6Title => '6. Facturación y Pagos';

  @override
  String get termsSection6Content =>
      'El servicio funciona mediante suscripción mensual o anual. La renovación es automática. Puedes cancelar en cualquier momento desde tu panel de control.';

  @override
  String get termsSection7Title => '7. Limitación de Responsabilidad';

  @override
  String get termsSection7Content =>
      'Demy se ofrece \"tal como está\". No garantizamos que esté libre de errores o interrupciones. Nuestra responsabilidad se limita al monto pagado durante los últimos 12 meses.';

  @override
  String get termsSection8Title => '8. Terminación';

  @override
  String get termsSection8Content =>
      'Podemos suspender tu acceso si incumples los términos. Si el servicio termina, tus datos podrán descargarse por 30 días antes de ser eliminados.';

  @override
  String get termsSection9Title => '9. Modificaciones';

  @override
  String get termsSection9Content =>
      'Podemos actualizar estos términos. Si hay cambios importantes, avisaremos con 30 días de anticipación. Seguir usando Demy implica aceptar los nuevos términos.';

  @override
  String get termsSection10Title => '10. Contacto';

  @override
  String get termsSection10Content =>
      'Para consultas:\ncontact.demyteam@gmail.com';

  @override
  String get termsLastUpdated => 'Última actualización: Diciembre 2025';

  @override
  String get privacySection1Title => '1. Información que Recopilamos';

  @override
  String get privacySection1Content =>
      'Recopilamos datos necesarios para operar la plataforma:';

  @override
  String get privacySection1Item1 =>
      'Datos de la institución (nombre, dirección, contacto, información fiscal)';

  @override
  String get privacySection1Item2 => 'Administradores (nombre, correo, roles)';

  @override
  String get privacySection1Item3 =>
      'Estudiantes (datos académicos, contacto, historial de pagos con autorización)';

  @override
  String get privacySection1Item4 =>
      'Profesores (información profesional, horarios, cursos)';

  @override
  String get privacySection1Item5 =>
      'Uso de la plataforma (actividad, preferencias, logs)';

  @override
  String get privacySection2Title => '2. Uso de la Información';

  @override
  String get privacySection2Content => 'Usamos los datos para:';

  @override
  String get privacySection2Item1 => 'Brindar y mejorar los servicios';

  @override
  String get privacySection2Item2 => 'Gestionar matrículas, horarios y pagos';

  @override
  String get privacySection2Item3 => 'Generar reportes';

  @override
  String get privacySection2Item4 => 'Facilitar comunicación';

  @override
  String get privacySection2Item5 => 'Mantener la seguridad del sistema';

  @override
  String get privacySection2Item6 => 'Cumplir obligaciones legales';

  @override
  String get privacySection3Title => '3. Protección de Datos Académicos';

  @override
  String get privacySection3Content => 'Aplicamos medidas especiales como:';

  @override
  String get privacySection3Item1 => 'Encriptación de datos sensibles';

  @override
  String get privacySection3Item2 => 'Acceso por roles y permisos';

  @override
  String get privacySection3Item3 => 'Auditorías periódicas';

  @override
  String get privacySection3Item4 => 'Respaldos seguros';

  @override
  String get privacySection3Item5 => 'Cumplimiento de normas educativas';

  @override
  String get privacySection4Title => '4. Compartir Información';

  @override
  String get privacySection4Content =>
      'No vendemos datos. Solo compartimos cuando:';

  @override
  String get privacySection4Item1 => 'Es requerido por autoridades educativas';

  @override
  String get privacySection4Item2 =>
      'Lo necesitan proveedores técnicos bajo confidencialidad';

  @override
  String get privacySection4Item3 => 'La institución lo autoriza';

  @override
  String get privacySection4Item4 => 'Existe obligación legal o judicial';

  @override
  String get privacySection5Title => '5. Retención de Datos';

  @override
  String get privacySection5Item1 => 'Académicos: mínimo 5 años';

  @override
  String get privacySection5Item2 => 'Facturación: 7 años';

  @override
  String get privacySection5Item3 => 'Logs de acceso: 2 años';

  @override
  String get privacySection5Item4 => 'Contacto: hasta solicitar eliminación';

  @override
  String get privacySection6Title => '6. Sus Derechos';

  @override
  String get privacySection6Content => 'La institución puede:';

  @override
  String get privacySection6Item1 => 'Acceder y exportar sus datos';

  @override
  String get privacySection6Item2 => 'Corregir información';

  @override
  String get privacySection6Item3 => 'Solicitar portabilidad';

  @override
  String get privacySection6Item4 => 'Restringir el procesamiento';

  @override
  String get privacySection6Item5 => 'Pedir eliminación (según ley)';

  @override
  String get privacySection6Item6 => 'Ser notificada ante brechas de seguridad';

  @override
  String get privacySection7Title => '7. Transferencias Internacionales';

  @override
  String get privacySection7Content =>
      'Los datos pueden procesarse fuera del país bajo estándares internacionales y cláusulas de protección aprobadas.';

  @override
  String get privacySection8Title => '8. Menores de Edad';

  @override
  String get privacySection8Content =>
      'Requerimos consentimiento de padres o tutores. Los datos de menores se manejan con protección adicional y solo para fines educativos.';

  @override
  String get privacySection9Title => '9. Cambios a la Política';

  @override
  String get privacySection9Content =>
      'Avisaremos cambios importantes con 30 días de anticipación. Los cambios menores se publicarán directamente.';

  @override
  String get privacySection10Title => '10. Contacto y DPO';

  @override
  String get privacySection10Content =>
      'Consultas de privacidad: contact.demyteam@gmail.com\n\nOficial de Protección de Datos (DPO): dpo@demy.com';

  @override
  String get privacyLastUpdated => 'Última actualización: Diciembre 2025';

  @override
  String get byUsingDemyYouAccept => 'Al usar Demy for Teachers, aceptas los';

  @override
  String get and => 'y la';
}
