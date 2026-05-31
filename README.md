<p align="center">
    <img src="assets/images/mockup_cemetery.png" width="49%"/>
    <img src="assets/images/mockup_digitize.png" width="49%"/>
</p>

<p align="center">
    <a href="https://github.com/DigitalHeritage-Lab/MemoryMap/actions/workflows/ci.yml">
        <img src="https://img.shields.io/github/actions/workflow/status/DigitalHeritage-Lab/MemoryMap/ci.yml?event=push&branch=main&label=CI%20%2F%20Tests&labelColor=333940&logo=github&color=10B981" alt="CI / Tests">
    </a>
    <a href="https://github.com/DigitalHeritage-Lab/MemoryMap">
        <img src="https://img.shields.io/github/stars/DigitalHeritage-Lab/MemoryMap?style=flat&label=stars&labelColor=333940&color=8957e5&logo=github" alt="GitHub Stars">
    </a>
    <a href="https://github.com/DigitalHeritage-Lab/MemoryMap/contributors">
        <img src="https://img.shields.io/github/contributors/DigitalHeritage-Lab/MemoryMap?logo=github&labelColor=333940&color=10B981" alt="Contributors">
    </a>
    <a href="https://github.com/DigitalHeritage-Lab/MemoryMap/issues">
        <img src="https://img.shields.io/github/issues/DigitalHeritage-Lab/MemoryMap?style=flat&label=issues&labelColor=333940&color=red&logo=github" alt="Issues">
    </a>
    <a href="LICENSE">
        <img src="https://img.shields.io/badge/license-PolyForm%20Noncommercial-blue.svg?logo=github&labelColor=333940" alt="PolyForm Noncommercial License">
    </a>
    <a href="README.en.md">
        <img src="https://img.shields.io/badge/lang-en-red.svg" alt="English">
    </a>
</p>


<p align="center">
  <a href="#-основні-можливості">Можливості</a> •
  <a href="#%EF%B8%8F-технологічний-стек">Стек</a> •
  <a href="#-структура-проєкту">Структура</a> •
  <a href="#-швидкий-старт-для-розробників">Старт</a> •
  <a href=".github/CONTRIBUTING.md">Contributing</a>
</p>

# 🏛️ MemoryMap — Digital Heritage Platform

**MemoryMap** — кросплатформний Flutter-додаток для оцифрування, каталогізації та інтерактивного картування некрополів та поховань України. Проєкт зберігає культурну спадщину через зручні інструменти збору GPS-даних, біографічних описів та фотофіксації безпосередньо «у полі».

---

## 🌟 Основні можливості

- 📍 **Інтерактивна карта некрополів** — OpenStreetMap з темним дизайном CartoDB, фільтрація за відстанню
- 📱 **Оцифрування «у полі»** — покроковий майстер з GPS, адміністративним вибором (Область → Район → Громада) та фотофіксацією
- 🔍 **Розумний пошук** — повнотекстовий пошук на стороні БД (Supabase RPC), без локальної фільтрації
- ♾️ **Infinite Pagination** — безкінечний скролінг через `ScrollPaginationMixin`, Skeleton-ефекти
- 🇺🇦 **Повна локалізація** — українська мова через ARB-файли, `context.l10n`

---

## 🖼️ Preview

<table>
  <tr>
    <th>
      <a href="lib/components/cemeteries/widget/body/cemeteries_body.dart">Список цвинтарів</a>
      |
      <a href="lib/components/cemeteries/bloc/cemeteries_bloc.dart">BLoC</a>
    </th>
    <th>
      <a href="lib/components/digitize/widget/body/digitize_body.dart">Оцифрування могили</a>
      |
      <a href="lib/components/digitize/bloc/digitize_bloc.dart">BLoC</a>
    </th>
  </tr>
  <tr>
    <th>
      <a href="lib/components/cemeteries/widget/body/cemeteries_body.dart">
        <img src="assets/images/mockup_cemetery.png" alt="Cemeteries Screen" width="300"/>
      </a>
    </th>
    <th>
      <a href="lib/components/digitize/widget/body/digitize_body.dart">
        <img src="assets/images/mockup_digitize.png" alt="Digitize Screen" width="300"/>
      </a>
    </th>
  </tr>
</table>

---

## 🛠️ Технологічний стек

| Шар | Технологія |
|-----|-----------|
| **UI** | [Flutter 3.24+](https://flutter.dev) · `flutter_screenutil` |
| **Стан** | [flutter_bloc](https://bloclibrary.dev/) · `freezed` |
| **Навігація** | [go_router](https://pub.dev/packages/go_router) |
| **Бекенд** | [Supabase](https://supabase.com) (PostgreSQL + PostGIS, тільки RPC) |
| **Карти** | [flutter_map](https://pub.dev/packages/flutter_map) · `latlong2` |
| **DI** | [injectable](https://pub.dev/packages/injectable) · `get_it` |
| **Локалізація** | ARB · `flutter_localizations` · `intl` |
| **Лінтинг** | [very_good_analysis](https://pub.dev/packages/very_good_analysis) |

---

## 📁 Структура проєкту

```
lib/
├── bootstrap.dart              # Ініціалізація сервісів та BlocObserver
├── main.dart                   # Точка входу, MaterialApp + тема
├── components/                 # Фіча-модулі (BLoC + View + Widget)
│   ├── cemeteries/             # Список, деталі цвинтаря, фільтр за локацією
│   ├── digitize/               # Форма оцифрування: GPS, адмін-дропдауни, дати
│   ├── graves/                 # Список та перегляд поховань
│   ├── home/                   # Bottom Navigation Bar
│   └── map/                    # Інтерактивна карта з маркерами
└── shared/                     # Спільний UI, утиліти, дизайн-система
    ├── extension/              # ErrorCodeExtension
    ├── mixin/                  # ScrollPaginationMixin
    └── theme/                  # AppColors, AppButton, AppScaffold
```

---

## 🚀 Швидкий старт для розробників

### Передумови
- [Flutter SDK](https://docs.flutter.dev/get-started/install) `>= 3.24.0`
- [Docker](https://www.docker.com/) (для локального Supabase)

### Локальна база даних (Supabase)

```bash
supabase start          # Запуск PostgreSQL + Auth + Storage
```

### Кодогенерація

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Запуск

```bash
flutter run
```

---

## 🧪 Контроль якості

```bash
# Форматування
dart format .

# Аналіз (не повинно бути попереджень)
flutter analyze --fatal-warnings --fatal-infos

# Тести
flutter test --coverage
```

---

## 📄 Ліцензія

Поширюється під [PolyForm Noncommercial 1.0.0 License](LICENSE).
