
<h1><?= $title ?></h1>

<p>
	Adatbázis: phpMyAdmin
<br><br>
A projektben egy online autószalon került megvalósításra.
<br><br>
A felhasználók tudnak regisztrálni, majd a regisztrációt követően autókat feltölteni, illetve kategóriákat szerkeszteni. A felhasználó a saját posztját szerkesztheti, illetve törölheti, mások posztjait azonban csak megtekintheti, illetve azokhoz kommenteket írhat. A sima felhasználó csak a tulajdonában lévő autókat tudja szerkeszteni, illetve törölni.
<br><br>
Szerepkörök: <br>
- sima felhasználó: regisztrálás során bekerül az adatbázisba, melynek alapból 0-ás admin szintet állít be a rendszer (0: sima felhasználó, 1: admin) <br>
- admin: adatbázisban át lehet állítani egy felhasználó admin mezőjét 1-re, ami jelzi, hogy az adott felhasználó egyben admin is. <br>
Az admin szerepköre: Bárki posztját tudja szerkeszteni, illetve törölni.
<br><br>
Importálási lehetőségek: <br>
- lehet importálni adatokat (a postnál megjelenő import gomb lenyomását követően elérhető) <br>
- importálni csak vesszővel elválasztott, .csv kiterjesztésű fájlokat lehet
<br><br>
Készítette: Sirák Norbert
<br>
NK: CVJVS1


</p>