# `avto_raqam` 🇺🇿

`avto_raqam` — bu Oʻzbekiston avtomobil raqamlarini Flutter ilovalaringizda kiritish, tekshirish va formatlashni osonlashtiradigan qulay va yengil paket. U turli raqam turlarini (xususiy, davlat, harbiy, diplomatik, treyler, mototsikl, jamoat transporti va boshqalar) tanib oladi, real vaqtda formatlaydi va interfeysda intuitiv kirishni ta'minlaydi.

---

## 🔍 Asosiy imkoniyatlar

- ✅ **Oʻzbek avtomobil raqamlarining barcha asosiy formatlarini toʻliq qoʻllab-quvvatlaydi**, shu jumladan yangi va eski namunadagi, shuningdek, maxsus seriyalar.
- ⌨️ **`AvtoRaqamInput` vidjeti** — yuqori darajadagi, `TextField` asosidagi avtomobil raqami kiritish maydoni.
- 🔠 **Real vaqtda validatsiya va avtomatik formatlash (masking)** — foydalanuvchi ma'lumot kiritayotganda avtomatik ravishda bo'sh joylarni qo'shadi va to'g'ri belgi turini ta'minlaydi.
- 💡 **Dinamik `hintText` ko‘rsatadi** — kiritilgan belgilarga qarab potentsial formatlar uchun mos misollarni ko'rsatadi.
- 🎯 **Turli ekranlar uchun moslashuvchan dizayn**.
- 🧩 **Osongina integratsiya qilinadi** va tezda loyihangizga qo'shiladi.

---

## 🚀 Boshlash

### 1. O‘rnatish

`pubspec.yaml` faylingizga quyidagilarni qo‘shing:

```yaml
dependencies:
  avto_raqam: ^0.1.0 # Eslatma: So'nggi versiyani pub.dev dan tekshiring
```

# `avto_raqam` ga hissa qo'shish 🤝

`avto_raqam` paketiga qo'shgan hissangizni mamnuniyat bilan qabul qilamiz! Sizning yordamingiz bu paketni O'zbekistondagi va undan tashqaridagi Flutter hamjamiyati uchun yanada yaxshiroq qilishga yordam beradi.

---

## 💡 Qanday qilib hissa qo'shish mumkin?

Siz bir necha yo'l bilan hissa qo'shishingiz mumkin:

- **Xatolarni xabar qiling:** Agar biron bir muammo yoki kutilmagan xatti-harakatni topsangiz, iltimos, GitHub'da [muammo oching](https://github.com/YOUR_USERNAME/avto_raqam/issues). Xatoni qayta tiklash uchun aniq qadamlarni, kutilgan xatti-harakatni va haqiqiy xatti-harakatni ko'rsating.
- **Xususiyatlarni taklif qiling:** Yangi xususiyat yoki mavjud xususiyatni yaxshilash bo'yicha g'oyangiz bormi? Iltimos, [muammo oching](https://github.com/YOUR_USERNAME/avto_raqam/issues) va taklifingizni tasvirlang.
- **Pull so'rovlarini yuboring:**
  - **Xatoni tuzating:** Xatoni topdingizmi va uni qanday tuzatishni bilasizmi?
  - **Xususiyatni amalga oshiring:** Yangi xususiyat qo'shishni yoki mavjudini yaxshilashni xohlaysizmi?
  - **Hujjatlarni yaxshilang:** `README.md` yoki kod izohlarini aniqroq qilishga yordam bering.
  - **Ko'proq raqam formatlarini qo'shing:** Wikipedia sahifasi yangilanishi mumkin yoki hali qamrab olinmagan maxsus formatlar bo'lishi mumkin.

---

## 🛠️ Hissa qo'shish jarayoni (Kod/Hujjatlar uchun)

Kod yoki hujjatlarni kiritish uchun quyidagi bosqichlarga rioya qiling:

1.  **Repozitoriyni fork qiling:** Avval `avto_raqam` repozitoriysini o'zingizning GitHub hisobingizga fork qiling.
2.  **Forkni klonlang:** Forklangan repozitoriyni mahalliy kompyuteringizga klonlang:
    ```bash
    git clone [https://github.com/YOUR_USERNAME/avto_raqam.git](https://github.com/YOUR_USERNAME/avto_raqam.git)
    cd avto_raqam
    ```
3.  **Yangi shoxcha yarating:** Har doim o'zgarishlaringiz uchun yangi shoxcha yarating. Tavsifli nomdan foydalaning (masalan, `feature/yangi-format-qo'shish`, `fix/validatsiya-xatosi`):
    ```bash
    git checkout -b feature/sizning-ajoyib-xususiyatingiz
    ```
4.  **O'zgarishlaringizni kiriting:** Xato tuzatish yoki xususiyatingizni amalga oshiring.
    - Sizning kodingiz mavjud kodlash uslubiga mos kelishini ta'minlang.
    - **`CHANGELOG.md` ni yangilang:** `Unreleased` bo'limi ostiga (yoki keyingi rejalashtirilgan versiya) o'zgarishlaringizni tasvirlaydigan yozuv qo'shing.
    - **`README.md` ni yangilang:** Agar o'zgarishlaringiz paketdan foydalanish usuliga yoki uning asosiy xususiyatlariga ta'sir qilsa, `README.md` ni shunga mos ravishda yangilang.
5.  **O'zgarishlaringizni sinab ko'ring:** Agar yangi xususiyatlar qo'shayotgan bo'lsangiz yoki xatolarni tuzatayotgan bo'lsangiz, ularni yaxshilab sinab ko'ring. Agar iloji bo'lsa, yangi unit testlar qo'shing.
6.  **O'zgarishlaringizni commit qiling:** Aniq, qisqa commit xabarlarini yozing. Iloji bo'lsa, [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) spetsifikatsiyasiga rioya qiling (masalan, `feat: X uchun qo'llab-quvvatlashni qo'shish`, `fix: Y xatosini tuzatish`).
    ```bash
    git add .
    git commit -m "feat: O'zgarishlaringizni qisqacha tasvirlang"
    ```
7.  **Forkingizga push qiling:**
    ```bash
    git push origin feature/sizning-ajoyib-xususiyatingiz
    ```
8.  **Pull so'rovini (PR) oching:** GitHub'dagi forklangan repozitoriyni oching va yangi Pull so'rovini oching.
    - PR asl `avto_raqam` repozitoriysining `main` shoxchasiga yo'naltirilganligiga ishonch hosil qiling.
    - PR'da o'zgarishlaringizning batafsil tavsifini bering.
    - Tegishli muammolarni eslab o'ting (masalan, `Closes #123`).
