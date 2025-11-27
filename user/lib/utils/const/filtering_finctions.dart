// lib/utils/filter_utils.dart
// Helper utilities for tokenization, cleaning and normalization.

String cleanToken(String raw) {
  var s = raw.trim();
  if (s.startsWith('[') && s.endsWith(']')) {
    s = s.substring(1, s.length - 1).trim();
  }
  if ((s.startsWith("'") && s.endsWith("'")) || (s.startsWith('"') && s.endsWith('"'))) {
    s = s.substring(1, s.length - 1).trim();
  }
  return s.trim();
}

List<String> splitTokens(String raw) {
  final cleaned = cleanToken(raw);
  if (cleaned.isEmpty) return [];
  final parts = cleaned.split(RegExp(r'\s*[;,|]\s*'));
  return parts.map((p) => cleanToken(p)).where((p) => p.isNotEmpty).toList();
}

List<String> extractTokensFromDynamic(dynamic raw) {
  if (raw == null) return [];
  if (raw is Iterable) {
    final out = <String>[];
    for (final item in raw) {
      final s = (item ?? '').toString();
      out.addAll(splitTokens(s));
    }
    return out;
  }
  return splitTokens(raw.toString());
}

List<String> normalizeAndDedupe(List<String> list, {bool numericSort = false}) {
  final cleaned = list.map((s) => cleanToken(s)).where((s) => s.isNotEmpty).toList();
  if (numericSort) {
    final nums = cleaned.where((s) => double.tryParse(s) != null).toList();
    final nonNums = cleaned.where((s) => double.tryParse(s) == null).toList();
    nums.sort((a, b) => double.parse(a).compareTo(double.parse(b)));
    nonNums.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return {...nums, ...nonNums}.toList();
  } else {
    final normalized = cleaned.toSet().toList();
    normalized.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return normalized;
  }
}
