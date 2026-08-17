import 'package:binf_educational_app_redone/domain/models/activity_config.dart';
import 'package:binf_educational_app_redone/domain/models/code_block.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/activity_body.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class PythonScriptingScreen extends ConsumerStatefulWidget {
  final ActivityConfig config;
  final String activityName;
  
  const PythonScriptingScreen({super.key, required this.config, required this.activityName});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PythonScriptingScreenState();
}

class _PythonScriptingScreenState extends ConsumerState<PythonScriptingScreen> with SingleTickerProviderStateMixin {
  bool drawerOpen = false;
  List<String> terminalOutput = [];
  String runScriptStartText = "";

  Map<int, List<String>> correctLineOrder = {};

  Map<int, dynamic> currentLineState = {};

  Map<String, dynamic> codeLineProperties = {};

  @override
  void initState() {
    super.initState();

    int i = 0;

    for (CodeBlock codeBlock in widget.config.codeBlocks!) {
        codeLineProperties[codeBlock.codeBlockId] = {
          "isPlaced": false,
          "isPlacedCorrectly": false,
          "lineIndex": 0
        };

        for (int correctPosition in codeBlock.correctPositions) {
          if (correctLineOrder[correctPosition] != null) {
            correctLineOrder[correctPosition]!.add(codeBlock.codeBlockId);
          }
          else {
            correctLineOrder[correctPosition] = [codeBlock.codeBlockId];
          }
        }

        currentLineState[i+1] = null;

        i += 1; 
    }

    widget.config.codeBlocks!.shuffle();
  }

  void _resetActivity() {
    setState(() {
      int i = 0;
      
      for (CodeBlock codeBlock in widget.config.codeBlocks!) {
          codeLineProperties[codeBlock.codeBlockId] = {
            "isPlaced": false,
            "isPlacedCorrectly": false,
            "lineIndex": 0
          };

          currentLineState[i + 1] = null;

          i += 1;
      }
    });
  }

  void runScript() {
    List<String> output = [];
    List<String> executedCodeBlockIds = [];
    bool successfulExecution = true;

    for (int lineIndex in currentLineState.keys.toList()) {
      if (currentLineState[lineIndex] != null) {
        CodeBlock codeBlock = currentLineState[lineIndex];
        successfulExecution = true;

        for (String reqLineId in codeBlock.requires.keys.toList()) {
          if (!executedCodeBlockIds.contains(reqLineId)) {
            successfulExecution = false;
            String errorString = "Error line $lineIndex:";
            for(String errMsg in codeBlock.requires[reqLineId]) {
              if (errMsg.split(":Logic").length == 1) {
                output.add("$errorString $errMsg");
              }
              else {
                output.add(errMsg);
              }
            }
          }
        }

        if (successfulExecution) {
          executedCodeBlockIds.add(codeBlock.codeBlockId);
        }
        else {
          break;
        }
      }
    }

    if (successfulExecution) {
      bool allCorrect = true;

      for (int pos in correctLineOrder.keys.toList()) {
        if (currentLineState[pos] != null) {
          if (!correctLineOrder[pos]!.contains(currentLineState[pos].codeBlockId)) {
            allCorrect = false;
          }
        }
        else {
          allCorrect = false;
        }
      }

      if (allCorrect) {
        output.add(widget.config.correctOutput!);
      }
      else {
        for (String idOrder in widget.config.wrongOutput!.keys.toList()) {
          List<String> idOrderList = idOrder.split(",");
          List<String> actualIdOrder = [];

          for (int codeBlockIdx in currentLineState.keys.toList()) {
            if (currentLineState[codeBlockIdx] != null) {
              if (idOrderList.contains(currentLineState[codeBlockIdx].codeBlockId) || idOrderList.contains(currentLineState[codeBlockIdx].codeBlockId + "|null")) {
                if (idOrderList.contains(currentLineState[codeBlockIdx].codeBlockId)) {
                  actualIdOrder.add(currentLineState[codeBlockIdx].codeBlockId);
                }
                else {
                  actualIdOrder.add(currentLineState[codeBlockIdx].codeBlockId + "|null");
                }
              }
            }
          }

          if (idOrderList.length > actualIdOrder.length) {
            int idListLengthDiff = idOrderList.length - actualIdOrder.length;
            int insertLimit = 0;

            for (int i = 0; i < idOrderList.length; i++) {
              if (!actualIdOrder.contains(idOrderList[i]) && idOrderList[i].split("|null").length > 1) {
                if (i >= actualIdOrder.length) {
                  actualIdOrder.add("");
                }
                else {
                  actualIdOrder.insert(i, "");
                }
                insertLimit += 1;
              }

              if (insertLimit == idListLengthDiff) {
                break;
              }
            }
          }

          for (int i = 0; i < actualIdOrder.length; i++) {
            if (actualIdOrder[i] == "" && idOrderList[i].split("|null").length > 1) {
              actualIdOrder[i] = idOrderList[i];
            }
          }

          if (listEquals(idOrderList, actualIdOrder)) {
            output.add(widget.config.wrongOutput![idOrder]!);
            if (widget.config.wrongOutput![idOrder]!.contains("Error:")) {
              successfulExecution = false;
            }
            break;
          }
        }
      }
    }

    setState(() {
      terminalOutput = output;
      runScriptStartText = successfulExecution ? "Script ran without errors" : "Script ran with errors";
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
        objectiveText: widget.config.objectives[0], 
        barColor: Color.fromRGBO(48, 48, 49, 1),
        barBorderColor: Color.fromRGBO(67, 67, 67, 1),
        barTextColor: Color.fromRGBO(246, 252, 253, 1),
        activityContent: Column(
          children: [
            Flexible(
              flex: 86,
              child: Column(
                children: [
                  Flexible(
                    flex: 27,
                    fit: FlexFit.tight,
                    child: Container(
                      width: double.infinity,
                      color: Color.fromRGBO(44, 45, 48, 1),
                      child: LayoutBuilder(
                        builder: (context, constraints) => SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (int i = 0; i < widget.config.codeBlocks!.length; i++) ... [
                                    Flexible(
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          //maxHeight: 25
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Container(
                                                color: Color.fromRGBO(62, 62, 65, 1),
                                                child: Center(
                                                  child: Text(
                                                    "${i + 1}",
                                                    style: GoogleFonts.jetBrainsMono(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                      color: Color.fromRGBO(246, 252, 253, 1)
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 8,
                                              child: _buildCodeLineDropTarget(i+1)
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ),
                      )                   
                    )
                  ),
                  Flexible(
                    flex: 16,
                    child: Container(
                      color: appColors.secondaryColor,
                      child: Column(
                        children: [
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(left: 8, right: 8),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(43, 43, 43, 1),
                                border: Border(
                                  top: BorderSide(
                                    color: Color.fromRGBO(69, 69, 69, 1),
                                    width: 1.0
                                  )
                                )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Terminal",
                                      style: GoogleFonts.inter(
                                        color: Color.fromRGBO(246, 252, 253, 1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          runScriptStartText = "Running Script...";
                                        });
                                        runScript();
                                      },
                                      child: Icon(Icons.play_arrow, color: Colors.greenAccent)
                                    )
                                  )
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 13,
                            fit: FlexFit.tight,
                            child: Container(
                              color: Color.fromRGBO(34, 34, 34, 1),
                              height: double.infinity,
                              width: double.infinity,
                              padding: EdgeInsets.only(left:16, top:8),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  spacing: 16,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "> $runScriptStartText",
                                      style: GoogleFonts.firaCode(
                                        color: Color.fromRGBO(246, 252, 253, 1),
                                        fontSize: 14
                                      ),
                                    ),
                                    for (String output in terminalOutput) ... [
                                      Text(
                                        output,
                                        style: GoogleFonts.firaCode(
                                          color: Color.fromRGBO(246, 252, 253, 1),
                                          fontSize: 14
                                        ),
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                            )
                          )
                        ],
                      ),
                    )
                  ),
                  Flexible(
                    flex: !drawerOpen ? 3 : 22,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                drawerOpen = !drawerOpen;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(62, 63, 67, 1),
                                border: Border(
                                  top: BorderSide(
                                    color: Color.fromRGBO(77, 77, 77, 1),
                                    width: 1.0
                                  )
                                )
                              ),
                              child: !drawerOpen ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.arrow_drop_up, color: Color.fromRGBO(246, 252, 253, 1),)
                                    )
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                            icon: const Icon(Icons.refresh, color: Color.fromRGBO(246, 252, 253, 1)),
                                            tooltip: 'Reset Activity',
                                            onPressed: _resetActivity,
                                          ),
                                    ),
                                  ),
                                ],
                              ) : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.arrow_drop_down, color: Color.fromRGBO(246, 252, 253, 1),)
                                    )
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                            icon: const Icon(Icons.refresh, color: Color.fromRGBO(246, 252, 253, 1)),
                                            tooltip: 'Reset Activity',
                                            onPressed: _resetActivity,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (drawerOpen) ... [
                          Flexible(
                            flex: 19,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(62, 63, 67, 1),
                                border: Border(
                                  top: BorderSide(
                                    color: Color.fromRGBO(105, 105, 105, 1),
                                    width: 1.0
                                  )
                                )
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    spacing: 16,
                                    children: [
                                      for (CodeBlock codeBlock in widget.config.codeBlocks!) ... [
                                        _buildCodeLineTray(codeBlock)
                                      ]
                                    ],
                                  ),
                                ),
                              )
                            ),
                          ),
                        ]
                      ],
                    )
                  )
                ]
              )
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: InkWell(
                onTap: () {
              
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: appColors.primaryColor
                  ),
                  child: Center(
                    child: Text(
                      "Finish",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  Widget _buildCodeLineDropTarget(int lineIndex) {
    return DragTarget<CodeBlock>(
      onWillAcceptWithDetails: (details) => true,
      onAcceptWithDetails: (details) {
        final codeBlock = details.data;
        //print(codeLine);
        setState(() {
          if (currentLineState[lineIndex] != null) {
            codeLineProperties[currentLineState[lineIndex].codeBlockId]["isPlaced"] = false;
            codeLineProperties[currentLineState[lineIndex].codeBlockId]["isPlacedCorrectly"] = false;
            codeLineProperties[currentLineState[lineIndex].codeBlockId]["lineIndex"] = 0;
          }

          codeLineProperties[codeBlock.codeBlockId]["isPlaced"] = true;
          codeLineProperties[codeBlock.codeBlockId]["lineIndex"] = lineIndex;

          currentLineState[lineIndex] = codeBlock;

          if (correctLineOrder[lineIndex] == codeBlock.codeBlockId) {
            codeLineProperties[codeBlock.codeBlockId]["isPlacedCorrectly"] = true;
          } else {
            codeLineProperties[codeBlock.codeBlockId]["isPlacedCorrectly"] = false;
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
            color: const Color.fromRGBO(44, 45, 48, 1),
            //borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHovering
                  ? Colors.cyanAccent
                  : (currentLineState[lineIndex] == null ?Colors.white24 : correctLineOrder[lineIndex]!.contains(currentLineState[lineIndex].codeBlockId) ? Colors.greenAccent : Colors.redAccent),
              width: isHovering ? 3.0 : 1,
            ),
            boxShadow: isHovering
                ? [BoxShadow(color: Colors.cyanAccent.withValues(alpha: 0.3), blurRadius: 20)]
                : [],
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "",
                        style: GoogleFonts.jetBrainsMono(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color.fromRGBO(246, 252, 253, 1)
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (currentLineState[lineIndex] != null) 
                AnimatedScale(
                  scale: 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                        currentLineState[lineIndex].code!,
                        style: GoogleFonts.jetBrainsMono(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color.fromRGBO(246, 252, 253, 1)
                        ),
                      ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCodeLineTray(CodeBlock codeBlock) {
    return Opacity(
      opacity: codeLineProperties[codeBlock.codeBlockId]["isPlaced"] ? 0.3 : 1.0,
      child: Draggable<CodeBlock>(
        data: codeBlock,
        maxSimultaneousDrags: codeLineProperties[codeBlock.codeBlockId]["isPlaced"] ? 0 : 1,
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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                //color: Color.fromRGBO(83, 85, 96, 1)
              ),
              child: Center(
                child: Text(
                  codeBlock.code,
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(246, 252, 253, 1)
                  ),
                ),
              ),
            ),
          ),
        ),

        childWhenDragging: Opacity(
          opacity: 0.2,
          child: Container(),
        ),

        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(83, 85, 96, 1),
            borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              codeBlock.code,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(246, 252, 253, 1)
              ),
            ),
          ),
        ),
      ),
    );
  }
}