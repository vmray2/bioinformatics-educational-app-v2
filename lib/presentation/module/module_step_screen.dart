import 'package:binf_educational_app_redone/presentation/providers/curriculum_provider.dart';
//import 'package:binf_educational_app_redone/presentation/providers/user_progress_provider.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ModuleStepScreen extends ConsumerStatefulWidget {
  final String moduleId;
  
  const ModuleStepScreen({super.key, required this.moduleId});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ModuleStepScreenState();
}

class _ModuleStepScreenState extends ConsumerState<ModuleStepScreen> with SingleTickerProviderStateMixin{
  int stepIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    final moduleDetailAsync = ref.watch(moduleByIdProvider(widget.moduleId));
    //final userProgress = ref.watch(userProgressProvider);

    return moduleDetailAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(body: Center(child: Text('Data error: $err'))),
      data: (module) {
        return Scaffold(
          backgroundColor: appColors.backgroundColor, 
          appBar: AppBar(
            title: Column(
              //spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Module ${widget.moduleId.split("_")[1]}",
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    color: appColors.textColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  module.moduleName,
                  maxLines: 1,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: appColors.textColor,
                    fontWeight: FontWeight.w600,
                    height: 1.5
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50), 
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Step ${stepIndex + 1} of ${module.moduleSteps.length}",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: appColors.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromRGBO(194, 194, 194, 1), width: 1),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: LinearProgressIndicator(
                        value: (stepIndex + 1) / module.moduleSteps.length,
                        backgroundColor: Color.fromRGBO(249, 248, 248, 1),
                        color: appColors.tertiaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
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
              children: [
                Flexible(
                  flex: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 16,
                      children: [
                        Flexible(
                          flex: 25,
                          child: Container(
                            width: double.infinity,
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
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                spacing: 8,
                                children: [
                                  Flexible(
                                    child: Text(
                                      module.moduleSteps[stepIndex].title,
                                      style: GoogleFonts.inter(
                                        color: appColors.textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: appColors.badgeCardBackgroundColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          module.moduleSteps[stepIndex].markdownInstructions,
                                          style: GoogleFonts.inter(
                                            color: appColors.textColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      )
                                    ),
  
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 30,
                          child: Container(
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
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                spacing: 8,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Example",
                                      style: GoogleFonts.inter(
                                        color: appColors.textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: appColors.badgeCardBackgroundColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Image.asset(module.moduleSteps[stepIndex].imgPath),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 15,
                          child: Container(
                            width: double.infinity,
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
                            child:  Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                spacing: 8,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Note",
                                      style: GoogleFonts.inter(
                                        color: appColors.textColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 5,
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: appColors.badgeCardBackgroundColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          module.moduleSteps[stepIndex].hint,
                                          style: GoogleFonts.inter(
                                            color: appColors.textColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: appColors.primaryColor,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (stepIndex > 0) {
                                        setState(() {
                                          stepIndex -= 1;
                                        });
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: appColors.primaryColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "<- BACK",
                                          style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: appColors.textColor
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (stepIndex < module.moduleSteps.length - 1) {
                                        setState(() {
                                          stepIndex += 1;
                                        });
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: appColors.primaryColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "NEXT ->",
                                          style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: appColors.textColor
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                  )
                )
              ],
            )
          ), 
        );
      },
    );
  }

}