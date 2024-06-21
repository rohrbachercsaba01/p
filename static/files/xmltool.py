import os
from static.files import cleaner


inside_adat = False
van_adat = 0
nincs_adat = 0
nincs_adat_sora = []

van_orszag_kor = 0
hianyzo_orszagkodok = []
hianyzo_orszagkod_sorok = []
osszes_orszag_kor = 0
orszagkodok_in_xml = set()
orszagkodok = []

rossz_százalék = []

foglalas_data_tag = 'foglalasAzonosito'

napi_data_tag = ['szoftverVerzio', 'szallasAdatszolgaltatasiAzonosito', 'szallasNev',
                            'szallashelySzolgaltatoAdoszam', 'szallashelySzolgaltatoNev', 'uzenetId', 'napiZaras',
                            'hatalyosIfa', 'ifaJelleg', 'napiFeltoltes', 'lezartNap', 'lezarasIdopont', 'szobaAdatok',
                            'osszesSzoba', 'oooSzobak', 'oosSzobak', 'kiadottSzobak', 'kiadhatoSzobak',
                            'lakoegysegEjszakak', 'nappaliHasznalat', 'epulet', 'szobaszam', 'tipus', 'egyfosAgySzam',
                            'ketfosAgySzam', 'potAgySzam', 'ertekesitesiCsatorna', 'piaciSzegmens', 'foglalasiSzam',
                            'koltes', 'osszeg', 'koltesTipus', 'koltesAlTipus', 'terheles', 'kategoria', 'isIfa',
                            'afaKulcs', 'vendegek', 'vendegId', 'szuletesiEv', 'nem', 'allampolgarsagOrszagKod',
                            'lakohelyOrszagKod', 'lakohelyIranyitoszam', 'ifaStatusz', 'uzemenKivuliSzobak',
                            'kijelentkezesNapi', 'napiAra', 'vendegVendegId', 'vendegVezeteknev', 'vendegKeresztnev',
                            'vendegNem', 'vendegSzuletesiDatum', 'vendegAllampolgarsag', 'vendegLakohelyOrszagKod',
                            'vendegLakohelyIranyitoszam', 'csekkSzam', 'erkezesNapja', 'tavozasNapja',
                            'idopontSzamlaKelt', 'idopontFizetes', 'helyszin', 'kivantSzobaszam', 'szamlaAzonosito',
                            'nyomtatottSzamla', 'szamlaKiadasa', 'penzforgalom', 'pénzforgalom']


# Országkódok vizsgálata

def analyze_country_codes(lines, orszag_kod):
    global van_orszag_kor, hianyzo_orszagkodok, hianyzo_orszagkod_sorok, osszes_orszag_kor

    for line_number, line in enumerate(lines, start=1):
        if f'<allampolgarsagOrszagKod>' in line and f'</allampolgarsagOrszagKod>' in line:
            inside_adat = True
            if orszag_kod in line:
                van_orszag_kor += 1
    for line_number, line in enumerate(lines, start=1):
        if f'<allampolgarsagOrszagKod>' in line and f'</allampolgarsagOrszagKod>' in line:
            inside_adat = True
            orszag_kodok = line.strip().split('</allampolgarsagOrszagKod>')
            for orszag_kod_elem in orszag_kodok:
                orszag_kod_elem = orszag_kod_elem.replace('<allampolgarsagOrszagKod>', '').strip()
                if orszag_kod_elem:
                    osszes_orszag_kor += 1
                    if orszag_kod_elem not in orszagkodok:
                        if orszag_kod_elem not in hianyzo_orszagkodok:
                            hianyzo_orszagkodok.append(orszag_kod_elem)
                            hianyzo_orszagkod_sorok.append((line_number, line.strip()))

    for line in lines:
        if f'<allampolgarsagOrszagKod>' in line and f'</allampolgarsagOrszagKod>' in line:
            orszag_kod_elem = line.strip().replace('<allampolgarsagOrszagKod>', '').replace('</allampolgarsagOrszagKod>', '').strip()
            if orszag_kod_elem:
                orszagkodok_in_xml.add(orszag_kod_elem)
    return van_orszag_kor, hianyzo_orszagkodok, hianyzo_orszagkod_sorok, osszes_orszag_kor


# Lakóhely országkódok vizsgálata

def analyze_residence_country_codes(lines, orszag_kod):
    global van_orszag_kor, hianyzo_orszagkodok, hianyzo_orszagkod_sorok, osszes_orszag_kor

    for line_number, line in enumerate(lines, start=1):
        if f'<lakohelyOrszagKod>' in line and f'</lakohelyOrszagKod>' in line:
            inside_adat = True
            if orszag_kod in line:
                van_orszag_kor += 1
    for line_number, line in enumerate(lines, start=1):
        if f'<lakohelyOrszagKod>' in line and f'</lakohelyOrszagKod>' in line:
            inside_adat = True
            orszag_kodok = line.strip().split('</lakohelyOrszagKod>')
            for orszag_kod_elem in orszag_kodok:
                orszag_kod_elem = orszag_kod_elem.replace('<lakohelyOrszagKod>', '').strip()
                if orszag_kod_elem:
                    osszes_orszag_kor += 1
                    if orszag_kod_elem not in orszagkodok:
                        if orszag_kod_elem not in hianyzo_orszagkodok:
                            hianyzo_orszagkodok.append(orszag_kod_elem)
                            hianyzo_orszagkod_sorok.append((line_number, line.strip()))

    for line in lines:
        if f'<lakohelyOrszagKod>' in line and f'</lakohelyOrszagKod>' in line:
            orszag_kod_elem = line.strip().replace('<lakohelyOrszagKod>', '').replace('</lakohelyOrszagKod>', '').strip()
            if orszag_kod_elem:
                orszagkodok_in_xml.add(orszag_kod_elem)
    return van_orszag_kor, hianyzo_orszagkodok, hianyzo_orszagkod_sorok, osszes_orszag_kor


# Adat vizsgálata

def analyze_data(lines, adat_valtozo):
    global van_adat, nincs_adat, nincs_adat_sora

    for line_number, line in enumerate(lines, start=1):
        if f'<{adat_valtozo}>' in line:
            inside_adat = True
            if f'</{adat_valtozo}>' in line:
                if line.strip() == f'<{adat_valtozo}></{adat_valtozo}>':
                    nincs_adat += 1
                    nincs_adat_sora.append((line_number, line.strip()))
                else:
                    van_adat += 1
            else:
                nincs_adat += 1
                nincs_adat_sora.append((line_number, line.strip()))
        elif f'<{adat_valtozo} />' in line:
            nincs_adat += 1
            nincs_adat_sora.append((line_number, line.strip()))
        elif f'</{adat_valtozo}>' in line:
            inside_adat = False
            van_adat += 1
    return van_adat, nincs_adat, nincs_adat_sora


# Áfa százalék vizsgálata
def analyze_afa(lines):
    global van_adat, nincs_adat, nincs_adat_sora, rossz_százalék

    rossz_százalék = []

    for line_number, line in enumerate(lines, start=1):
        if f'<szazalek>' in line:
            inside_adat = True
            if f'</szazalek>' in line:
                if line.strip() == f'<szazalek></szazalek>':
                    nincs_adat += 1
                    nincs_adat_sora.append((line_number, line.strip()))
                else:
                    szazalek_ertek = int(line.strip().replace('<szazalek>', '').replace('</szazalek>', '').strip())
                    if szazalek_ertek not in (0, 5, 15, 27):
                        rossz_százalék.append((line_number, szazalek_ertek))
                    van_adat += 1
            else:
                szazalek_ertek = int(line.strip().replace('<szazalek>', '').replace('</szazalek>', '').strip())
                if szazalek_ertek not in (0, 5, 15, 27):
                    rossz_százalék.append((line_number, szazalek_ertek))
                    van_adat += 1
        elif f'<szazalek />' in line:
            nincs_adat += 1
            nincs_adat_sora.append((line_number, line.strip()))
        elif f'</szazalek>' in line:
            inside_adat = False
            van_adat += 1
    return van_adat, nincs_adat, nincs_adat_sora, rossz_százalék


# Napi zárás vizsgálata
def check_napi_zaras(lines):
    for line_number, line in enumerate(lines, start=1):
        if f'<{napi_data_tag}>' in line or f'<{napi_data_tag}/>' in line:
            return True
    return False


# Foglalás vizsgálata

def check_foglalas(lines):
    for line_number, line in enumerate(lines, start=1):
        if f'<{foglalas_data_tag}>' in line or f'<{foglalas_data_tag}/>' in line:
            return True
    return False


# Főprogram
def mainprog(xml_data, choice):
    answer = []

    xml_file = cleaner.main(xml_data)
    
    while True:
        #absolute_path = os.path.dirname(os.path.abspath(__file__))
        #xml_files = [f for f in os.listdir(absolute_path) if f.endswith('.xml')]
        txt_directory = os.path.dirname(os.path.abspath(__file__))
        orszagkod_file_name = "orszagkodok.txt"
        orszagkod_file_path = os.path.join(txt_directory, orszagkod_file_name)

        lines = []

        with open(xml_file, 'r') as file:
            lines = file.readlines()
            print(lines)

        with open(orszagkod_file_path, 'r', encoding='utf-8') as orszagkod_file:
            for line in orszagkod_file:
                orszagkodok.append(line.strip())
        
        print(orszagkodok)

        print("\n")
        #choice = ("Válassz a következő lehetőségek közül:\n1.  Országkódok vizsgálata\n2.  Adat vizsgálata\n3.  Áfa százalék vizsgálata\n4.  Napi zárás vizsgálat\n5.  Foglalás vizsgálat\n6.  Lakóhely országkódok vizsgálata\nq.  Kilépés\n")
        print("\n")

        # kilépés
        if choice == 'q':
            break

        # országkódok vizsgálata
        elif choice == '1':
            orszag_kod = input("Az országkódok vizsgálata nyomj enter-t: ")
            van_orszag_kor, hianyzo_orszagkodok, hianyzo_orszagkod_sorok, osszes_orszag_kor = analyze_country_codes(lines, orszag_kod)
            for orszag_kod in orszagkodok_in_xml:
                darabszam = sum(1 for line in lines if f'<allampolgarsagOrszagKod>{orszag_kod}</allampolgarsagOrszagKod>' in line)
                print(f"{orszag_kod}: {darabszam} darab")
            print(f"Az összes országkód: {osszes_orszag_kor}\n")
            print(f"Sorok száma ahol szerepel ISO kód de nincs a txt fájlban: {len(hianyzo_orszagkodok)}\n")
            if hianyzo_orszagkod_sorok:
                print("Sorok ahol hibás ISO kódok találhatók:")
                for line_number, line_content in hianyzo_orszagkod_sorok:
                    print(f"Sor {line_number}: {line_content}")
                print("\n")

        # lakóhely országkódok vizsgálata
        elif choice == '6':
            orszag_kod = input("A lakóhely országkódok vizsgálata nyomj enter-t: ")
            van_orszag_kor, hianyzo_orszagkodok, hianyzo_orszagkod_sorok, osszes_orszag_kor = analyze_residence_country_codes(lines, orszag_kod)
            for orszag_kod in orszagkodok_in_xml:
                darabszam = sum(1 for line in lines if f'<lakohelyOrszagKod>{orszag_kod}</lakohelyOrszagKod>' in line)
                print(f"{orszag_kod}: {darabszam} darab")
            print(f"Az összes lakóhely országkód: {osszes_orszag_kor}\n")
            print(f"Sorok száma ahol szerepel ISO kód de nincs a txt fájlban: {len(hianyzo_orszagkodok)}\n")
            if hianyzo_orszagkod_sorok:
                print("Sorok ahol hibás ISO kódok találhatók:")
                for line_number, line_content in hianyzo_orszagkod_sorok:
                    print(f"Sor {line_number}: {line_content}")
                print("\n")

        # adat vizsgálata
        elif choice == '2':
            adat_valtozo = input("Az adat típus amiket megszeretnénk vizsgálni: ")
            print("\n")
            # Az értékek közötti rész kezdete és vége
            kezdo_cimke = f"<{adat_valtozo}>"
            vegso_cimke = f"</{adat_valtozo}>"

            # Találatok listája
            talalatok = []

            # Tartalmazza az összes sorokat, ahol az adat_valtozo között van érték
            for sor in lines:
                if kezdo_cimke in sor and vegso_cimke in sor:
                    kezdo_index = sor.index(kezdo_cimke) + len(kezdo_cimke)
                    vegso_index = sor.index(vegso_cimke)
                    ertek = sor[kezdo_index:vegso_index]
                    talalatok.append(ertek)

            # Számlálja meg az értékek előfordulásait
            szamlalo = {}
            for ertek in talalatok:
                if ertek in szamlalo:
                    szamlalo[ertek] += 1
                else:
                    szamlalo[ertek] = 1

            # Kiírja az összes értéket és az előfordulások számát
            for ertek, elofordulasok in szamlalo.items():
                print(f"{ertek}: {elofordulasok} alkalommal fordul elő.")
            van_adat, nincs_adat, nincs_adat_sora = analyze_data(lines, adat_valtozo)
            print(f"Sorok száma ahol szerepel [{adat_valtozo}] adat: {van_adat}")
            print(f"Sorok száma ahol nem szerepel [{adat_valtozo}] adat: {nincs_adat}\n")
            if nincs_adat_sora:
                print(f"Azok a sorok ahol üres a {adat_valtozo} adat:")
                for line_number, line_content in nincs_adat_sora:
                    print(f"{line_number}.sor")
                print("\n")

        # áfa százalék vizsgálata
        elif choice == '3':
            szazalekok = {0: 0, 5: 0, 18: 0, 27: 0}
            kulonbozo_szazalekok = set()

            for line_number, line in enumerate(lines, start=1):
                if '<szazalek>' in line:
                    szazalek_ertek = line.strip().replace('<szazalek>', '').replace('</szazalek>', '').strip()
                    if szazalek_ertek:
                        szazalek_ertek = int(szazalek_ertek)
                        if szazalek_ertek in szazalekok:
                            szazalekok[szazalek_ertek] += 1
                        else:
                            kulonbozo_szazalekok.add(szazalek_ertek)

            print("Az előfordulások száma az Áfa százalékok szerint:")
            for szazalek, darab in szazalekok.items():
                print(f"{szazalek}: {darab} darab")
                answer.append(f"{szazalek}: {darab} darab" )

            if kulonbozo_szazalekok:
                print("Eltérő Áfa százalék értékek:")
                for szazalek in kulonbozo_szazalekok:
                    print(szazalek)
                    answer.append("Eltérő Áfa százalék értékek:" + szazalek)

            return answer, choice 

        # napi zárás vizsgálata
        elif choice == '4':
        
            if check_napi_zaras(lines):
                print("Napi zárás történt.")
                answer.append("Napi zárás történt.")
            else:
                print("Nem történt napi zárás.")
                answer.append("Nem történt napi zárás.")
            
            return answer, choice

        # foglalás vizsgálata
        elif choice == '5':
            
            if check_foglalas(lines):
                print("Foglalás történt.")
                answer.append("Foglalás történt.")
            else:
                print("Nem történt foglalás.")
                answer.append("Nem történt foglalás.")
            
            return answer, choice

        else:
            print("Érvénytelen választás. Kérlek válassz a felsorolt lehetőségek közül.")
            return "Érvénytelen választás. Kérlek válassz a felsorolt lehetőségek közül."
