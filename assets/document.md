# Cel ćwiczenia

Celem przeprowadzonego projektu było wyznaczenie temperatury Debye'a oraz współćzynnika Sommerfelda dla złota $Au$.

# Wstęp teoretyczny

## Temperatura Debye'a
W modelu Debye’a temperaturą Debye’a ($T_D$)  nazywamy temperaturę odpowiadającą maksymalnej częstości drgań sieci krystalicznej $\omega_D$. Definiuje się ją następująco:

$$
k_B* T_D = \hbar \omega_D
$$ (TD)

## Poprawka Sommerfelda

W strukturach krystalicznych mierzona wartość ciepła włąściwego obarczona jest błędem wynikająćym z faktu, iż elektrony swobodne również przyczyniają się do wartości ciepła właściwego.
Poprawka Sommerfelda (tzw $c_{el}$) jest to funkcja liniowa temperatury postaci:

$$
c_{el} = \gamma T
$$ (sommer)

gdzie $\gamma$ to współczynnik Sommerfelda.

## Zależność ciepła właściwego od temperatury w modelu Debye'a dla niskich temperatur

W modelu Debye'a, dla niskich temperatur ciepło właściwe ciał stałych opisane jest wzorem:

$$
C_{fonon} = 3 N_a k_b \frac{4 \pi^4}{5} \left( \frac{T}{T_D} \right)^3
$$ (debeye)

Po uwzględnieniu poprawki Sommerfelda {eq}`sommer` równanie to przyjmuje postać:

$$
C_{fonon + elektron} = \gamma T + 3 N_a k_b \frac{4 \pi^4}{5} \left( \frac{T}{T_D} \right)^3
$$ (ostateczna)

- $N_a=6.02214076e23 mol^{-1}$ to liczba Avogadro
- $k_b=1.380649e-23 \frac{J}{K}$ - stała Boltzmanna

```{important}
Postać równania {eq}`ostateczna` jest prawdziwa dla temperatur $T \ll T_D$.
```

## Ciepło molowe i masowe

Ciepło molowe to ilość ciepła potrzebna do podniesienia temperatury jednego mola substancji o jeden stopień Kelvina (lub Celsjusza). Jednostką ciepła molowego jest $\frac{J}{mol * K}$.
Ciepło masowe z kolei to ilość ciepła potrzebna do podniesienia temperatury jednego grama substancji o jeden stopień Kelvina (lub Celsjusza). Jednostką ciepła masowego jest $\frac{J}{g * K}$.

```{note}
Aby przeliczyć ciepło masowe na molowe, należy przemnożyć ciepło molowe przez masę atomową danej substancj $c_{mol} = c_{mas} * \mu$, gdzie $\mu$ to masa atomowa substancji wyrażona w $\frac{g}{mol}$.
```

# Aparatura i metodyka wykonania

Do wyznaczenia konicznych wielkośći wykorzystano zestawy danych udostępnione w załączniku do ćwiczenia ([literature 1.](#literatura)).
Do sporządzenia wykresu oraz dopasowania krzywych użyto programu [gnuplot](http://www.gnuplot.info/).

```{raw} latex
\newpage
```

# Opracowanie wyników

Przyjęto masę atomową złota równą $\mu = 196.97 \frac{g}{mol}$.

```{plot} gnuplot
:caption: Zależność ciepła właściwego od temperatury dla złota wraz z dopasowaną krzywą.

set grid
set xlabel "Temperatura [K]"
set ylabel "molowe ciepło właściwe [J*mol^{-1} K^{-1}]"
set grid
set title "Zależność ciepła właściwego od temperatury dla złota"
set key box
set key top left

mu = 196.97 # [g/mol]

Na=6.02214076e23 # Avogadro's number [1/mol]
kb=1.380649e-23 # Boltzmann constant [J/K]
cfon(x) = 3*Na*kb*4*pi**4/5 * (x/thetaD)**3 + g*x

fit cfon(x) 'assets/Au.dat' using 1:($2*mu) via thetaD, g

plot "assets/Au.dat" using 1:(mu*$2) with points pt 7 ps 1 title "Punkty pomiarowe dla złota", \
cfon(x) title "Dopasowana krzywa"
```

Po dopasowaniu krzywej {eq}`ostateczna` do danych eksperymentalnych otrzymano następujące wartości współczynników:
- $T_D = 165.868 K \pm 0.239$
- $\gamma = 8.02359 * 10^4 \frac{J}{g* K^2} \pm 1.16 * 10^4$

# Podsumowanie

## Temperatura Debye'a

Według [literatury 3.](#literatura), wartość temperatury Debye'a dla złota w temperaturze $0K$ wynosi $T_{D_{lit}} = 162.3 K$,
co **nie zgadza się** z wartośią otrzymaną w ćwiczeniu $T_D = 165.868 K \pm 0.239$ w otrzymanym przedziale niepewności.

```{note}
Rozbierzność otrzymanego wyniku z wartościami tablicowymi może wynikać z przyjętego zakresu temperatury.

> [...] Ze względu na przybliżony charakter modelu Debye’a wartości podawane w literaturze znacząco się różnią i zależą od zakresu temperatur, w którym zostały wyznaczone.

([literatura 2.](#literatura))

W prawdzie powyższe stwierdzenie odnosi się do eksperymentu w którym operowano na temperaturach rzędu $77K$ (wrzenie azotu), jednak podobny efekt mógłby być zaobserwowany również w warunkach niniejszego eksperymentu pomimo znacznie niższych temperatur.
```

## Współczynnik Sommerfelda

Literatura podaje wartość współczynnika Sommerfelda dla złota jako $\gamma_{lit} = 7.29 * 10^{-3} \frac{J}{g * K^2}$, co
**zgadza się** z wynikiem otrzymanym w ćwiczeniu ($\gamma =  8.02359 * 10^4 \frac{J}{g* K^2} \pm 1.16 * 10^4$) w zakresie niepewności.

```{tip}
Wartość literaturowa określona jako _Experimental value for $\gamma$_. Por. [literatura 4.](#literatura)
```

# Literatura

1. dr Joanna Czub - _"Ciepło Właściwe - instrukcja wykonania projektu"_ - dostęp: 19.01.2026
2. dr hab. inż. Damian Rybicki - _"Pomiar średniego ciepła właściwego i wyznaczanie temperatury Debye'a"_ (Instrukcja do laboratorium nr 1) - dostęp: 17.01.2026
3. [http://www.knowledgedoor.com/2/elements_handbook/debye_temperature.html](http://www.knowledgedoor.com/2/elements_handbook/debye_temperature.html) dostęp: 19.01.2026
4. [https://en.wikipedia.org/wiki/Electronic_specific_heat](https://en.wikipedia.org/wiki/Electronic_specific_heat) - dostęp: 20.01.2026
5. Maciej Szeptuch - Kod źródłowy niniejszego dokumentu wraz z pełnym skryptem programu gnuplot [https://github.com/gucio321-studies/ciastkaProjekt2](https://github.com/gucio321-studies/ciastkaProjekt2)
