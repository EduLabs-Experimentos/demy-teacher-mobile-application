import 'package:demy_teachers/core/localization/l10n/app_localizations.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/schedule_bloc.dart';
import 'package:demy_teachers/features/schedule/presentation/blocs/schedule_state.dart';
import 'package:demy_teachers/features/schedule/presentation/widgets/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleBody extends StatelessWidget {
  const ScheduleBody({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return BlocBuilder<ScheduleBloc, ScheduleState>(
      builder: (context, state) {
        if (state is ScheduleLoading || state is ScheduleInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ScheduleFailure) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(t.errorLoadingSchedule(state.message)),
            ),
          );
        }
        if (state is ScheduleLoaded) {
          if (state.dailySessions.isEmpty) {
            return Center(child: Text(t.noClassesScheduled));
          }
          return ListView.builder(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 16.0), 
            itemCount: state.dailySessions.length,
            itemBuilder: (context, index) {
              return ScheduleCard(item: state.dailySessions[index]);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}