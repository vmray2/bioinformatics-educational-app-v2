import 'package:binf_educational_app_redone/domain/models/activity_config.dart';
import 'package:binf_educational_app_redone/domain/models/molecule.dart';
import 'package:binf_educational_app_redone/presentation/activity/data_hub_query_builder/molecule_card.dart';
import 'package:binf_educational_app_redone/presentation/activity/data_hub_query_builder/molecule_details_screen.dart';
import 'package:binf_educational_app_redone/providers/molecule_provider.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class QueryResultsScreen extends ConsumerWidget {
  final ActivityConfig config;
  final String activityName;
  final String databaseType;
  
  const QueryResultsScreen({super.key, required this.config, required this.activityName, required this.databaseType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = context.appColors;

    // Query starts executing automatically the moment this screen mounts
    final moleculesAsync = ref.watch(filteredMoleculesStreamProvider);

    return Scaffold(
      backgroundColor: appColors.backgroundColor,
      appBar: AppBar(
        title: Text(
         activityName,
          style: GoogleFonts.inter(
            fontSize: 24,
            color: appColors.textColor,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: appColors.secondaryColor,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                ?appColors.primaryColor,
                ?appColors.secondaryColor
              ]
            ),  
            //borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20), bottomRight: Radius.circular(20))        
          ),
        )
      ),
      body: moleculesAsync.when(
        // 🎯 Loaded State: Displays when Isar returns matching records
        data: (molecules) {
          return SafeArea(
            child: Column(
              spacing: 16,
              children: [
                Flexible(
                  flex: 100,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 9,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: appColors.standardCardBackgroundColor,
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromRGBO(204, 204, 204, 1),
                                width: 1.0
                              )
                            )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Text(
                                  "Objective",
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: appColors.textColor,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 6,
                                child: Text(
                                  config.objectives[1],
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: appColors.textColor
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 91,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            spacing: 16,
                            children: [
                              Flexible(
                                flex: 5,
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    color: appColors.standardCardBackgroundColor,
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.05), 
                                        spreadRadius: 2,                    
                                        blurRadius: 4,                      
                                        offset: const Offset(0, 4),  
                                      )
                                    ]
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Query Results",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (molecules.isEmpty) ... [
                                Flexible(
                                  flex: 61,
                                  child: const Center(
                                    child: Text('No molecules matched your query parameters.'),
                                  ),
                                )
                              ]
                              else ... [
                                Flexible(
                                  flex: 61,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(16),
                                    itemCount: molecules.length,
                                    itemBuilder: (context, index) {
                                      MoleculeType? databaseTypeConverted = databaseType == "GENE" ? MoleculeType.gene : databaseType == "PROTEIN" ? MoleculeType.protein : databaseType == "LIGAND" ? MoleculeType.ligand : null;
                                      
                                      if (molecules[index].type == databaseTypeConverted) {
                                        return MoleculeCard(
                                          molecule: molecules[index],
                                          moleculeType: molecules[index].type,
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => MoleculeDetailsScreen(
                                                  config: config, 
                                                  activityName: activityName, 
                                                  moleculeId: molecules[index].id,
                                                )
                                              )
                                            );
                                          },
                                        );
                                      }
                                      else {
                                        if (databaseTypeConverted == null) {
                                          return MoleculeCard(
                                            molecule: molecules[index],
                                            moleculeType: molecules[index].type,
                                            onTap: () {
                                              
                                            },
                                          );
                                        }
                                        else {
                                          return Container();
                                        }
                                      }
                                    }
                                  ),
                                )
                              ]
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            
              ],
            )
          );

        },
        // ⏳ Loading State: Displays while Isar queries the local database
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Executing query across local database...'),
            ],
          ),
        ),
        // ❌ Error State
        error: (err, stack) => Center(
          child: Text('Query execution failed: $err'),
        ),
      ),
    );
  }
}