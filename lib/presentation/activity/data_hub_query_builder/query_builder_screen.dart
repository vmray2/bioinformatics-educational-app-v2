import 'package:binf_educational_app_redone/domain/models/activity_config.dart';
import 'package:binf_educational_app_redone/domain/models/query_rule.dart';
import 'package:binf_educational_app_redone/presentation/activity/data_hub_query_builder/query_results_screen.dart';
import 'package:binf_educational_app_redone/providers/query_builder_provider.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class QueryBuilderScreen extends ConsumerStatefulWidget {
  final ActivityConfig config;
  final String activityName;
  
  const QueryBuilderScreen({super.key, required this.config, required this.activityName});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QueryBuilderScreenState();
}

class _QueryBuilderScreenState extends ConsumerState<QueryBuilderScreen> with SingleTickerProviderStateMixin {
  int activityStepIndex = 0;
  dynamic currentActivityScreen;

  // Data Hub Query Builder 
  List<Map<String, dynamic>> queryBuilderFieldRows = [];

  String plainTextQuery = "";
  String currentDatabase = "GENE";

  Map<String, dynamic> geneFields = {
    "Name": FilterField.name, 
    "Organism": FilterField.organism, 
    "Chromosome": FilterField.chromosome, 
    "Full Name": FilterField.fullName, 
    "Start Position": FilterField.startPosition, 
    "End Position": FilterField.endPosition
  };

  Map<String, dynamic> proteinFields = {
    "Name": FilterField.name, 
    "Organism": FilterField.organism, 
    "PDB ID": FilterField.pdbId, 
  };

  Map<String, dynamic> ligandFields = {
    "Name": FilterField.name, 
    "Lipinski": FilterField.lipinski, 
    "PubChem ID": FilterField.pubChemId, 
  };
  
  Map<String, dynamic> currentFieldList = {
    "Gene Name": FilterField.name, 
    "Organism": FilterField.organism, 
    "Chromosome": FilterField.chromosome, 
    "Full Name": FilterField.fullName, 
    "Start Position": FilterField.startPosition, 
    "End Position": FilterField.endPosition
  };

  List<Map<String, dynamic>> fieldRows = [
    {
      "condition": null,
      "field": "Name",
      "value": "",
      "remove": false,
      "textContoller": TextEditingController()
    },
  ];

  String generatePlainTextQuery() {
    String query = "";

    for (Map<String, dynamic> row in fieldRows) {
      if (row["condition"] == null) {
        query = "${row["value"]}[${row["field"]}]";
      }
      else {
        query += " ${row["condition"]} ${row["value"]}[${row["field"]}]";
      }
    }

    setState(() {
      plainTextQuery = query;
    });

    return query;
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    // ignore: unused_local_variable
    final draft = ref.watch(draftFilterProvider);
  
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
                              widget.config.objectives[activityStepIndex],
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
                            flex: 46,
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
                                spacing: 12,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 10,
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
                                      decoration: BoxDecoration(
                                        color: appColors.badgeCardBackgroundColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        spacing: 8,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              "Database",
                                              style: GoogleFonts.inter(
                                                color: appColors.textColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16
                                              )
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            child: Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: Color.fromRGBO(191, 191, 191, 1),
                                                  width: 1
                                                )
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  final RenderBox renderBox = context.findAncestorRenderObjectOfType<RenderBox>()!;
                                                  final Offset offset = renderBox.localToGlobal(Offset.zero); 
                                                  
                                                  showMenu( 
                                                    context: context, 
                                                    position: RelativeRect.fromRect( 
                                                      Rect.fromLTWH(offset.dx, offset.dy, renderBox.size.width, renderBox.size.height), 
                                                      Offset.zero & View.of(context).physicalSize, 
                                                    ), 
                                                    items: [ 
                                                      PopupMenuItem(value: "GENE", child: Text('GENE')), 
                                                      PopupMenuItem(value: "PROTEIN", child: Text('PROTEIN')), 
                                                      PopupMenuItem(value: "LIGAND", child: Text('LIGAND')), 
                                                    ], 
                                                  ).then((String? selectedValue) {
                                                    if (selectedValue != null) {
                                                      Map<String, dynamic> changedFieldList = {};
                                                      List<Map<String, dynamic>> changedFieldRows = fieldRows;

                                                      if (selectedValue == "GENE") {
                                                        changedFieldList = geneFields;
                                                      }
                                                      else if (selectedValue == "PROTEIN") {
                                                        changedFieldList = proteinFields;
                                                      }
                                                      else if (selectedValue == "LIGAND") {
                                                        changedFieldList = ligandFields;
                                                      }

                                                      for (dynamic row in changedFieldRows) {
                                                        row["field"] = "Name";
                                                      }

                                                      setState(() {
                                                        currentDatabase = selectedValue;
                                                        currentFieldList = changedFieldList;
                                                        fieldRows = changedFieldRows;
                                                      });
                                                    }
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      flex: 2, 
                                                      child: Text(currentDatabase)
                                                    ),
                                                    Flexible(
                                                      child: Icon(Icons.arrow_drop_down)
                                                    )
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
                                    flex: 31,
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                      decoration: BoxDecoration(
                                        color: appColors.badgeCardBackgroundColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            flex: 4,
                                            child: Text(
                                              "Build Query",
                                              style: GoogleFonts.inter(
                                                color: appColors.textColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16
                                              )
                                            ),
                                          ),
                                          Flexible(
                                            flex: 20,
                                            child: Container(
                                              padding: EdgeInsets.all(16),
                                              width: double.infinity,
                                              child: ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: fieldRows.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets.only(top: 4, bottom: 4),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      spacing: 8,
                                                      children: [
                                                        if (fieldRows[index]["condition"] != null) ... [
                                                          Flexible(
                                                            flex: 2,
                                                            child: ConstrainedBox(
                                                              constraints: BoxConstraints(
                                                                maxHeight: 40,
                                                                minHeight: 40
                                                              ),
                                                              child: Container(
                                                                padding: EdgeInsets.all(4),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(4),
                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                  border: Border.all(
                                                                    color: Color.fromRGBO(191, 191, 191, 1),
                                                                    width: 1
                                                                  )
                                                                ),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    final RenderBox renderBox = context.findAncestorRenderObjectOfType<RenderBox>()!;
                                                                    final Offset offset = renderBox.localToGlobal(Offset.zero); 
                                                                    
                                                                    showMenu( 
                                                                      context: context, 
                                                                      position: RelativeRect.fromRect( 
                                                                        Rect.fromLTWH(offset.dx, offset.dy, renderBox.size.width, renderBox.size.height), 
                                                                        Offset.zero & View.of(context).physicalSize, 
                                                                      ), 
                                                                      items: [ 
                                                                        PopupMenuItem(value: "AND", child: Text('AND')), 
                                                                        PopupMenuItem(value: "OR", child: Text('OR')), 
                                                                        PopupMenuItem(value: "NOT", child: Text('NOT')), 
                                                                      ], 
                                                                    ).then((String? selectedValue) {
                                                                      if (selectedValue != null) {
                                                                        setState(() {
                                                                          fieldRows[index]["condition"] = selectedValue;
                                                                        });
                                                                      }
                                                                    });
                                                                  },
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Flexible(
                                                                        flex: 2, 
                                                                        child: Text(fieldRows[index]["condition"])
                                                                      ),
                                                                      Flexible(
                                                                        child: Icon(Icons.arrow_drop_down)
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ]
                                                        else ... [
                                                          Flexible(flex: 2, child: Container())
                                                        ],
                                                        if (fieldRows[index]["field"] != null) ... [
                                                          Flexible(
                                                            flex: 3,
                                                            child: ConstrainedBox(
                                                              constraints: BoxConstraints(
                                                                maxHeight: 40,
                                                                minHeight: 40
                                                              ),
                                                              child: Container(
                                                                padding: EdgeInsets.all(4),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(4),
                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                  border: Border.all(
                                                                    color: Color.fromRGBO(191, 191, 191, 1),
                                                                    width: 1
                                                                  )
                                                                ),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    final RenderBox renderBox = context.findAncestorRenderObjectOfType<RenderBox>()!;
                                                                    final Offset offset = renderBox.localToGlobal(Offset.zero); 
                                                                    
                                                                    showMenu( 
                                                                      context: context, 
                                                                      position: RelativeRect.fromRect( 
                                                                        Rect.fromLTWH(offset.dx, offset.dy, renderBox.size.width, renderBox.size.height), 
                                                                        Offset.zero & View.of(context).physicalSize, 
                                                                      ), 
                                                                      items: [ 
                                                                        for (int i = 0; i < currentFieldList.length; i++) ... [
                                                                          PopupMenuItem(value: currentFieldList.keys.toList()[i], child: Text(currentFieldList.keys.toList()[i])), 
                                                                        ]
                                                                      ], 
                                                                    ).then((String? selectedValue) {
                                                                      if (selectedValue != null) {
                                                                        setState(() {
                                                                          fieldRows[index]["field"] = selectedValue;
                                                                        });
                                                                      }
                                                                    });
                                                                  },
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Flexible(
                                                                        flex: 3, 
                                                                        child: Text(
                                                                          fieldRows[index]["field"],
                                                                          overflow: TextOverflow.ellipsis,
                                                                          maxLines: 1,
                                                                        )
                                                                      ),
                                                                      Flexible(
                                                                        child: Icon(Icons.arrow_drop_down)
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )                                  
                                                        ],
                                                        if (fieldRows[index]["value"] != null) ... [
                                                          Flexible(
                                                            flex: 3,
                                                            fit: FlexFit.loose,
                                                            child: ConstrainedBox(
                                                              constraints: BoxConstraints(
                                                                maxHeight: 40
                                                              ),
                                                              child: Container(
                                                                padding: EdgeInsets.only(left: 4, right: 4),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(4),
                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                  border: Border.all(
                                                                    color: Color.fromRGBO(191, 191, 191, 1),
                                                                    width: 1
                                                                  )
                                                                ),
                                                                child: TextField(
                                                                  decoration: InputDecoration(
                                                                    hintText: "Value"
                                                                  ),
                                                                  onChanged: (value) {
                                                                    setState(() {
                                                                      fieldRows[index]["value"] = value;
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                        if (fieldRows[index]["remove"] != false) ... [
                                                          Flexible(
                                                            child: ConstrainedBox(
                                                              constraints: BoxConstraints(
                                                                minHeight: 30,
                                                                minWidth: 30,
                                                                maxHeight: 40,
                                                                maxWidth: 40
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    fieldRows.remove(fieldRows[index]);
                                                                  });
                                                                },
                                                                child: Container(
                                                                  //padding: EdgeInsets.all(8),
                                                                  decoration: BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                    color: appColors.secondaryColor
                                                                  ),
                                                                  child: Center(
                                                                    child: Icon(Icons.remove)
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ] 
                                                        else ... [
                                                          Flexible(child: Container())
                                                        ]
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          ),
                                          Flexible(
                                            flex: 4,
                                            child: InkWell(
                                              onTap: () {
                                                Map<String, dynamic> newRow = {
                                                  "condition": "AND",
                                                  "field": "Name",
                                                  "value": "",
                                                  "remove": true,
                                                  "textController": TextEditingController()
                                                };

                                                setState(() {
                                                  fieldRows.add(newRow);
                                                });
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: appColors.secondaryColor,
                                                      borderRadius: BorderRadius.circular(8)
                                                    ),
                                                    child: Text(
                                                      "Add Field +",
                                                      style: GoogleFonts.inter(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ),
                          Flexible(
                            flex: 25,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(bottom: 8, top: 8, left: 16, right: 16),
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
                                    flex: 3,
                                    child: Text(
                                      "Plain Text Query",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 19,
                                    fit: FlexFit.tight,
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: appColors.badgeCardBackgroundColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Text(
                                        plainTextQuery,
                                        style: GoogleFonts.inter(
                                          color: appColors.textColor,
                                          fontSize: 16
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 5,
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          generatePlainTextQuery();
                                        },
                                        child: Container(
                                          //padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: appColors.secondaryColor
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Generate",
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14
                                              ),
                                            ),
                                          )
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ),
                          Flexible(
                            flex: 5,
                            child: InkWell(
                              onTap: () {
                                // Add a new rule row:

                                /* if (currentDatabase == "GENE") {
                                  ref.read(draftFilterProvider.notifier).addRule(
                                    const QueryRule(
                                      field: FilterField.type,
                                      operator: FilterOperator.equals,
                                      value: MoleculeType.gene,
                                    ),
                                  );                                
                                }
                                else if (currentDatabase == "PROTEIN") {
                                  ref.read(draftFilterProvider.notifier).addRule(
                                    const QueryRule(
                                      field: FilterField.type,
                                      operator: FilterOperator.equals,
                                      value: MoleculeType.protein,
                                    ),
                                  );                                 
                                }
                                else if (currentDatabase == "LIGAND") {
                                  ref.read(draftFilterProvider.notifier).addRule(
                                    const QueryRule(
                                      field: FilterField.type,
                                      operator: FilterOperator.equals,
                                      value: MoleculeType.ligand,
                                    ),
                                  );                               
                                } */

                                ref.read(draftFilterProvider.notifier).clear();

                                int rowI = 0;
                                //Map<String, dynamic> previousRow = fieldRows[0];

                                for (Map<String, dynamic> row in fieldRows) {
                                  if (row["condition"] == "NOT") {
                                    ref.read(draftFilterProvider.notifier).addRule(
                                      QueryRule(
                                        field: currentFieldList[row["field"]],
                                        operator: FilterOperator.notEquals,
                                        value: row["value"],
                                      ),
                                    );
                                  }
                                  else {
                                    if (rowI + 1 < fieldRows.length) {
                                      if (fieldRows[rowI + 1]["condition"] == "OR") {
                                        ref.read(draftFilterProvider.notifier).addRule(
                                          QueryRule(
                                            field: currentFieldList[row["field"]],
                                            operator:  FilterOperator.equals,
                                            value: row["value"],
                                            connector: LogicalConnector.or
                                          ),
                                        );
                                      }
                                      else {
                                        ref.read(draftFilterProvider.notifier).addRule(
                                          QueryRule(
                                            field: currentFieldList[row["field"]],
                                            operator:  FilterOperator.equals,
                                            value: row["value"],
                                          ),
                                        );
                                      }
                                    }
                                    else {
                                      ref.read(draftFilterProvider.notifier).addRule(
                                        QueryRule(
                                          field: currentFieldList[row["field"]],
                                          operator:  FilterOperator.equals,
                                          value: row["value"],
                                        ),
                                      );
                                    }
                                  }

                                  rowI += 1;
                                  //previousRow = row;

                                  setState(() {
                                    
                                  });
                                }

                                /* ref.read(draftFilterProvider.notifier).updateRuleAt(
                                  lastIndex,
                                  draft.rules[lastIndex].copyWith(connector: LogicalConnector.or)
                                ); */

                                final draft2 = ref.read(draftFilterProvider);

                                int i = 0;

                                for (QueryRule rule in draft2.rules) {
                                  print("$i: \n${rule.toString()}\n");
                                  i += 1;
                                }
                                //print(draft2.rules.length);

                                ref.read(activeFilterProvider.notifier).applyDraft(draft2);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QueryResultsScreen(
                                      config: widget.config, 
                                      activityName: widget.activityName, 
                                      databaseType: currentDatabase,
                                    )
                                  )
                                );
                                //widget.runQuery(fieldRows);
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: appColors.primaryColor,
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                                child: Center(
                                  child: Text(
                                    "Run Query",
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