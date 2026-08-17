class CodeBlock {
  final String codeBlockId;
  final String code;
  final List<dynamic> correctPositions;
  final int indentLevel;
  final Map<String, dynamic> requires;
  final String? dependencyErrorHint;

  CodeBlock({
    required this.codeBlockId,
    required this.code,
    this.indentLevel = 0,
    this.requires = const {},
    this.dependencyErrorHint, 
    required this.correctPositions,
  });

  String get formattedCode => '${"    " * indentLevel}$code';

  factory CodeBlock.fromJson(Map<String, dynamic> json) {
    return CodeBlock(
      codeBlockId: json['codeBlockId'] as String,
      code: json["code"] as String,
      correctPositions: json['correctPositions'] as List<dynamic>, 
      indentLevel: json["indentLevel"] as int, 
      requires: json["requires"] as Map<String, dynamic>,
      dependencyErrorHint: json["dependencyErrorHint"] as String?,
    );
  }
}