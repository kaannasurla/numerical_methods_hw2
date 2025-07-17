# numerical_methods_hw2
===========================================================================
===========================NASURLA KAAN 315CC==============================
================================TEMA 2 MN==================================
===========================================================================

========================TASK 1 Numerical_music=============================

1. function signal = apply_reverb(signal, impulse_response)

Funcția MATLAB apply_reverb simulează efectul de reverberație asupra unui semnal
audio. Aceasta realizează convoluția semnalului de intrare cu o răspuns impuls
(impulse response), care modelează acustica unui spațiu. Inițial, răspunsul impuls este convertit la mono. Apoi, funcția calculează lungimea necesară pentru o convoluție eficientă în domeniul frecvenței. Prin aplicarea Transformatei Fourier Rapide (FFT) ambelor semnale, înmulțirea lor element cu element și apoi aplicarea Transformatei Fourier Inverse (IFFT), se obține semnalul reverberat. În final, semnalul este trunchiat la lungimea originală și normalizat pentru a preveni distorsiunile, asigurând un efect de reverberație controlat și audibil.
___________________________________________________________________________
2. function y = high_pass(x, fs, fc)

Funcția MATLAB high_pass implementează un filtru trece-sus (high-pass). Aceasta
primește un semnal audio (x), rata de eșantionare (fs) și frecvența de tăiere (fc). Procesul implică transformarea semnalului în domeniul frecvenței folosind FFT. Apoi,
o mască este creată pentru a reține doar componentele de frecvență deasupra frecvenței de tăiere și a elimina celelalte. Această mască este aplicată semnalului transformat, iar rezultatul este convertit înapoi în domeniul timpului folosind IFFT. În final, semnalul filtrat este normalizat pentru a asigura o ieșire corespunzătoare.
___________________________________________________________________________
3. function x = oscillator(freq, fs, dur, A, D, S, R)

Funcția MATLAB oscillator generează o undă sinusoidală de amplitudine ADSR (Attack, Decay, Sustain, Release), esențială pentru simularea sunetelor muzicale. Primește frecvența (freq), rata de eșantionare (fs), durata (dur) și parametrii ADSR (A, D, S, R). Funcția creează o undă sinusoidală de bază, apoi calculează numărul de eșantioane pentru fiecare fază ADSR. Anvelopele pentru atac, decay, sustain și release sunt generate individual și combinate. În cele din urmă, unda sinusoidală este modulată în amplitudine cu anvelopa ADSR rezultată, creând un sunet care evoluează în timp, similar cu cel al unui instrument muzical.
___________________________________________________________________________
4. function [S f t] = spectrogram(signal, fs, window_size)

Funcția MATLAB spectrogram calculează și vizualizează spectrul de frecvență al unui semnal audio pe parcursul timpului. Aceasta împarte semnalul de intrare în ferestre mici, aplică o funcție de ponderare fiecărei ferestre pentru a reduce artefactele, și apoi efectuează Transformata Fourier Rapidă (FFT) pe fiecare fereastră. Rezultatul este o matrice S care arată intensitatea frecvențelor în timp. Funcția calculează, de asemenea, vectorii de frecvență (f) și timp (t) corespunzători, permițând o analiză detaliată a modului în care conținutul de frecvență al semnalului se schimbă în timp.
___________________________________________________________________________
5. function mono = stereo_to_mono(stereo)

Funcția calculează media aritmetică a celor două canale și după le normează.
___________________________________________________________________________


========================TASK 2 Robotzii====================================

1. function y_interp = P_spline(coef, x, x_interp)

Funcția MATLAB P_spline(coef, x, x_interp) este folositâ pentru evaluarea unui spline cubic în diverse puncte. Spline-ul este definit de o serie de segmente polinomiale cubice, ale căror coeficienți sunt stocați în vectorul coef. Funcția primește, pe lângă acești coeficienți, un set de noduri x și x_interp, punctele specifice unde dorim să calculăm valorile spline-ului. Pentru fiecare punct din x_interp, funcția efectuează o căutare binară eficientă pentru a identifica rapid intervalul corect [x_j, x_{j+1}] în care se încadrează punctul respectiv. Odată găsit intervalul, extrage coeficienții (a j, b j, c j, d j) corespunzători segmentului spline-ului din acel interval. În final, utilizează schema lui Horner pentru a evalua polinomul cubic specific intervalului la x_interp(i), asigurând o precizie și o eficiență computațională superioare.
___________________________________________________________________________
2. function y_interp = P_vandermonde(coef, x_interp)

Funcția MATLAB P_vandermonde(coef, x_interp) este proiectată pentru a evalua un polinom definit de un set de coeficienți în unul sau mai multe puncte de interpolare. Funcția primește vectorul coef și un vector x_interp care conține punctele în care dorim să evaluăm polinomul. Prin aplicarea schemei lui Horner, o metodă computațional eficientă și numeric stabilă pentru evaluarea polinoamelor. Prin această schemă, calculul se realizează iterativ, începând de la cel mai înalt grad al polinomului și coborând, minimizând numărul de înmulțiri necesare. Rezultatul final este un vector y_interp, care conține valorile polinomului evaluate pentru fiecare punct din x_interp, oferind o modalitate rapidă și precisă de a calcula valorile funcției polinomiale.
___________________________________________________________________________
3. function [x, y] = parse_data(filename)

Funcția MATLAB parse_data(filename) este folosită pentru citirea și structurarea
datelor dintr-un fișier text cu un format predefinit. Ea așteaptă un fișier care
conține pe prima linie un număr întreg n, urmat pe a doua linie de n+1 valori pentru x (coordonatele pe axa orizontală) și pe a treia linie de n+1 valori pentru y (coordonatele pe axa verticală), toate separate prin spații. Procesul începe
prin deschiderea fișierului specificat de filename în modul citire. Apoi, utilizează funcția fscanf pentru a extrage succesiv valoarea lui n, urmată de cele n+1 valori pentru vectorul x și, în final, cele n+1 valori pentru vectorul y. La sfârșit, fișierul este închis, eliberând resursele sistemului. Practic, parse_data transformă un fișier text simplu într-o pereche de vectori numerici x și y, gata pentru a fi folosiți în diverse aplicații matematice sau de plotare.
___________________________________________________________________________
4. function coef = spline_c2(x, y)

Funcția MATLAB spline_c2(x, y) este folosită pentru calculul coeficienților unui spline cubic natural (C2) care interpolează un set dat de puncte (x,y). Procesul implică construirea și rezolvarea unui sistem liniar de ecuații de forma A⋅coef=b. Prin combinarea tuturor condițiilor, se obține un sistem de 4n ecuații cu 4n necunoscute (coeficienții a, b, c, d pentru fiecare dintre cele n intervale). Rezolvarea acestui sistem liniar (coef = A \ b;) furnizează vectorul coef care conține toți coeficienții necesari pentru a evalua ulterior spline-ul în orice punct, folosind o funcție precum P_spline.
___________________________________________________________________________
5. function coef = vandermonde(x, y)

Funcția MATLAB vandermonde(x, y) este utilizată pentru a determina coeficienții unui polinom de interpolare care trece exact prin setul de puncte date (x,y). Acest lucru se realizează prin construirea și rezolvarea unui sistem liniar de ecuații, unde necunoscutele sunt coeficienții polinomului. Mai întâi, funcția construiește matricea Vandermonde (A). Această matrice este formată din puterile coordonatelor x ale punctelor, unde fiecare rând corespunde unui punct, iar coloanele reprezintă puterile lui x de la x0 la xn. Odată construită, problema interpolării polinomiale se transformă în rezolvarea sistemului liniar A⋅coef=y, unde coef este vectorul de coeficienți ai polinomului pe care îl căutăm. În loc să utilizeze operatorul de împărțire a matricilor din MATLAB (\) direct (care ar folosi metode interne optimizate), această funcție implementează manual eliminarea gaussiană cu pivotare parțială (GPP). După ce matricea este transformată, coeficienții polinomului sunt calculați printr-o substituție inversă, pornind de la ultimul coeficient și calculând recursiv celelalte. Rezultatul este vectorul coef, conținând coeficienții polinomului de interpolare.
___________________________________________________________________________

============================TASK 3 Recommendations=========================

1. function similarity = cosine_similarity(A, B)

Funcția MATLAB cosine_similarity(A, B) calculează similaritatea cos dintre doi
vectori, A și B. Indicâ cât de mult "se aliniază" doi vectori în spațiu,
independent de mărimea lor. Funcția operează în trei pași principali: mai întâi,
normalizează vectorii prin calcularea normelor lor euclidiene (lungimile). Apoi,
determină produsul scalar al celor doi vectori, care măsoară cât de mult se
suprapun direcțiile lor. În cele din urmă, similaritatea cos este calculată prin
împărțirea produsului scalar la produsul normelor vectorilor. De asemenea,
rezultatul este ajustat pentru a garanta că se încadrează în intervalul [-1, 1],
unde 1 înseamnă o aliniere perfectă, -1 o opoziție perfectă, iar 0 o lipsă de
relație.
___________________________________________________________________________
2. function mat = read_mat(path)

Funcția MATLAB read_mat(path) este destinată destinată citirii datelor dintr-un
fișier CSV și pregătirii lor pentru procesări ulterioare.
___________________________________________________________________________
3. function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)

Funcția MATLAB recommendations identifică teme similare cu una specifică, apreciată de
utilizator. Ea începe prin a citi și preprocesa o matrice de date (mat). Aceasta descompune valorilor singulare (SVD), realizată cu svds(mat, num_features). Aceasta reduce complexitatea datelor, extrăgând num_features. După obținerea reprezentărilor latente ale temelor (matricea V din SVD), funcția calculează similaritatea cos între vectorul latent al temei apreciate de utilizator și vectorii latenti ai tuturor celorlalte teme. Similaritatea cos măsoară unghiul dintre doi vectori, o valoare mai apropiată de 1 indicând o similaritate mai mare. Un algoritm de sortare (bubble sort) l-am utilizat pentru a ordona temele în ordine descrescătoare a similarității. În final, funcția extrage primele num_recoms teme din această listă sortată,
excluzând tema originală, și le returnează ca recomandări.
___________________________________________________________________________
===========================================================================
