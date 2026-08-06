import 'package:binf_educational_app_redone/data/local/collections/molecule_collection.dart';
import 'package:binf_educational_app_redone/domain/models/molecule.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoleculeCard extends StatelessWidget {
  final MoleculeCollection molecule;
  final MoleculeType moleculeType;
  final VoidCallback? onTap;

  const MoleculeCard({
    super.key,
    required this.molecule,
    this.onTap, 
    required this.moleculeType,
  });

  dynamic selectMolecule(AppColors appColors) {
    dynamic selectMoleculeCard;

    if (moleculeType == MoleculeType.gene) {
      selectMoleculeCard = SizedBox(
        width: double.infinity,
        height: 150,
        child: Column(
          spacing: 8,
          children: [
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Row(
                      spacing: 8,
                      children: [
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              color: appColors.backgroundColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Center(
                              child: Text(
                                molecule.name,
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: appColors.textColor
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: appColors.backgroundColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Full Name",
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: appColors.textColor,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text(
                                    molecule.fullName!,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: appColors.textColor
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Row(
                spacing: 8,
                children: [
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: appColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        spacing: 4,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              "Organism",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 12
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              molecule.organism!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontSize: 12
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: appColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        spacing: 4,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              "Location",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 12
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Chr ${molecule.chromosome} (${molecule.startPosition} ... ${molecule.endPosition})",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontSize: 12
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            )
          ],
        ),
      );
    }
    else if (moleculeType == MoleculeType.protein) {
      selectMoleculeCard = SizedBox(
        height: 150,
        child: Row(
          spacing: 8,
          children: [
            Flexible(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: appColors.backgroundColor,
                  borderRadius: BorderRadius.circular(8)
                )
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                spacing: 8,
                children: [
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: appColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Flexible(
                            child: Text(
                              "PDB ID",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              molecule.pdbId!,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: appColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Flexible(
                            child: Text(
                              "Structure",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              molecule.name,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: appColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Flexible(
                            child: Text(
                              "Organism",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              molecule.organism!,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      );
    }
    else if (moleculeType == MoleculeType.ligand) {
      selectMoleculeCard = SizedBox(
        height: 150,
        child: Row(
          spacing: 8,
          children: [
            Flexible(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: appColors.backgroundColor,
                  borderRadius: BorderRadius.circular(8)
                )
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                spacing: 8,
                children: [
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: appColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Flexible(
                            child: Text(
                              "Name",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              molecule.name,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: appColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Flexible(
                            child: Text(
                              "Chemical Formula",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              molecule.chemicalFormula!,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: appColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Flexible(
                            child: Text(
                              "Molecular Weight (g/mol)",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "${molecule.molecularWeight!}",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      );
    }

    return selectMoleculeCard;
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Card(
      elevation: 1,
      color: appColors.standardCardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: selectMolecule(appColors),
        ),
      ),
    );
  }
  
}