class UzPlateFormat {
  final String label;
  final RegExp regex;
  final String displayExample;

  UzPlateFormat({
    required this.label,
    required this.regex,
    required this.displayExample,
  });
}

final List<UzPlateFormat> uzbekPlateFormats = [
  UzPlateFormat(
    label: "Private",
    regex: RegExp(r"^\d{2} [A-Z] \d{3} [A-Z]{2}$"),
    displayExample: "01 A 123 AB",
  ),
  UzPlateFormat(
    label: "Government",
    regex: RegExp(r"^\d{2} \d{3} [A-Z]{2}$"),
    displayExample: "10 123 AA",
  ),
  UzPlateFormat(
    label: "Military",
    regex: RegExp(r"^M \d{5}$"),
    displayExample: "M 12345",
  ),
  // Add more formats from https://uz.wikipedia.org/wiki/O%CA%BBzbekiston_avtomobil_raqamlari_indeksi
];
