## 1. Słowem wstępu
ACE dostarcza użytkownikom bardziej realistyczny system medyczny w wersji podstawowej oraz zaawansowanej. Temat ten dostarcza informacji na temat różnic pomiędzy obydwoma systemami a także tym co dokładnie robią. Podzielony jest na dwie części: podstawową oraz zaawansowaną. Obie wersje nakładają się na siebie lecz każda ma unikalne właściwości.

## 2. Podstawowy system medyczny
Podstawowy system medyczny ACE jest troszeczkę bardziej rozbudowany od podstawowego systemu medycznego znanego nam z Arma 3. Nie jest tym samym trudny do opanowania. Podstawowy system medyczny ACE to mix systemów medycznych znanych z ACE2 oraz AGM.
Czterema głównymi elementami podstawowego systemu medycznego są:

* podział obrażeń na różne strefy - głowa, tors, lewe i prawe ramię, lewa i prawa noga
* krwawienie
* nieprzytomność
* ból

Wszystkie interakcje medyczne wykonywane są poprzez menu interakcji. Nie-medycy a więc zwykli piechurzy nie mogą - domyślnie - wykonywać wszystkich czynności medycznych. Dodatkowo, czas wykonywania przez nich czynności medycznych jest wydłużony porównując do prędkości wykonywania tych akcji przez przeszkolonych medyków.
Przeszkoleni medycy mają wyłączność na podawanie epinefryny oraz przetaczania krwi.
 
### 2.1 Jak to działa
Kiedy gracz zostanie trafiony, wtedy zaczyna on tracić krew z prędkością zależną od stopnia odniesionych obrażeń. Kiedy poziom krwi spadnie poniżej ustalonego poziomu, gracz zemdleje i, koniec końców, umrze jeżeli nie zostanie opatrzony na czas. Gracz zemdleje natychmiastowo także wtedy, kiedy odniesie on duże obrażenia w jednej chwili.
Aby zatrzymać krawienie, gracz lub CLS musi zabandażować każdą ranną kończynę i pozostałe krwawiące części ciała. Nieprzytomni gracze mogą zostać "obudzeni" poprzez użycie Autostrzykawek EpiPen. Jeżeli jednak gracz straci zbyt dużą ilość krwi, wtedy konieczne jest przetoczenie krwi, aby być w stanie wybudzić go z nieprzytomności.
Jeżeli jednostka jest w bólu, odznaczającym się abberacją chromatyczną lub błyskaniem ekranu (zależnie od ustawień klienta), wtedy należy mu podać Autostrzykawkę z morfiną.
 
### 2.2 Podstawowy system medyczny - sugerowany ekwipunek
* Zwykły piechur:
  * 10 x Bandaż (jałowy)

* Medyk:
  * 15-25 x Bandaż (jałowy)
  * 6 x Krew IV (500ml)
  * 10 x Autostrzykawka z morfiną
  * 10 x Autostrzykawka EpiPen

## 3. Zaawansowany system medyczny
Zaawansowany system medyczny dostarcza bardziej rozbudowaną i szczegółową symulację medyczną a także jest oparty na systemie medycznym znanym z CSE/CMS. Skupia sie ona na bardziej realistycznym modelu obrażeń i leczenia, powodując tym samym, że role medyczne zyskują na wartości, stają się istotne i bardziej wymagające. Efektem dodatkowym jest większa zachęta, aby nie oberwać w trakcie walki.
System jest zaprojektowany tak, aby symulować najważniejsze części ludzkiego ciała, a także reagować na otrzymane obrażenia oraz medykamenty w sposób realistyczny. Dostępne zabiegi oraz zasoby medyczne w zaawansowanym systemie medycznym bazują na Tactical Combat Casualty Care (TC3), czyli tym samym stosowanym przez prawdziwych medyków na całym świecie.
Poza 4 elementami dostarczanymi przez podstawowy system medyczny, zaawansowany system medyczny wprowadza następujące nowości:

* Bardziej szczegółowy system obrażeń
* Dokładną utratę krwi bazującą na odniesionych obrażeniach
* Narządy ciała, włączając w to ciśnienie krwi oraz tętno
* Zatrzymanie akcji serca
* Symulację podstawowych medykamentów
 
### 3.1 Jak to działa
Tak samo jak w podstawowym systemie medycznym, kiedy zostaniesz trafiony - otrzymujesz obrażenia. Różnica jest jednak taka, że rozmiar ran oraz ich szkodliwość bazuje na źródle, które te rany zadało. Wpływa to na szybkość utraty krwi oraz natychmiastowych konsekwencjach z niego wynikających, takich jak np. natychmiastowe omdlenie lub natychmiastowa śmierć. Kiedy gracz odniesie obrażenia, będzie to oznaczone błyskaniem ekranu na czerwono. Oznacza to, że gracz krwawi.

#### 3.1.1 Zatrzymywanie krwawienia
Aby zatrzymać krawienie, wszystkie rany na każdej części ciała muszą zostać zabandażowane. Robimy to poprzez założenie stazy na kończyny jako tymczasowe rozwiązanie problemu, lub poprzez użycie bandaży aby zatrzymać krwawienie na dłużej.

#### 3.1.2 Narządy wewnętrzne
Podczas kiedy gracz krwawi, jego ilość krwi w organizmie zmniejsza się, skutkując zmianą pracy narządów życiowych.
Zależnie od czynników takich jak aktualna ilość krwi w organizmie, aktualna szybkość krwawienia oraz użytych medykamentów, ciśnienie krwi zacznie maleć. Aby zapobiec temu spadkowi bazującemu na wspomnianych czynnikach oraz innych, tętno będzie odpowiednio się dostosowywać aby utrzymać ciśnienie na bezpiecznym poziomie. Oznacza to, że medyk musi obserwować pracę narządów każdego pacjenta, jakiego przyjdzie mu leczyć. Robimy to poprzez menu interakcji wybierając opcję "Sprawdź tętno" oraz "Sprawdź ciśnienie krwi" dostępną podczas interakcji z głową oraz ramionami pacjenta.

#### 3.1.3 Leki
Aby ustabilizować narządy a także zapobiegać np. bólowi, gracz oraz medyk może użyć leków. Wszystkie rodzaje leków ważą tyle samo czyli ok. 50 gramów.
Zaawansowany system medyczny dostarcza następujące 3 rodzaje leków:

* Atropina
* Morfina
* Epinefryna

Atropina jest to wagolityczny i antycholinergiczny lek, który w niskich dawkach zmniejsza tętno lecz w dużych dawkach zwiększa je, kontrując efekty zatrucia fosforoorganicznego (w scenariuszach NBC (Nuklearnych, Biologicznych, Chemicznych) - zatrucia antycholinesterazowego) oraz objawową bradykardię (w sytuacji leczenia po przywróceniu spontanicznego krążenia (leczenie po-NZK) i użyciu leków resustytacyjnych).

Morfina używana jest do uśmierzania dużych ilości bólu. Ma podobny efekt do heroiny z racji jej właściwości opioidowych. Może być podana tylko raz z rzędu oraz tylko kiedy krwawienie zostanie zmniejszone do minimum. Morfiny nigdy nie powinno się podawać osobom z niskim tętnem, ponieważ może zatrzymać akcję serca.

Epinefryna używana jest w celu zwiększenia tętna oraz ciśnienia krwi oraz w łagodzenia utraty nieprzytomności. Epinefryna jest syntetyczną formą adrenaliny, naturalnie produkowanej przez organizm ludzki. Może być także użyta aby przeciwdziałać efektom atropiny. Może być podana tylko raz z rzędu.
Epinefryny nigdy nie powinno się podawać osobom z wysokim tętnem lub ciśnieniem krwi.

#### 3.1.4 Rodzaje obrażeń
Zaawansowany system medyczny dostarcza bardziej szczegółowe opisy ran. Wszystkie rany dzielimy na pomniejsze, średnie oraz duże. Poniżej znajduje się ich lista wraz z ich efektami:
* Draśnięcia (lub zadrapania)
  * Przez pojęcie „zadrapania” rozumiemy zadraśnięcia, skaleczenia, lekkie uszkodzenie ciągłości powierzchni skóry.
  * Źródła: upadki, otarcia (kolan i rąk), kolizje (samochodowe).
  * Efekty: prawie nieodczuwalny ból, ekstremalnie niski poziom krwawienia rany
* Rany płatowe (lub rany darte)
  * Rana powstająca wskutek cięcia (najczęściej) lub szarpania skóry, a czasami głębiej położonych tkanek.
  * Źródła: eksplozje, kolizje (samochodowe), granaty, pociski artyleryjskie, pociski, backblast, ugryzienia.
  * Efekty: wyraźnie odczuwalny i doskwierający ból, w zależności od stopnia zaawansowania rany szybkie wykrwawianie się.
* Stłuczenia (lub kontuzje)
  * Jest to zamknięte uszkodzenie wewnętrznej struktury tkanki powstałe w wyniku urazu mechanicznego polegające na zgnieceniu komórek, rozerwaniu włókien substancji międzykomórkowej, uszkodzeniu naczyń i nerwów.
  * Źródła: pociski, backblast, uderzenia, kolizje (samochodowe), upadki.
  * Efekty: lekki ból, brak krwawienia z rany.
* Zgniecienia tkanek miękkich (lub rany miażdżone)
  * Rana powstająca na skutek silnie działającego tępego urazu. Poddane nadmiernemu ciśnieniu tkanki powodują rozerwanie naczyń krwionośnych i tworzenia się głębokiego krwiaka.
  * Źródła: upadki, kolizje (samochodowe), uderzenia.
  * Efekty: lekki ból, ekstremalnie niski poziom krwawienia rany.
* Rany cięte
  * Rana powstająca na skutek działania przedmiotów ostrych (najczęściej noży), jednak w odróżnieniu od rany kłutej jest ona zadana poprzez przeciągnięcie ostrza po powierzchni skóry, a nie wbicia.
  * Źródła: kolizje (samochodowe), granaty, eksplozje, pociski artyleryjskie, backblast, dźgnięcia
  * Efekty: lekki ból, w zależności od głębokości i szerokości rany dosyć szybkie wykrwawianie się.
* Rozerwanie skóry (lub pęknięcia skóry)
  * Powstają na wskutek ogromnych sił działających na powierzchnię skóry, objawiają się poszarpanymi krawędziami. Powstają na wskutek źródeł wewnętrznych np. podczas porodu oraz zewnętrznych na wskutek uderzeń.
  * Źródła: kolizje (samochodowe), uderzenia
  * Efekty: lekki ból, mała lub średnia prędkość wykrwawiania się w zależności od rozmiaru rany.
* Rany postrzałowe
  * Rana powstająca na skutek działania pocisków z broni palnej lub odłamków pocisków, min, granatów, bomb itp.
  * Źródła: pociski, granaty, eksplozje, pociski artyleryjskie.
  * Efekty: wyraźnie odczuwalny i doskwierający ból, średnia prędkość wykrwawiania się (zależne od rozmiaru rany).
* Rany kłute
  * Charakteryzują się bardzo małą powierzchnią widoczną na skórze i poważnymi nieraz uszkodzeniami wewnętrznymi ciała.
  * Źródła: dźgnięcia, granaty.
  * Efekty: lekki ból, niska prędkość wykrwawiania się.
Wyróżniamy także złamania kości ciała (poniższe może się zmienić i nie jest aktualnie zaimplementowane w pełni):
* Złamanie kości udowej
  * Najczęściej przyczynami złamania kości udowej są ciężkie upadki i wypadki komunikacyjne. Leczenie polega nie tylko na unieruchomieniu, ale także często na łączeniu złamanych elementów kości za pomocą śrub i drutów, bardzo ważne by odłamy nie uszkodziły naczyń krwionośnych.
  * Źródła: pociski, kolizje (samochodowe), backblast, eksplozje, pociski artyleryjskie, granaty.
  * Efekty: wyraźnie odczuwalny i doskwierający ból, brak możliwości stania do czasu leczenia.
 
#### 3.1.5 Rodzaje bandaży
Zaawansowany system medyczny dostarcza 4 różne rodzaje bandaży oraz poprawnie działającą stazę. Poniżej lista tych bandaży wraz z ich efektywnością na dany rodzaj rany. W zależności od stopnia efektywności na dany rodzaj rany wymagane może być podanie od 1 (najlepsza efektywność) do nawet 4 (najgorsza efektywność) bandaży danego typu.
Wszystkie rodzaje bandaży ważą tyle samo czyli ok. 50 gramów.
* Bandaż (jałowy)
  * Draśnięcia - najwyższa skuteczność
  * Rany płatowe - ekstremalnie niska skuteczność
  * Stłuczenia - najwyższa skuteczność
  * Zgniecienia tkanek miękkich - niska skuteczność
  * Rany cięte - bardzo niska skuteczność
  * Rozerwanie skóry - średnia skuteczność
  * Rany postrzałowe - ekstremalnie niska skuteczność
  * Rany kłute - niska skuteczność
* Bandaż (uciskowy)
  * Draśnięcia - najwyższa skuteczność
  * Rany płatowe - najwyższa skuteczność
  * Stłuczenia - najwyższa skuteczność
  * Zgniecienia tkanek miękkich - niska skuteczność
  * Rany cięte - ekstremalnie niska skuteczność
  * Rozerwanie skóry - ekstremalnie niska skuteczność
  * Rany postrzałowe - najwyższa skuteczność
  * Rany kłute - ekstremalnie niska skuteczność
* Bandaż (elastyczny)
  * Draśnięcia - najwyższa skuteczność
  * Rany płatowe - ekstremalnie niska skuteczność
  * Stłuczenia - najwyższa skuteczność
  * Zgniecienia tkanek miękkich - najwyższa skuteczność
  * Rany cięte - najwyższa skuteczność
  * Rozerwanie skóry - najwyższa skuteczność
  * Rany postrzałowe - niska skuteczność
  * Rany kłute - wysoka skuteczność
* Opatrunek QuikClot
  * Draśnięcia - średnia skuteczność
  * Rany płatowe - ekstremalnie niska skuteczność
  * Stłuczenia - średnia skuteczność
  * Zgniecienia tkanek miękkich - średnia skuteczność
  * Rany cięte - średnia skuteczność
  * Rozerwanie skóry - średnia skuteczność
  * Rany postrzałowe - średnia skuteczność
  * Rany kłute - niska skuteczność
 
#### 3.1.6 Infuzja dożylna
Ubytek krwi w organizmie pacjenta możemy uzupełnić przy pomocy trzech płynów: krwą, osoczem krwi oraz solą fizjologiczną. Wyróżniamy 3 wielkości worków z wymienionymi płynami - 250ml, 500ml oraz 1000ml.
Przetaczanie 250ml danego płynu trwa około 1 minuty.

#### 3.1.7 Apteczki osobiste oraz szycie ran
Użycie na pacjencie apteczki osobistej poprawia jego stan do normalnego poziomu. W zależności od ustawień modułu medycznego apteczka osobista może być użyta tylko w określonych warunkach i określonym miejscu a także przez określone osoby.

Zestaw chirurgiczny zawiera w sobie igły oraz nici do zszywania ran. Można go użyć w celu zapobiegnięcia ponownego otwarcia się zabandażowanych ran. W zależności od ustawień modułu medycznego zestaw chirurgiczny może być użyty tylko w określonych warunkach i określonym miejscu a także przez określone osoby.

### 3.2 Zaawansowany system medyczny - sugerowany ekwipunek
 
* Zwykły piechur:
  * 4 x Bandaż (jałowy)
  * 3 x Bandaż (elastyczny)
  * 3 x Bandaż (uciskowy)
  * 3 x Opatrunek QuikClot
  * 1 x Staza
* Combat First Responder (CFR):
  * 10-15 x Bandaż (jałowy)
  * 15-20 x Bandaż (elastyczny)
  * 5-8 x Bandaż (uciskowy)
  * 10-15 x Opatrunek QuikClot
  * 3 x Staza
  * 2 x ```Opatrunek Chest-Seal```
  * 2 x ```Rurka nosowo-gardłowa```
  * 4 x Sól fizjologiczna IV (500ml)
  * 5 x Autostrzykawka z morfiną
  * 5 x Autostrzykawka EpiPen
  * 8 x Autostrzykawka AtroPen
* Medyk:
  * 10-15 x Bandaż (jałowy)
  * 15-20 x Bandaż (elastyczny)
  * 8 x Bandaż (uciskowy)
  * 10-15 x Opatrunek QuikClot
  * 5 x Staza
  * 3 x ```Opatrunek Chest-Seal```
  * 3 x ```Rurka nosowo-gardłowa```
  * 6 x Sól fizjologiczna IV (500ml)
  * 8 x Autostrzykawka z morfiną
  * 8 x Autostrzykawka EpiPen
  * 12 x Autostrzykawka AtroPen
  * 1-3 x *Zestaw chirurgiczny*
  * 1-3 x *Apteczka osobista*
* Paramedyk:
  * 10-15 x Bandaż (jałowy)
  * 15-20 x Bandaż (elastyczny)
  * 8 x Bandaż (uciskowy)
  * 10-15 x Opatrunek QuikClot
  * 5 x Staza
  * 3 x ```Opatrunek Chest-Seal```
  * 3 x ```Rurka nosowo-gardłowa```
  * 2 x Sól fizjologiczna IV (500ml)
  * 3 x Krew IV (1000ml) - Pobierane przy desancie lub podczas leczenia wewnątrz Medevac-a
  * 3 x Osocze IV (1000ml) - Pobierane przy desancie lub podczas leczenia wewnątrz Medevac-a
  * 8 x Autostrzykawka z morfiną
  * 8 x Autostrzykawka EpiPen
  * 12 x Autostrzykawka AtroPen
  * 1-3 x *Zestaw chirurgiczny*
  * 1-3 x *Apteczka osobista*
  
*Medykament* - zależne od ustawień modułu medycznego<br/>
```Medykament``` - niezaimplementowane (jeszcze)

## 4. Ustawienia modułu medycznego
TBD
