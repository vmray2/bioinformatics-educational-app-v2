import 'package:binf_educational_app_redone/domain/models/activity_config.dart';
import 'package:binf_educational_app_redone/presentation/activity/data_hub_query_builder/molecule_details_content.dart';
import 'package:binf_educational_app_redone/providers/molecule_provider.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MoleculeDetailsScreen extends ConsumerWidget {
  final int moleculeId;
  final ActivityConfig config;
  final String activityName;
  
  MoleculeDetailsScreen({super.key, required this.moleculeId, required this.config, required this.activityName});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appColors = context.appColors;
    final moleculeDetailAsync = ref.watch(moleculeDetailStreamProvider(moleculeId));

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                              config.objectives[2],
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
                            flex: 71,
                            child: moleculeDetailAsync.when(
                              loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
                              error: (err, stack) => Scaffold(body: Center(child: Text('Data error: $err'))),
                              data: (molecule) {
                                //print("Full Name: ${molecule?.fullName}");
                                return MoleculeDetailsContent(molecule: molecule!);
                              }
                            )
                          ),
                          Flexible(
                            flex: 5,
                            child: InkWell(
                              onTap: () {

                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: appColors.primaryColor,
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                                child: Center(
                                  child: Text(
                                    "Take Quiz",
                                    style: GoogleFonts.inter(
                                      color: appColors.textColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }

}