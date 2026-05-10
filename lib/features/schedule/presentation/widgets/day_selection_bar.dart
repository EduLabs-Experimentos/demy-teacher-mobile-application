import 'package:demy_teachers/features/schedule/presentation/blocs/schedule_bloc.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/schedule_event.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/schedule_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const List<String> weekDaysShort = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];


const Map<String, String> dayTranslation = {
  'Sun': 'Dom',
  'Mon': 'Lun',
  'Tue': 'Mar',
  'Wed': 'Mié',
  'Thu': 'Jue',
  'Fri': 'Vie',
  'Sat': 'Sáb',
};

class DaySelectionBar extends StatelessWidget {
  const DaySelectionBar({super.key});

 
  static const double circleSize = 48.0; 
  static const double fontSize = 14.0; 

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    
    final Color selectedFillColor = colorScheme.secondaryFixed;
    final Color selectedTextColor = colorScheme.onSecondaryFixed; 
    final Color unselectedTextColor = colorScheme.onSurface; 

    

    return BlocBuilder<ScheduleBloc, ScheduleState>(
      buildWhen: (previous, current) => current is ScheduleLoaded,
      builder: (context, state) {
        String selectedDay = (state is ScheduleLoaded) 
            ? state.selectedDay.substring(0, 3).toLowerCase() 
            : weekDaysShort.first.toLowerCase();

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: weekDaysShort.map((day) {
              final isSelected = day.toLowerCase() == selectedDay;
              
              
              final String displayDay = dayTranslation[day] ?? day; 
              
              return Expanded(
                child: Center(
                  child: InkWell(
                    onTap: () {
                      
                      context.read<ScheduleBloc>().add(ScheduleDayChanged(day));
                    },
                    borderRadius: BorderRadius.circular(circleSize / 2),
                    splashColor: Colors.transparent, 
                    highlightColor: Colors.transparent, 
                    
                    child: Container(
                      width: circleSize,
                      height: circleSize,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, 
                        color: isSelected ? selectedFillColor : Colors.transparent, 
                        
                        border: null, 
                      ),
                      child: Text(
                        displayDay, 
                        style: TextStyle(
                          fontSize: fontSize, 
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? selectedTextColor : unselectedTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}