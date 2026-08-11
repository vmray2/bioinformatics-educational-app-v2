import 'package:binf_educational_app_redone/data/local/collections/molecule_collection.dart';
import 'package:binf_educational_app_redone/domain/models/activity_config.dart';
import 'package:binf_educational_app_redone/domain/models/binding_ligand.dart';
import 'package:binf_educational_app_redone/presentation/activity/data_hub_query_builder/molecule_details_screen.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/activity_body.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/standard_card.dart';
import 'package:binf_educational_app_redone/providers/molecule_provider.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DockingBestFitScreen extends ConsumerStatefulWidget {
  final ActivityConfig config;
  final String activityName;
  
  const DockingBestFitScreen({super.key, required this.config, required this.activityName});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DockingBestFitScreenState();
}

class _DockingBestFitScreenState extends ConsumerState<DockingBestFitScreen> with SingleTickerProviderStateMixin {
  int ligandCarouselIdx = 0;

  BindingLigand? dockedLigand;
  String? feedbackMessage;
  bool isSuccess = false;
  int? dockedLigandIdx;

  void _resetActivity() {
    setState(() {
      dockedLigand = null;
      feedbackMessage = null;
      isSuccess = false;
      dockedLigandIdx = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    String receptorMoleculeId = widget.config.receptorPocket!.moleculeId;
    List<String> ligandMoleculeIds = widget.config.candidateLigands!.map((ligand) => ligand.ligandMoleculeId).toList();
    
    final dockingArgs = DockingArgs(
      receptorId: receptorMoleculeId,
      candidateIds: ligandMoleculeIds,
    );

    final dockingDataAsync = ref.watch(dockingStreamProvider(dockingArgs));

    return Scaffold(
      backgroundColor: appColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          widget.activityName,
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
          ),
        )
      ),
      body: dockingDataAsync.when(
        loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (err, stack) => Scaffold(body: Center(child: Text('Data error: $err'))),
        data: (dockingData) {
          print(dockingData.receptor.name);
          return ActivityBody(
            objectiveText: widget.config.objectives[0], 
            activityContent: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 16,
                children: [
                  if (dockedLigand != null) ... [
                    Flexible(
                      flex: 15,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSuccess ? Colors.greenAccent : Colors.redAccent,
                              width: 2
                            )
                          ),
                          child: StandardCard(
                            cardChild: Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16,  top: 8),
                              child: Column(
                                spacing: 8,
                                children: [
                                  if (isSuccess) ... [
                                    Flexible(
                                      flex: 2,
                                      child: Text(
                                        "Score ${widget.config.candidateLigands![dockedLigandIdx!].pocketMatchScore}%: Docking Successful!",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: appColors.textColor
                                        ),
                                      ),
                                    ),
                                  ]
                                  else ... [
                                    Flexible(
                                      flex: 2,
                                      child: Text(
                                        "Score ${widget.config.candidateLigands![dockedLigandIdx!].pocketMatchScore}%: Docking Failed",
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: appColors.textColor
                                        ),
                                      ),
                                    ),
                                  ],
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 4,
                                    child: Text(
                                      widget.config.candidateLigands![dockedLigandIdx!].feedback,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                                        
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ),
                        ),
                      )
                    )
                  ],
                  Flexible(
                    flex: 34,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, top: dockedLigand != null ? 0 : 8),
                      child: StandardCard(
                        cardChild: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        widget.config.receptorPocket!.name,
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: appColors.textColor
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: IconButton(
                                        icon: const Icon(Icons.refresh),
                                        tooltip: 'Reset Activity',
                                        onPressed: _resetActivity,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 19,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        print("View Receptor Pocket Requiremewnts");
                                        showDialog(
                                          context: context, 
                                          builder: (BuildContext context) {
                                          return _buildReceptorRequirementsDialog(appColors);
                                          }
                                        );
                                      },
                                      child: _buildReceptorDropTarget(dockingData)
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 28,
                    child: CarouselSlider.builder(
                      itemCount: dockingData.candidates.length,
                      itemBuilder: (context, index, realIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: StandardCard(
                            cardChild: Padding(
                              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8, bottom: 16),
                              child: Column(
                                spacing: 8,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      dockingData.candidates[ligandCarouselIdx].name,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: appColors.textColor
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 20,
                                    fit: FlexFit.tight,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MoleculeDetailsScreen(config: widget.config, activityName: widget.activityName, moleculeId: dockingData.candidates[ligandCarouselIdx].id,)
                                          )
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: appColors.badgeCardBackgroundColor,
                                          borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: _buildLigandTray(dockingData),
                                      ),
                                    ),
                                  ),
                                  /* Flexible(
                                    flex: 3,
                                    fit: FlexFit.tight,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MoleculeDetailsScreen(config: widget.config, activityName: widget.activityName, moleculeId: dockingData.candidates[ligandCarouselIdx].id,)
                                          )
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: appColors.secondaryColor,
                                          borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: Center(
                                          child: Text(
                                            "View Ligand Details",
                                            style: GoogleFonts.inter(
                                              color: appColors.textColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ) */
                                ],
                              ),
                            )
                          ),
                        );
                      },
                      options: CarouselOptions(
                        //autoPlay: true,
                        enlargeCenterPage: false,
                        aspectRatio: 2,
                        //height: 180,
                        //height: MediaQuery.of(context).size.height / 3,
                        initialPage: ligandCarouselIdx,
                        height: double.infinity,
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            ligandCarouselIdx = index;
                          });
                        },
                      )
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                        dockingData.candidates.length,
                        (index) => Flexible(
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ligandCarouselIdx == index ? appColors.tertiaryColor : Colors.grey
                            ),
                          ),
                        )
                      )
                    )
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: InkWell(
                      onTap: () {
                        if (isSuccess) {
                          print("Activity Complete!");
                        }
                        else {
                          print("Dock the correct molecule to complete this activity");
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isSuccess ? appColors.primaryColor : appColors.primaryColor!.withValues(alpha: 0.4)
                        ),
                        child: Center(
                          child: Text(
                            "Finish",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: isSuccess ? appColors.textColor : appColors.textColor!.withValues(alpha: 0.4)
                            ),
                          ),
                        ),
                      ),
                    )
                  )
                ],
              ),
            ),
          );
        } 
      )
    );
  }
  
  Widget _buildReceptorDropTarget(DockingData dockingData) {
    return DragTarget<BindingLigand>(
      onWillAcceptWithDetails: (details) => dockedLigand == null,
      onAcceptWithDetails: (details) {
        final ligand = details.data;
        setState(() {
          dockedLigand = ligand;
          dockedLigandIdx = ligandCarouselIdx;
          if (widget.config.candidateLigands![dockedLigandIdx!].isKnownBinder) {
            isSuccess = true;
            feedbackMessage = 'SUCCESS: ${ligand.name} docked successfully!\n${ligand.feedback}';
            print(feedbackMessage);
          } else {
            isSuccess = false;
            feedbackMessage = 'REJECTED: ${ligand.name} cannot bind.\n${ligand.feedback}';
            print(feedbackMessage);
          }
        });
      },
      builder: (context, candidateData, rejectedData) {
        final bool isHovering = candidateData.isNotEmpty;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          //width: 300,
          //height: 300,
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A3D),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHovering
                  ? Colors.cyanAccent
                  : (isSuccess ? Colors.greenAccent : !isSuccess && dockedLigand != null ? Colors.redAccent : Colors.white24),
              width: isHovering ? 3.0 : 1.5,
            ),
            boxShadow: isHovering
                ? [BoxShadow(color: Colors.cyanAccent.withValues(alpha: 0.3), blurRadius: 20)]
                : [],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
                    child: Image.asset(
                      dockingData.receptor.pathTo3DStructure!,
                      fit: BoxFit.fill,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.account_tree_outlined,
                        size: 100,
                        color: Colors.white24,
                      ),
                    ),
                  ),
                ),
              ),

              if (dockedLigand != null)
                AnimatedScale(
                  scale: 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: isSuccess ? Colors.greenAccent.withValues(alpha: 0.4) : Colors.redAccent.withValues(alpha: 0.4),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      dockingData.candidates[dockedLigandIdx!].pathTo3DStructure!,
                      width: 140,
                      height: 140,
                    ),
                  ),
                ),

              if (dockedLigand == null)
                Positioned(
                  bottom: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      isHovering ? 'Release to Dock' : 'Drop Pocket Target',
                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLigandTray(DockingData dockingData) {
    final MoleculeCollection ligand = dockingData.candidates[ligandCarouselIdx];
    bool isCurrentlyDocked;
    if (dockedLigandIdx == null) {
      isCurrentlyDocked = false;
    }
    else{
      isCurrentlyDocked = dockedLigand?.ligandMoleculeId == dockingData.candidates[dockedLigandIdx!].moleculeId;
    }

    return Opacity(
      opacity: isCurrentlyDocked ? 0.3 : 1.0,
      child: Draggable<BindingLigand>(
        data: widget.config.candidateLigands![ligandCarouselIdx],
        maxSimultaneousDrags: isCurrentlyDocked ? 0 : 1,
        dragAnchorStrategy: pointerDragAnchorStrategy,
        feedback: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.cyanAccent),
            ),
            child: Image.asset(
              ligand.pathTo3DStructure!,
              width: 90,
              height: 90,
              errorBuilder: (_, __, ___) => const Icon(Icons.science, color: Colors.cyanAccent, size: 50),
            ),
          ),
        ),

        childWhenDragging: Opacity(
          opacity: 0.2,
          child: Container(),
        ),

        child: Image.asset(
          ligand.pathTo3DStructure!,
        ),
      ),
    );
  }

  Widget _buildReceptorRequirementsDialog(AppColors appColors) {
    return AlertDialog(
      title: Text(
        "Receptor Requirements",
        style: GoogleFonts.inter(

        ),
      ),
      backgroundColor: appColors.standardCardBackgroundColor,
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 100
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: appColors.badgeCardBackgroundColor,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              spacing: 8,
                              children: [
                                Text(
                                  "Molecular Weight",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                Text(
                                  "${widget.config.receptorPocket!.minMolecularWeight} - ${widget.config.receptorPocket!.maxMolecularWeight}",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: appColors.textColor
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: appColors.badgeCardBackgroundColor,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            spacing: 8,
                            children: [
                              Text(
                                "Preferred Environment",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              Text(
                                widget.config.receptorPocket!.preferredEnvironment,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: appColors.textColor
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: appColors.badgeCardBackgroundColor,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            spacing: 8,
                            children: [
                              Text(
                                "Hydrophobic Features",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              Text(
                                "${widget.config.receptorPocket!.minHydrophobicFeatures}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: appColors.textColor
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 100
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: appColors.badgeCardBackgroundColor,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            spacing: 8,
                            children: [
                              Text(
                                "Hydrogen Bond Acceptors",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              Text(
                                "${widget.config.receptorPocket!.requiredHydrogenBondAcceptorRange[0]} - ${widget.config.receptorPocket!.requiredHydrogenBondAcceptorRange[1]}",
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: appColors.textColor
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: appColors.badgeCardBackgroundColor,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            spacing: 8,
                            children: [
                              Text(
                                "Hydrogen Bond Donors",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              Text(
                                "${widget.config.receptorPocket!.requiredHydrogenBondDonorRange[0]} - ${widget.config.receptorPocket!.requiredHydrogenBondDonorRange[1]}",
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: appColors.textColor
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          child: Text(
            "Close",
            style: GoogleFonts.inter(

            ),
          )
        )
      ],
    );
  }
}
