import 'package:binf_educational_app_redone/data/local/collections/molecule_collection.dart';
import 'package:binf_educational_app_redone/domain/models/molecule.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoleculeDetailsContent extends StatelessWidget {
  final MoleculeCollection molecule;

  const MoleculeDetailsContent({super.key, required this.molecule});

  dynamic setFileBar(AppColors appColors){
    dynamic fileBar = Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Flexible(
            child: Text(
              "Files",
              style: GoogleFonts.inter(
                color: appColors.textColor,
                fontWeight: FontWeight.w700,
                fontSize: 18
              ),
            )
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 8,
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: appColors.secondaryColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text(
                    molecule.type == MoleculeType.gene || molecule.type == MoleculeType.protein ? "FASTA" : "2D",
                    style: GoogleFonts.inter(
                      color: appColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                    ),
                  )
                ),
                if (molecule.type == MoleculeType.protein || molecule.type == MoleculeType.ligand) ... [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: appColors.secondaryColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(
                      child: Text(
                        "3D",
                        style: GoogleFonts.inter(
                          color: appColors.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                        ),
                      ),
                    )
                  )
                ],
              ],
            ),
          )
        ],
      ),
    );

    return fileBar;
  }

  dynamic setMoleculeDetailBody(AppColors appColors){
    dynamic moleculeDetailBody = Column(
      spacing: 16,
      children: [
        Flexible(
          flex: molecule.type == MoleculeType.gene || molecule.type == MoleculeType.protein ? 47 : 18,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Flexible(
                  child: Text(
                    molecule.type == MoleculeType.gene ? "${molecule.name} Gene Details" : molecule.type == MoleculeType.protein ? "${molecule.name} Protein Details" : molecule.type == MoleculeType.ligand ? "${molecule.name} Compound Details" : "",
                    style: GoogleFonts.inter(
                      color: appColors.textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18
                    ),
                  ),
                ),
                if (molecule.type == MoleculeType.gene) ... [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Flexible(
                          flex: 8,
                          fit: FlexFit.tight,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: appColors.badgeCardBackgroundColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Row(
                              spacing: 8,
                              children: [
                                Flexible(
                                  child: Container(
                                    height: double.infinity,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(226, 226, 226, 1),
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
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Full Name",
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            //height: 1
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "molecule.fullName!",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),
                                        ),
                                      ),
                                      Flexible(child: SizedBox(height: 8,)),
                                      Flexible(
                                        child: Text(
                                          "Aliases",
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            //height: 1
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${molecule.synonyms}",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ),
                        Flexible(
                          flex: 6,
                          fit: FlexFit.tight,
                          child: Container(
                            //height: double.infinity,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: appColors.badgeCardBackgroundColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Description",
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      height: 1
                                    ),                                
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text(
                                    molecule.description!,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      height: 1
                                    ),
                                  )
                                ),
                              ],
                            ),
                          )
                        ),
                        Flexible(
                          flex: 3,
                          child: Row(
                            spacing: 8,
                            children: [
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Location",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "Chr ${molecule.chromosome} (${molecule.startPosition} ... ${molecule.endPosition})",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Cytogenetic Band",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          molecule.cytogeneticBand!,
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ),
                        Flexible(
                          flex: 3,
                          child: Row(
                            spacing: 8,
                            children: [
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Organism",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          molecule.organism!,
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Exon Count",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${molecule.exonCount}",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
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
                  )
                ],
                if (molecule.type == MoleculeType.protein) ... [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Flexible(
                          flex: 8,
                          fit: FlexFit.tight,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: appColors.badgeCardBackgroundColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Row(
                              spacing: 8,
                              children: [
                                Flexible(
                                  child: Container(
                                    height: double.infinity,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(226, 226, 226, 1),
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Center(
                                      child: Text(
                                        molecule.pdbId!,
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
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Structure Name",
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            //height: 1
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          molecule.name,
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),
                                        ),
                                      ),
                                      Flexible(child: SizedBox(height: 8,)),
                                      Flexible(
                                        child: Text(
                                          "Aliases",
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            //height: 1
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${molecule.synonyms}",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ),
                        Flexible(
                          flex: 6,
                          fit: FlexFit.tight,
                          child: Container(
                            //height: double.infinity,
                            width: double.infinity,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: appColors.badgeCardBackgroundColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Function",
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      height: 1
                                    ),                                
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text(
                                    molecule.primaryFunction!,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      height: 1
                                    ),
                                  )
                                ),
                              ],
                            ),
                          )
                        ),
                        Flexible(
                          flex: 3,
                          child: Row(
                            spacing: 8,
                            children: [
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Atom Count",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${molecule.atomCount}",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Length (AA)",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${molecule.aminoAcidLength}",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Molecular Weight",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${molecule.molecularWeightkDa}",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ),
                        Flexible(
                          flex: 3,
                          child: Row(
                            spacing: 8,
                            children: [
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Organism",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          molecule.organism!,
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        )
                      ],
                    ),
                  )
                ],
                if (molecule.type == MoleculeType.ligand) ... [
                  Flexible(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Flexible(
                          flex: 5,
                          fit: FlexFit.tight,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: appColors.badgeCardBackgroundColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Row(
                              spacing: 8,
                              children: [
                                Flexible(
                                  child: Container(
                                    height: double.infinity,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(226, 226, 226, 1),
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Center(
                                      child: Text(
                                        molecule.moleculeId,
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
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Name",
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            //height: 1
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          molecule.name,
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),
                                        ),
                                      ),
                                      Flexible(child: SizedBox(height: 8,)),
                                      Flexible(
                                        child: Text(
                                          "PubChem ID",
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            //height: 1
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${molecule.pubChemId}",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ),
                        Flexible(
                          flex: 3,
                          child: Row(
                            spacing: 8,
                            children: [
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Formula",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${molecule.chemicalFormula}",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Rotatable Bonds",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${molecule.rotatableBonds}",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Polar Surface Area",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${molecule.polarSurfaceAreaAng!}",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ),
                        Flexible(
                          flex: 3,
                          child: Row(
                            spacing: 8,
                            children: [
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "SMILES",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          molecule.smiles!,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
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
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Hydrophobic Features",
                                          //textAlign: TextAlign.center,
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${molecule.hydrophobicFeatures}",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            //height: 1
                                          ),  
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        )
                      ],
                    ),
                  )
                ]
              ],
            ),
          ),
        ),
        if (molecule.type == MoleculeType.ligand) ... [
          Flexible(
            flex: 13,
            fit: FlexFit.tight,
            child: Container(
              width: double.infinity,
              //height: double.infinity,
              padding: EdgeInsets.all(16),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Flexible(
                    child: Text(
                      "Lipinski's Rule of 5",
                      style: GoogleFonts.inter(
                        color: appColors.textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Row(
                      spacing: 8,
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: appColors.badgeCardBackgroundColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Center(
                              child: Column(
                                spacing: 8,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Text(
                                      "Molecular Weight\n(<500 g/mol)",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        color: appColors.textColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Row(
                                      spacing: 4,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        molecule.molecularWeight! <= 500 ? Flexible(child: Icon(Icons.check_box)) : Flexible(child: Icon(Icons.check_box_outline_blank)),
                                        Flexible(
                                          child: Text(
                                            "${molecule.molecularWeight}",
                                            style: GoogleFonts.inter(
                                              color: appColors.textColor,
                                              fontSize: 12
                                            )
                                          ),
                                        )
                                      ],
                                    )
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: appColors.badgeCardBackgroundColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Center(
                              child: Column(
                                spacing: 8,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Text(
                                      "Hydrogen Bond Donors\n(<= 5)",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        color: appColors.textColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Row(
                                      spacing: 4,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        molecule.hydrogenBondDonors! <= 5 ? Flexible(child: Icon(Icons.check_box)) : Flexible(child: Icon(Icons.check_box_outline_blank)),
                                        Flexible(
                                          child: Text(
                                            "${molecule.hydrogenBondDonors}",
                                            style: GoogleFonts.inter(
                                              color: appColors.textColor,
                                              fontSize: 12
                                            )
                                          ),
                                        )
                                      ],
                                    )
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Row(
                      spacing: 8,
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: appColors.badgeCardBackgroundColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Center(
                              child: Column(
                                spacing: 8,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Text(
                                      "Lipophilicity (LogP)\n(<= 5)",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        color: appColors.textColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Row(
                                      spacing: 4,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        molecule.logP! <= 5 ? Flexible(child: Icon(Icons.check_box)) : Flexible(child: Icon(Icons.check_box_outline_blank)),
                                        Flexible(
                                          child: Text(
                                            "${molecule.logP}",
                                            style: GoogleFonts.inter(
                                              color: appColors.textColor,
                                              fontSize: 12
                                            )
                                          ),
                                        )
                                      ],
                                    )
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: appColors.badgeCardBackgroundColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Center(
                              child: Column(
                                spacing: 8,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Text(
                                      "Hydrogen Bond Acceptor\n(<= 10)",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        color: appColors.textColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Row(
                                      spacing: 4,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        molecule.hydrogenBondAcceptors! <= 10 ? Flexible(child: Icon(Icons.check_box)) : Flexible(child: Icon(Icons.check_box_outline_blank)),
                                        Flexible(
                                          child: Text(
                                            "${molecule.hydrogenBondAcceptors}",
                                            style: GoogleFonts.inter(
                                              color: appColors.textColor,
                                              fontSize: 12
                                            )
                                          ),
                                        )
                                      ],
                                    )
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]
      ],
    );

    return moleculeDetailBody;
  }
  
  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Column(
      spacing: 16,
      children: [
        Flexible(
          flex: 4,
          child: setFileBar(appColors)
        ),
        Flexible(
          flex: 47,
          child: setMoleculeDetailBody(appColors)
        )
      ],
    );
  }
}