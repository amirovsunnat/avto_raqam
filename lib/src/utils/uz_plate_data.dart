// lib/src/utils/uz_plate_data.dart
import '../models/uz_plate_format.dart';

final List<UzPlateFormat> uzbekPlateFormats = [
  // 1. Oddiy avtotransport vositalari uchun (For ordinary vehicles) - New format since 2008
  UzPlateFormat(
    label: "Oddiy (Yangi, 2008-yildan)",
    regex: RegExp(
        r"^\d{2}[A-Z]\d{3}[A-Z]{2}$"), // No explicit spaces in regex for simpler check
    displayExample: "01 A 123 AB",
    pattern: "dd Addd AA",
  ),
  // 2. Oddiy avtotransport vositalari uchun (For ordinary vehicles) - Old format until 2008
  UzPlateFormat(
    label: "Oddiy (Eski, 2008-yilgacha)",
    regex: RegExp(r"^\d{2}\d{4}[A-Z]{2}$"),
    displayExample: "01 1234 AB",
    pattern: "dd dddd AA",
  ),
  // 3. Treylerlar uchun (For trailers) - New format since 2008
  UzPlateFormat(
    label: "Treyler (Yangi, 2008-yildan)",
    regex: RegExp(r"^\d{2}[A-Z]\d{3}[A-Z]{2}T$"),
    displayExample: "01 A 123 AB T",
    pattern: "dd Addd AA T",
  ),
  // 4. Treylerlar uchun (For trailers) - Old format until 2008
  UzPlateFormat(
    label: "Treyler (Eski, 2008-yilgacha)",
    regex: RegExp(r"^\d{2}\d{4}[A-Z]{2}T$"),
    displayExample: "01 1234 AB T",
    pattern: "dd dddd AA T",
  ),
  // 5. Hukumat raqamlari (Government numbers) - New format since 2008 (Similar to old ordinary, context matters)
  UzPlateFormat(
    label: "Hukumat (Yangi, 2008-yildan)",
    regex: RegExp(r"^\d{2}\d{3}[A-Z]{2}$"), // Example: 10 123 AA
    displayExample: "10 123 AA",
    pattern: "dd ddd AA",
  ),
  // 6. Hukumat raqamlari (Government numbers) - Old format until 2008
  UzPlateFormat(
    label: "Hukumat (Eski, 2008-yilgacha)",
    regex: RegExp(r"^\d{5}[A-Z]{2}$"), // Example: 12345 AA
    displayExample: "12345 AA",
    pattern: "ddddd AA",
  ),
  // 7. Diplomatik raqamlar (Diplomatic numbers) - "D" series
  UzPlateFormat(
    label: "Diplomatik (D)",
    regex: RegExp(r"^D\d{5}$"),
    displayExample: "D 12345",
    pattern: "D ddddd",
  ),
  // 8. Diplomatik raqamlar (Diplomatic numbers) - "CMD" series
  UzPlateFormat(
    label: "Diplomatik (CMD)",
    regex: RegExp(r"^CMD\d{3}$"),
    displayExample: "CMD 123",
    pattern: "CMD ddd",
  ),
  // 9. Diplomatik raqamlar (Diplomatic numbers) - "T" series (Technical staff)
  UzPlateFormat(
    label: "Diplomatik (T)",
    regex: RegExp(r"^T\d{5}$"),
    displayExample: "T 12345",
    pattern: "T ddddd",
  ),
  // 10. Chet el fuqarolari (Foreign citizens) - "H" series (Xorijiy)
  UzPlateFormat(
    label: "Chet el fuqarolari (H)",
    regex: RegExp(r"^H\d{5}$"),
    displayExample: "H 12345",
    pattern: "H ddddd",
  ),
  // 11. Ichki ishlar vazirligi (Ministry of Internal Affairs)
  UzPlateFormat(
    label: "IIV",
    regex: RegExp(r"^\d{5}IIV$"),
    displayExample: "12345 IIV",
    pattern: "ddddd IIV",
  ),
  // 12. Harbiy avtotransport (Military vehicles)
  UzPlateFormat(
    label: "Harbiy (M)",
    regex: RegExp(r"^M\d{5}$"),
    displayExample: "M 12345",
    pattern: "M ddddd",
  ),
  // 13. Mototsikllar (Motorcycles) - New format
  UzPlateFormat(
    label: "Mototsikl (Yangi)",
    regex: RegExp(r"^\d{2}[A-Z]\d{3}[A-Z]{2}M$"),
    displayExample: "01 A 123 AB M",
    pattern: "dd Addd AA M",
  ),
  // 14. Mototsikllar (Motorcycles) - Old format
  UzPlateFormat(
    label: "Mototsikl (Eski)",
    regex: RegExp(r"^\d{2}\d{4}[A-Z]{2}M$"),
    displayExample: "01 1234 AB M",
    pattern: "dd dddd AA M",
  ),
  // 15. Traktorlar va qishloq xoʻjaligi texnikasi (Tractors and agricultural machinery)
  UzPlateFormat(
    label: "Traktor/Qishloq xo'jaligi",
    regex: RegExp(r"^\d{2}\d{4}MT$"),
    displayExample: "01 1234 MT",
    pattern: "dd dddd MT",
  ),
  // 16. Tashkent City numbers (Special series, 2019-2021) - "TA" series
  UzPlateFormat(
    label: "Toshkent shahar (2019-2021, TA)",
    regex: RegExp(r"^\d{2}[A-Z]\d{3}TA$"),
    displayExample: "01 A 123 TA",
    pattern: "dd Addd TA",
  ),
  // 17. Tashkent City numbers (Special series, current from 2021) - "TZ" series
  UzPlateFormat(
    label: "Toshkent shahar (2021-hozirgi, TZ)",
    regex: RegExp(r"^\d{2}[A-Z]\d{3}TZ$"),
    displayExample: "01 A 123 TZ",
    pattern: "dd Addd TZ",
  ),
  // 18. Jamoat transporti (Public transport) - Bus
  UzPlateFormat(
    label: "Jamoat transporti (Avtobus)",
    regex: RegExp(r"^\d{2}[A-Z]\d{3}JV$"), // Example: 01 A 123 JV
    displayExample: "01 A 123 JV",
    pattern: "dd Addd JV",
  ),
  // 19. Taksilar (Taxi)
  UzPlateFormat(
    label: "Takso",
    regex: RegExp(r"^\d{2}[A-Z]\d{3}TX$"), // Example: 01 A 123 TX
    displayExample: "01 A 123 TX",
    pattern: "dd Addd TX",
  ),
  // 20. Favqulodda vaziyatlar vazirligi (Ministry of Emergency Situations)
  UzPlateFormat(
    label: "FVV",
    regex: RegExp(r"^\d{5}FVV$"),
    displayExample: "12345 FVV",
    pattern: "ddddd FVV",
  ),
  // 21. Temporary/Transit plates (TR series)
  UzPlateFormat(
    label: "Vaqtinchalik/Tranzit (TR)",
    regex: RegExp(r"^\d{2}\d{4}TR$"),
    displayExample: "01 1234 TR",
    pattern: "dd dddd TR",
  ),
  // 22. Foreign legal entities
  UzPlateFormat(
    label: "Chet el yuridik shaxslari",
    regex: RegExp(
        r"^\d{5}[A-Z]{2}$"), // Same pattern as old government, but context different
    displayExample:
        "90 123 AA", // Example given on Wikipedia for foreign entities
    pattern:
        "dd ddd AA", // Based on the "90" prefix for foreign legal entities.
  ),
  // 23. Internal Affairs (old style, likely for specific vehicles)
  UzPlateFormat(
    label: "IIV (Eski format)",
    regex: RegExp(r"^\d{5}$"), // Example: 00001 (without IIV suffix)
    displayExample: "00001",
    pattern: "ddddd",
  ),
];
