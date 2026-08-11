import 'package:binf_educational_app_redone/domain/models/activity_config.dart';
import 'package:binf_educational_app_redone/presentation/activity/sequence_alignment/sequence_alignment_matrix_traceback_screen.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/activity_body.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/standard_card.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SequenceAlignmentMatrixFillScreen extends ConsumerStatefulWidget {
  final ActivityConfig config;
  final String activityName;
  
  const SequenceAlignmentMatrixFillScreen({super.key, required this.config, required this.activityName});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SequenceAlignmentMatrixFillScreenState();
}

class _SequenceAlignmentMatrixFillScreenState extends ConsumerState<SequenceAlignmentMatrixFillScreen> with SingleTickerProviderStateMixin {
  List<String> scoreLabels = ["Match", "Mismatch", "Indel"];
  int selectedRow = 1;
  int selectedCol = 1;
  TextEditingController controller = TextEditingController();
  dynamic textFieldValue;
  List<List<dynamic>> userAnswers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.config.leftSequence!.length + 2; i++) {
      userAnswers.add([]);
      for (int j = 0; j < widget.config.topSequence!.length + 2; j++) {
        userAnswers[i].add(null);
      }
    }
    print(userAnswers);
  }

  bool matrixIsCorrect() {
    bool correct = true;

    for (int i = 1; i < userAnswers.length; i++) {
      for (int j = 1; j < userAnswers[i].length; j++) {
        if (userAnswers[i][j] != widget.config.matrixAnswers![i - 1][j - 1]) {
          correct = false;
          break;
        }
      }
      if (!correct) {
        break;
      }
    }

    return correct;
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
        objectiveText: widget.config.objectives[0], 
        activityContent: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              Flexible(
                flex: 14,
                child: StandardCard(
                  cardChild: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text(
                            "Scoring System",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
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
                flex: 51,
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
                          flex: 45,
                          child: Container(
                            padding: EdgeInsets.only(top: 8, right: 16, bottom: 16),
                            decoration: BoxDecoration(
                              color: appColors.badgeCardBackgroundColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 34,
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
                                          setState(() {
                                            selectedRow = row;
                                            selectedCol = col;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: userAnswers[row][col] == null ? appColors.secondaryColor : userAnswers[row][col] == widget.config.matrixAnswers![row - 1][col - 1] ? const Color.fromARGB(255, 140, 196, 176) : const Color.fromARGB(255, 221, 134, 134) ,
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Color.fromRGBO(102, 115, 164, 1),
                                              width: selectedCol == col && selectedRow == row ? 3 : 0
                                            )
                                          ),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                if (userAnswers[row][col] == widget.config.matrixAnswers![row-1][col-1]) ... [
                                                  Flexible(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(top: 4.0),
                                                      child: Text(
                                                        widget.config.matrixTracebackAnswers![row- 1][col - 1],
                                                        textAlign: TextAlign.start,
                                                        style: GoogleFonts.inter(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                                Flexible(
                                                  child: Center(
                                                    child: Text(
                                                      userAnswers[row][col] != null ? "${userAnswers[row][col]}" : "?",
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
                                Flexible(
                                  flex: 4, 
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:16.0, right: 0),
                                    child: Row(
                                      spacing: 8,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          flex: 5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color.fromRGBO(191, 191, 191, 1),
                                                width: 1
                                              ),
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12), topRight: Radius.circular(4), bottomRight: Radius.circular(4))
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(214, 214, 214, 1),
                                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "($selectedRow, $selectedCol)",
                                                        style: GoogleFonts.inter(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w500
                                                        ),
                                                      )
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  flex: 3,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: appColors.standardCardBackgroundColor,
                                                      borderRadius: BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4))
                                                    ),
                                                    child: TextField(
                                                      controller: controller,
                                                      keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                                                      inputFormatters: <TextInputFormatter>[
                                                        FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*'))
                                                      ],
                                                      decoration: InputDecoration(
                                                        hintText: "Value",
                                                        contentPadding: EdgeInsets.all(4),
                                                      ),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          textFieldValue = value;
                                                        });      
                                                      },
                                                      onSubmitted: (value) {
                                                        if (textFieldValue != null) {
                                                          //int nextSelectedRow;
                                                          //int nextSelectedCol;
                                                          setState(() {
                                                            userAnswers[selectedRow][selectedCol] = double.parse(textFieldValue);
                                                          });
                                                        } 
                                                        else {
                                                          print("Please enter a value");
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          fit: FlexFit.tight,
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: appColors.secondaryColor,
                                              borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Next",
                                                style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            ),
                                          )
                                        )
                                      ],
                                    ),
                                  )
                                )
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
                flex: 5,
                fit: FlexFit.tight,
                child: InkWell(
                  onTap: () {
                    if (matrixIsCorrect()) {
                      print("Matrix is complete! Move on to traceback.");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SequenceAlignmentMatrixTracebackScreen(config: widget.config, activityName: widget.activityName,)
                        )
                      );
                    }
                    else {
                      print("Matrix has errors or is incomplete. Fill in matrix correctly before moving on.");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: matrixIsCorrect() ? appColors.primaryColor : appColors.primaryColor!.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: GoogleFonts.inter(
                          color: matrixIsCorrect() ? appColors.textColor : appColors.textColor!.withValues(alpha: 0.4),
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