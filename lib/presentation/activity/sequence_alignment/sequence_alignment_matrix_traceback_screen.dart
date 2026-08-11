import 'package:binf_educational_app_redone/domain/models/activity_config.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/activity_body.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/standard_card.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SequenceAlignmentMatrixTracebackScreen extends ConsumerStatefulWidget {
  final ActivityConfig config;
  final String activityName;
  
  const SequenceAlignmentMatrixTracebackScreen({super.key, required this.config, required this.activityName});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SequenceAlignmentMatrixTracebackScreenState();
}

class _SequenceAlignmentMatrixTracebackScreenState extends ConsumerState<SequenceAlignmentMatrixTracebackScreen> with SingleTickerProviderStateMixin {
  List<String> scoreLabels = ["Match", "Mismatch", "Indel"];
  int selectedRow = -1;
  int selectedCol = -1;
  String alignedTopSequence = "";
  String alignedLeftSequence = "";
  List<dynamic> selectedIndices = [];
  int currentLeftSeqIdx = 0;
  int currentTopSeqIdx = 0;
  TextEditingController controller = TextEditingController();
  String scoreTextFieldValue = "";

  @override
  void initState() {
    super.initState();

    setState(() {
      currentLeftSeqIdx = widget.config.leftSequence!.length - 1;
      currentTopSeqIdx = widget.config.topSequence!.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

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
      body: ActivityBody(
        objectiveText: widget.config.objectives[1], 
        activityContent: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              Flexible(
                flex: 13,
                child: StandardCard(
                  cardChild: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Text(
                            "Scoring System",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          fit: FlexFit.tight,
                          child: SizedBox(
                            height: double.infinity,
                            child: Row(
                              spacing: 16,
                              children: [
                                for (int i = 0; i < scoreLabels.length; i++) ... [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Container(
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: appColors.badgeCardBackgroundColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          spacing: 8,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "${widget.config.scoringSystem?[scoreLabels[i].toLowerCase()]}",
                                                style: GoogleFonts.inter(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                scoreLabels[i],
                                                style: GoogleFonts.inter(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ]
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ),
              Flexible(
                flex: 44,
                child: StandardCard(
                  cardChild: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Text(
                            "Sequence Alignment Matrix",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 34,
                          child: Container(
                            padding: EdgeInsets.only(top: 8, right: 16, bottom: 16),
                            decoration: BoxDecoration(
                              color: appColors.badgeCardBackgroundColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 32,
                                  child: GridView.builder(
                                    itemCount: (widget.config.leftSequence!.length + 2) * (widget.config.topSequence!.length + 2),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: widget.config.topSequence!.length + 2,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8,
                                      childAspectRatio: 1
                                    ), 
                                    itemBuilder: (BuildContext context, int index) {
                                      int row = index ~/ (widget.config.topSequence!.length + 2);
                                      int col = index % (widget.config.topSequence!.length + 2);
                                  
                                      return index == 0 ? Container() : 
                                      row == 0 || col == 0 ? 
                                      Center(
                                        child: Text(
                                          (row == 0 && col == 1) || (row == 1 && col == 0) ? "-" : 
                                          row == 0 && col > 1 && col - 2 < widget.config.topSequence!.length ? widget.config.topSequence![col - 2] :
                                          row > 1 && col == 0 && row - 2 < widget.config.leftSequence!.length ? widget.config.leftSequence![row - 2] : "$row $col",
                                          style: GoogleFonts.inter(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ) : 
                                      InkWell(
                                        onTap: () {
                                          //widget.config.matrixTracebackAnswers![row - 1][col - 1].toString().split("");

                                          if (selectedIndices.isEmpty && (row == widget.config.leftSequence!.length + 1 && col == widget.config.topSequence!.length + 1)) {
                                            //String leftSeqChar = widget.config.leftSequence![row - 2];
                                            //String topSeqChar = widget.config.topSequence![col - 2];

                                            setState(() {
                                              selectedRow = row;
                                              selectedCol = col;
                                              selectedIndices.add("$row,$col");
                                              alignedLeftSequence += widget.config.leftSequence![currentLeftSeqIdx];
                                              alignedTopSequence += widget.config.topSequence![currentTopSeqIdx];
                                              currentLeftSeqIdx -= 1;
                                              currentTopSeqIdx -= 1;
                                            });
                                          }
                                          else {
                                            String directionString = widget.config.matrixTracebackAnswers![row - 1][col - 1];
                                            bool correctDirection = false;
                                            String leftSeqChar = "";
                                            String topSeqChar = "";
                                            
                                            if (selectedIndices.contains("$row,$col")) {
                                              if (row == selectedRow && col == selectedCol) {
                                                setState(() {
                                                  selectedIndices.remove("$row,$col");
                                                  alignedLeftSequence[0] != "-" ? currentLeftSeqIdx += 1 : currentLeftSeqIdx;
                                                  alignedTopSequence[0] != "-" ? currentTopSeqIdx += 1 : currentTopSeqIdx;
                                                  alignedTopSequence = alignedTopSequence.replaceRange(0, 1, "");
                                                  alignedLeftSequence = alignedLeftSequence.replaceRange(0, 1, "");
                                                });
                                              }
                                              else if (row <= selectedRow + 1 && col <= selectedCol + 1 && !selectedIndices.contains("$selectedRow,$selectedCol")) {
                                                setState(() {
                                                  selectedRow = row;
                                                  selectedCol = col;
                                                  selectedIndices.remove("$row,$col");
                                                  alignedLeftSequence[0] != "-" ? currentLeftSeqIdx += 1 : currentLeftSeqIdx;
                                                  alignedTopSequence[0] != "-" ? currentTopSeqIdx += 1 : currentTopSeqIdx;
                                                  alignedTopSequence = alignedTopSequence.replaceRange(0, 1, "");
                                                  alignedLeftSequence = alignedLeftSequence.replaceRange(0, 1, "");
                                                });
                                              }
                                            }
                                            else if (row == selectedRow - 1 && col == selectedCol - 1 && selectedIndices.contains("$selectedRow,$selectedCol") && directionString.contains("D")) {
                                              correctDirection = true;
                                            }
                                            else if (row == selectedRow && col == selectedCol - 1 && selectedIndices.contains("$selectedRow,$selectedCol") && directionString.contains("L")) {
                                              leftSeqChar = "-";
                                              correctDirection = true;
                                            }
                                            else if (row == selectedRow - 1 && col == selectedCol && selectedIndices.contains("$selectedRow,$selectedCol") && directionString.contains("T")) {
                                              topSeqChar = "-";
                                              correctDirection = true;
                                            }
                                            else if(row == selectedRow && col == selectedCol) {
                                              List<String> coor = selectedIndices[selectedIndices.length - 1].toString().split(",");
                                              
                                              if (int.parse(coor[0]) == row) {
                                                leftSeqChar = "-";
                                              }

                                              if (int.parse(coor[1]) == col) {
                                                topSeqChar = "-";
                                              }    

                                              correctDirection = true;
                                            }

                                            if (correctDirection) {
                                              setState(() {
                                                selectedRow = row;
                                                selectedCol = col;
                                                selectedIndices.contains("$row,$col") ? selectedIndices.remove("$row,$col") : selectedIndices.add("$row,$col");
                                                alignedTopSequence = topSeqChar != "-" ? widget.config.topSequence![currentTopSeqIdx] + alignedTopSequence : "-$alignedLeftSequence";
                                                alignedLeftSequence = leftSeqChar != "-" ? widget.config.leftSequence![currentLeftSeqIdx] + alignedLeftSequence : "-$alignedLeftSequence";
                                                leftSeqChar != "-" ? currentLeftSeqIdx -= 1 : currentLeftSeqIdx;
                                                topSeqChar != "-" ? currentTopSeqIdx -= 1 : currentTopSeqIdx;
                                              });
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: selectedIndices.contains("$row,$col") ? appColors.primaryColor : appColors.secondaryColor,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Color.fromRGBO(102, 115, 164, 1),
                                              width: selectedCol == col && selectedRow == row ? 3 : 0
                                            )
                                          ),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 4.0),
                                                    child: Text(
                                                      widget.config.matrixTracebackAnswers![row - 1][col - 1],
                                                      textAlign: TextAlign.start,
                                                      style: GoogleFonts.inter(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Center(
                                                    child: Text(
                                                      "${widget.config.matrixAnswers![row - 1][col - 1]}",
                                                      style: GoogleFonts.inter(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ),
                                        ),
                                      );
                                    }
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ),
              Flexible(
                flex: 11,
                child: StandardCard(
                  cardChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text(
                            "Alignment",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: appColors.textColor
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Row(
                            spacing: 8,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          spacing: 8,
                                          children: [
                                            for (String seqChar in alignedTopSequence.split("")) ... [
                                              Flexible(
                                                child: Text(
                                                  seqChar,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: appColors.textColor
                                                  )
                                                ),
                                              )
                                            ]
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Row(
                                          spacing: 8,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            for (int i = 0; i < alignedLeftSequence.length; i++) ... [
                                              Flexible(
                                                child: VerticalDivider(
                                                  color: alignedLeftSequence.split("")[i] == alignedTopSequence.split("")[i] ? appColors.textColor : appColors.textColor!.withValues(alpha: 0.0),
                                                  thickness: 1,
                                                  width: 10,
                                                ),
                                              )
                                            ]
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          spacing: 8,
                                          children: [
                                            for (String seqChar in alignedLeftSequence.split("")) ... [
                                              Flexible(
                                                child: Text(
                                                  seqChar,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: appColors.textColor
                                                  )
                                                ),
                                              )
                                            ]
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      spacing: 8,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 16.0, right: 16),
                                            child: TextField(
                                              controller: controller,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16
                                              ),
                                              keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*'))
                                              ],
                                              decoration: InputDecoration(
                                                hintText: "Value",
                                                contentPadding: EdgeInsets.all(6),
                                              ),
                                              onChanged: (value) {
                                                setState(() {
                                                  scoreTextFieldValue = value;
                                                });      
                                              },
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Score",
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                )
              ),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: InkWell(
                  onTap: () {
                    if (widget.config.correctAlignmentScore == double.parse(scoreTextFieldValue)) {
                      print("Correct Score! Activity Complete!");
                    }
                    else {
                      print("Incorrect Score. Try Again.");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color:  appColors.primaryColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: GoogleFonts.inter(
                          color: appColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                )
              )
            ],
          )
        ),
      ),
    );
  } 
}