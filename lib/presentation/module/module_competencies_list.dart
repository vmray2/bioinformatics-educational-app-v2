import 'package:binf_educational_app_redone/presentation/providers/competency_provider.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModuleCompetenciesList extends ConsumerWidget {
  final Map<String, dynamic> competencyXp;

  const ModuleCompetenciesList({super.key, required this.competencyXp});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final competenciesAsync = ref.watch(competenciesProvider);
    
    final appColors = context.appColors;

    return competenciesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text('Error loading competencies: $err'),      
        data: (competencies) {
          final filteredCompetencies = competencies
              .where((comp) => competencyXp.containsKey(comp.competencyId))
              .toList();

          if (filteredCompetencies.isEmpty) {
            return const Text('No core competencies listed for this module.');
          }

          return ListView.builder(
            itemCount: filteredCompetencies.length,
            itemBuilder: (context, index) {
              final competency = filteredCompetencies[index];
              return Container(
                decoration: BoxDecoration(
                  color: appColors.badgeCardBackgroundColor,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ListTile(
                  title: Text(
                    competency.name,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  subtitle: Text(
                    competency.description,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              );
            }
          );
        },
    );
  }

}