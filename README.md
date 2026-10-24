# Roll-the-Dice – Seminár 3, Zadanie 1c

Jednoduchá aplikácia vo Flutteri, ktorá po klepnutí na tlačidlo zobrazí náhodnú stranu kocky 1–6.
Obrázky sú priložené školské súbory dice-1.png až dice-6.png.

## Spustenie

V termináli v priečinku projektu:

```sh
flutter pub get
flutter run
```

Priložené sú platformové súbory pre iOS a macOS.

## Čo ukázať pri vysvetľovaní

1. **Assets:** šesť obrázkov v assets/images/ je zaregistrovaných v pubspec.yaml.
2. **Stav:** DiceScreen je StatefulWidget, currentDiceRoll uchováva aktuálnu hodnotu.
3. **Náhodnosť:** Random z dart:math; nextInt(6) generuje 0–5, preto pridávame 1.
4. **Obnovenie obrazovky:** rollDice() zmení hodnotu v setState(), Flutter opäť spustí build().
5. **Obrázok:** Image.asset použije cestu assets/images/dice-$currentDiceRoll.png.
6. **Tlačidlo:** onPressed: rollDice spustí hod.

Rovnaké číslo môže padnúť viackrát za sebou. Je to normálny výsledok náhodného hodu.
Po novom spustení aplikácia začína hodnotou 1; výsledky sa neukladajú.

## Čo odovzdať podľa zadania

- Odkaz na online Git repozitár obsahujúci celý projekt.
- ZIP so zdrojmi: minimálne lib/main.dart a pubspec.yaml. Balík obsahuje aj všetkých šesť obrázkov.
- Dva screenshoty zo simulátora s rôznymi hodenými hodnotami (priečinok screenshots/).

Lokálny Git repozitár sám nenahrádza požadovaný internetový odkaz.
Pre zverejnenie cez GitHub Desktop: File → Add Local Repository → priečinok projektu → Publish repository.
Ak je repozitár súkromný, vyučujúci potrebuje prístup.

## Kontrola

```sh
flutter analyze
flutter test
```

Testy skúšajú 30 hodov: hodnoty 1–6, správny obrázok a text bez chýb pri načítaní.
Druhý test overuje dosiahnuteľnosť tlačidla na malom displeji.
