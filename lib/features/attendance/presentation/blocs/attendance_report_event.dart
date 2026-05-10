import 'package:equatable/equatable.dart'; // Opcional, si usas equatable

abstract class AttendanceReportEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Evento inicial al entrar a la pantalla
class LoadReportEvent extends AttendanceReportEvent {}

// Evento cuando el usuario cambia las fechas en el calendario
class FilterReportEvent extends AttendanceReportEvent {
  final DateTime startDate;
  final DateTime endDate;

  FilterReportEvent({required this.startDate, required this.endDate});

  @override
  List<Object?> get props => [startDate, endDate];
}