-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Jún 11. 16:36
-- Kiszolgáló verziója: 10.4.18-MariaDB
-- PHP verzió: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `web3`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`) VALUES
(1, 'Business', '2021-06-02 14:43:39'),
(3, 'Technology', '2021-06-02 17:24:09'),
(4, 'Other', '2021-06-02 17:46:03'),
(5, 'SportCars', '2021-06-02 18:05:59'),
(6, 'HiperSport', '2021-06-02 18:06:09'),
(7, 'Luxurious', '2021-06-02 18:06:19'),
(8, 'pickup', '2021-06-02 15:00:38');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `name`, `email`, `body`, `created_at`) VALUES
(1, 13, 'test1', 'test1@gmail.com', 'Mennyit fogyaszt?\r\nÜdv', '2021-06-03 04:31:03'),
(2, 13, 'test2', 'test2@gmail.com', 'Mennyibe kerül?', '2021-06-03 06:53:47');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `post_image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `title`, `slug`, `body`, `post_image`, `created_at`) VALUES
(12, 1, 1, 'test no image', 'test-no-image', '<p>no image checker</p>\r\n', 'noimage.jpg', '2021-06-02 16:12:18'),
(13, 5, 1, 'Ferrari', 'Ferrari', '<p>Ak&aacute;rhogy is vakar&oacute;zok, mindenk&eacute;ppen az M6-os BMW-hez fogok kilyukadni, mese nincs, &eacute;s azt legal&aacute;bb&nbsp;<a href=\"https://totalcar.hu/tesztek/bmwm6bem/\">vezettem is</a>, versenyp&aacute;ly&aacute;n &eacute;s k&ouml;z&uacute;ton egyar&aacute;nt. Akkor nem gondoltam volna, hogy egyszer ilyen ir&aacute;ny&uacute; szents&eacute;gt&ouml;r&eacute;st k&ouml;vetek majd el: ciki lesz egy aut&oacute;nak, hogy az M6-os BMW-hez hasonl&iacute;tj&aacute;k, a Ferrarin&aacute;l pedig ez a helyzet. Nem lehet őket egy lapon eml&iacute;teni, de ehhez &ouml;ssze kellett h&iacute;vnom egy gyors szerkesztős&eacute;gi konz&iacute;liumot.</p>\r\n\r\n<p>Elősz&ouml;r is az M6 h&uacute;szmilli&oacute;val olcs&oacute;bb. M&aacute;sodszor negyven l&oacute;val erősebb, &eacute;s b&aacute;r egy bő kateg&oacute;ri&aacute;val nagyobb aut&oacute; (+30 centi hossz, +11 centi tengelyt&aacute;v), csak f&eacute;l m&aacute;zs&aacute;val nehezebb. &Eacute;s az M6 is cs&uacute;cstechnika, eg&eacute;szen fantasztikus a p&aacute;ly&aacute;n, &eacute;lhető a mindennapokban, a kevl&aacute;rtető miatt pazar a s&uacute;lypontja, &eacute;s t&eacute;nyleg: ha m&aacute;r a s&uacute;lyn&aacute;l vagyunk, hogy lehet a m&eacute;g hengerűrtartalomban is nagyobb BMW csak alig 50 kil&oacute;val s&uacute;lyosabb? Hov&aacute; az &ouml;rd&ouml;gbe b&uacute;jt a h&iacute;res Ferrari-cs&uacute;cstechnika?</p>\r\n', 'Unknown.jpg', '2021-06-02 16:16:33'),
(14, 5, 1, 'Ferrari 488 GTB', 'Ferrari-488-GTB', '<p>Magyarorsz&aacute;gon l&eacute;vő aut&oacute;, nem importszolg&aacute;ltat&aacute;s hirdet&eacute;s! 7 &eacute;ves kor&aacute;ig teljes k&ouml;rű Garanci&aacute;val rendelkezik. Extr&aacute;i: Bi-Xenon f&eacute;nysz&oacute;r&oacute;k LED-es helyzet &eacute;s ir&aacute;nyjelzőkkel, Elektromosan &aacute;ll&iacute;that&oacute;-fűthető k&uuml;lső t&uuml;kr&ouml;k, 20 m&eacute;retű k&ouml;nnyűf&eacute;m ker&eacute;kt&aacute;rcs&aacute;k, Bőrk&aacute;rpit, Karbon-sz&ouml;vet korm&aacute;nyker&eacute;k LED-ekkel, K&eacute;tz&oacute;n&aacute;s l&eacute;gkondicion&aacute;l&oacute;, Multim&eacute;di&aacute;s rendszer USB csatlakoz&oacute;val &eacute;s 6, 5 m&eacute;retű kijelzővel, HI-FI rendszer Bluetooth funkci&oacute;val &eacute;s DAB r&aacute;di&oacute;val, Kulcsn&eacute;lk&uuml;li ind&iacute;t&aacute;s, F&eacute;ny- &eacute;s eső&eacute;rz&eacute;kelő, Lop&aacute;sg&aacute;tl&oacute; rendszer, Karbon-ker&aacute;mia f&eacute;krendszer, F1 v&aacute;lt&oacute;mű duplakuplungos sebess&eacute;gv&aacute;lt&oacute;, Navig&aacute;ci&oacute;, Tolat&oacute;radar, Tempomat, Verseny&uuml;l&eacute;sek Goldrake st&iacute;lusban, Utasoldali kijelző. Aut&oacute;inkba Csere-Besz&aacute;m&iacute;t&aacute;s-R&aacute;fizet&eacute;s lehets&eacute;ges, Hitelre ak&aacute;r 10%-t&oacute;l! Aut&oacute;inkra ig&eacute;ny szerint 6-12 h&oacute;nap garanci&aacute;t tudunk biztos&iacute;tani. All-Car, Minden ami aut&oacute;! hitel&nbsp;[ telefonsz&aacute;m felfed&eacute;se ]&nbsp;biztos&iacute;t&aacute;s&nbsp;[ telefonsz&aacute;m felfed&eacute;se ]&nbsp;szerviz, ak&aacute;r hozott aut&oacute;ra is! Teljes-k&ouml;rű &uuml;gyint&eacute;z&eacute;s. Bizom&aacute;nyosi &eacute;rt&eacute;kes&iacute;t&eacute;s! Csere, Besz&aacute;m&iacute;t&aacute;s! Hirdet&eacute;s&uuml;nk nem minős&uuml;l aj&aacute;nlatt&eacute;telnek. Hirdet&eacute;sben szereplő sz&ouml;veghib&aacute;&eacute;rt tov&aacute;bbi f. e. l. e. l. ő. s. s. &eacute;. g. e. t. /kock&aacute;zatot nem v&aacute;llalunk. K&eacute;rj&uuml;k tekintse meg k&iacute;n&aacute;latunkat. A n&aacute;lunk v&aacute;s&aacute;rolt aut&oacute;k szervizel&eacute;s&eacute;t &eacute;s alkatr&eacute;sz ell&aacute;t&aacute;s&aacute;t v&aacute;llaljuk! Nyitva tart&aacute;s: H&eacute;tfőtől-P&eacute;ntekig 09:00-18:00, Szombaton: 09:00-14:00, Vas&aacute;rnap: Z&aacute;rva. C&iacute;m&uuml;nk 1151 Budapest Sz&aacute;nt&oacute;f&ouml;ld &uacute;t 3.&Uuml;gyf&eacute;lparkol&oacute; a keresked&eacute;sen bel&uuml;l, t&ouml;megk&ouml;zleked&eacute;ssel 124-es busz R&eacute;gi F&oacute;ti u.-i meg&aacute;ll&oacute;ja, teleppel szemben &aacute;ll meg!&nbsp;<br />\r\n<br />\r\nFelszerelts&eacute;g: 12 hangsz&oacute;r&oacute;&nbsp;- ABS (blokkol&aacute;sg&aacute;tl&oacute;)&nbsp;- ADS (adapt&iacute;v leng&eacute;scsillap&iacute;t&oacute;)&nbsp;- APS (parkol&oacute;radar)&nbsp;- ASR (kip&ouml;rg&eacute;sg&aacute;tl&oacute;)&nbsp;- Automata sebess&eacute;gv&aacute;lt&oacute;&nbsp;- automatikusan s&ouml;t&eacute;tedő belső t&uuml;k&ouml;r&nbsp;- automatikusan s&ouml;t&eacute;tedő k&uuml;lső t&uuml;k&ouml;r&nbsp;- bi-xenon f&eacute;nysz&oacute;r&oacute;&nbsp;- bluetooth-os kihangos&iacute;t&oacute;&nbsp;- bőr belső&nbsp;- centr&aacute;lz&aacute;r&nbsp;- Digit&aacute;lis k&eacute;tz&oacute;n&aacute;s kl&iacute;ma&nbsp;- elektromos ablak el&ouml;l&nbsp;- elektromos t&uuml;k&ouml;r&nbsp;- ESP (menetstabiliz&aacute;tor)&nbsp;- fed&eacute;lzeti komputer&nbsp;- f&eacute;nysz&oacute;r&oacute; magass&aacute;g&aacute;ll&iacute;t&aacute;s&nbsp;- GPS (navig&aacute;ci&oacute;)&nbsp;- guminyom&aacute;s-ellenőrző rendszer&nbsp;- gy&aacute;ri erős&iacute;tő&nbsp;- HIFI&nbsp;- ind&iacute;t&aacute;sg&aacute;tl&oacute; (immobiliser)&nbsp;- ker&aacute;mia f&eacute;kt&aacute;rcs&aacute;k&nbsp;- k&ouml;nnyűf&eacute;m felni&nbsp;- kulcsn&eacute;lk&uuml;li ind&iacute;t&aacute;s&nbsp;- LED f&eacute;nysz&oacute;r&oacute;&nbsp;- m&eacute;lynyom&oacute;&nbsp;- MP3 lej&aacute;tsz&aacute;s&nbsp;- multifunkci&oacute;s korm&aacute;nyker&eacute;k&nbsp;- rabl&aacute;sg&aacute;tl&oacute;&nbsp;- riaszt&oacute;&nbsp;- sebess&eacute;gf&uuml;ggő szerv&oacute;korm&aacute;ny&nbsp;- sperr differenci&aacute;lmű&nbsp;- sportfut&oacute;mű&nbsp;- sport&uuml;l&eacute;sek&nbsp;- szervokorm&aacute;ny&nbsp;- sz&iacute;nezett &uuml;veg&nbsp;- t&aacute;vols&aacute;gi f&eacute;nysz&oacute;r&oacute; asszisztens&nbsp;- t&aacute;vols&aacute;gtart&oacute; tempomat&nbsp;- tolat&oacute;radar&nbsp;- USB csatlakoz&oacute;&nbsp;- utasoldali l&eacute;gzs&aacute;k&nbsp;- vezetőoldali l&eacute;gzs&aacute;k.&nbsp;<br />\r\n<br />\r\nEgy&eacute;b inform&aacute;ci&oacute;: azonnal elvihető&nbsp;- gar&aacute;zsban tartott&nbsp;- keveset futott&nbsp;- Magyarorsz&aacute;gon &uacute;jonnan &uuml;zembe helyezett&nbsp;- nem doh&aacute;nyz&oacute;&nbsp;- rendszeresen karbantartott&nbsp;- szervizk&ouml;nyv&nbsp;- t&ouml;rzsk&ouml;nyv&nbsp;- 20%-t&oacute;l elvihető</p>\r\n', 'Ferrari.jpg', '2021-06-02 14:49:54'),
(15, 7, 1, 'Bentley Continental GT 6.0 (Automata)', 'Bentley-Continental-GT-60-Automata', '<p>Az Aut&oacute;n Friss Olajcsere, V&aacute;lt&oacute;olaj Csere, Gyerty&aacute;k Cser&eacute;je, Fut&oacute;mű Cser&eacute;je Lett Elv&eacute;gezve. A G&eacute;pj&aacute;rmű Megtekint&eacute;se Előre Egyeztetett Időpontban Lehets&eacute;ges. Tov&aacute;bbi Aut&oacute;ink Megtekinthetők: J&aacute;rműveink Ugyanitt Men&uuml;pont Alatt. Kedvező Finansz&iacute;roz&aacute;sban Seg&iacute;ts&eacute;get Tudunk Ny&uacute;jtani. Keresked&eacute;s&uuml;nkben Teljes K&ouml;rű &Uuml;gyint&eacute;z&eacute;ssel &Aacute;t&iacute;r&aacute;s, Biztos&iacute;t&aacute;sk&ouml;t&eacute;s, Eredetvizsga &Aacute;llunk Rendelkez&eacute;s&uuml;kre. Szolg&aacute;ltat&aacute;saink: - Haszn&aacute;lt G&eacute;pj&aacute;rmű &Eacute;rt&eacute;kes&iacute;t&eacute;s, - Aut&oacute; B&eacute;rbead&aacute;s, Haszn&aacute;ltaut&oacute; Besz&aacute;m&iacute;t&aacute;s T&iacute;pust&oacute;l, Kort&oacute;l F&uuml;ggetlen&uuml;l, - K&eacute;szp&eacute;nzes Aut&oacute;felv&aacute;s&aacute;rl&aacute;s, - Műszaki Vizsg&aacute;ztat&aacute;s, - Eredetvizsga, - K&uuml;lf&ouml;ldi G&eacute;pj&aacute;rmű Forgalomba Helyez&eacute;s, G&eacute;pj&aacute;rmű Beszerz&eacute;s Ak&aacute;r K&uuml;lf&ouml;ldről Is.&nbsp;<br />\r\n<br />\r\nFelszerelts&eacute;g: 12 hangsz&oacute;r&oacute;&nbsp;- ABS (blokkol&aacute;sg&aacute;tl&oacute;)&nbsp;- ADS (adapt&iacute;v leng&eacute;scsillap&iacute;t&oacute;)&nbsp;- &aacute;ll&iacute;that&oacute; felf&uuml;ggeszt&eacute;s&nbsp;- &aacute;ll&iacute;that&oacute; korm&aacute;ny&nbsp;- APS (parkol&oacute;radar)&nbsp;- ASR (kip&ouml;rg&eacute;sg&aacute;tl&oacute;)&nbsp;- Automata (6 fokozat&uacute; tiptronic) sebess&eacute;gv&aacute;lt&oacute;&nbsp;- automatikusan s&ouml;t&eacute;tedő belső t&uuml;k&ouml;r&nbsp;- automatikusan s&ouml;t&eacute;tedő k&uuml;lső t&uuml;k&ouml;r&nbsp;- bi-xenon f&eacute;nysz&oacute;r&oacute;&nbsp;- bőr belső&nbsp;- CD t&aacute;r&nbsp;- CD-s aut&oacute;r&aacute;di&oacute;&nbsp;- centr&aacute;lz&aacute;r&nbsp;- Digit&aacute;lis t&ouml;bbz&oacute;n&aacute;s kl&iacute;ma&nbsp;- d&ouml;nthető utas&uuml;l&eacute;sek&nbsp;- elektromos ablak el&ouml;l&nbsp;- elektromos ablak h&aacute;tul&nbsp;- elektromos t&uuml;k&ouml;r&nbsp;- elektromos &uuml;l&eacute;s&aacute;ll&iacute;t&aacute;s utasoldal&nbsp;- elektromos &uuml;l&eacute;s&aacute;ll&iacute;t&aacute;s vezetőoldal&nbsp;- elektromosan behajthat&oacute; k&uuml;lső t&uuml;kr&ouml;k&nbsp;- esőszenzor&nbsp;- ESP (menetstabiliz&aacute;tor)&nbsp;- fed&eacute;lzeti komputer&nbsp;- f&eacute;nysz&oacute;r&oacute;mos&oacute;&nbsp;- f&uuml;gg&ouml;nyl&eacute;gzs&aacute;k&nbsp;- fűthető t&uuml;k&ouml;r&nbsp;- fűthető &uuml;l&eacute;s&nbsp;- GPS (navig&aacute;ci&oacute;)&nbsp;- guminyom&aacute;s-ellenőrző rendszer&nbsp;- h&aacute;ts&oacute; fejt&aacute;ml&aacute;k&nbsp;- HIFI&nbsp;- ind&iacute;t&aacute;sg&aacute;tl&oacute; (immobiliser)&nbsp;- kihangos&iacute;t&oacute;&nbsp;- kikapcsolhat&oacute; l&eacute;gzs&aacute;k&nbsp;- korm&aacute;nyv&aacute;lt&oacute;&nbsp;- k&ouml;dl&aacute;mpa&nbsp;- k&ouml;nnyűf&eacute;m felni&nbsp;- k&ouml;z&eacute;pső kart&aacute;masz&nbsp;- kulcsn&eacute;lk&uuml;li ind&iacute;t&aacute;s&nbsp;- m&eacute;lynyom&oacute;&nbsp;- MP3 lej&aacute;tsz&aacute;s&nbsp;- multifunkci&oacute;s korm&aacute;nyker&eacute;k&nbsp;- oldall&eacute;gzs&aacute;k&nbsp;- riaszt&oacute;&nbsp;- szervokorm&aacute;ny&nbsp;- tempomat&nbsp;- tolat&oacute;kamera&nbsp;- utasoldali l&eacute;gzs&aacute;k&nbsp;- &uuml;l&eacute;smagass&aacute;g &aacute;ll&iacute;t&aacute;s&nbsp;- vezetőoldali l&eacute;gzs&aacute;k.&nbsp;<br />\r\n<br />\r\nEgy&eacute;b inform&aacute;ci&oacute;: azonnal elvihető&nbsp;- frissen szervizelt&nbsp;- gar&aacute;zsban tartott&nbsp;- keveset futott&nbsp;- m&aacute;sodik tulajdonost&oacute;l&nbsp;- nem doh&aacute;nyz&oacute;&nbsp;- rendszeresen karbantartott</p>\r\n', 'bentley.jpg', '2021-06-02 14:52:10'),
(16, 5, 1, 'Ford Mustang Convertible 5.0 Ti-Vct V8 GT', 'Ford-Mustang-Convertible-50-Ti-Vct-V8-GT', '<p>Elad&oacute; egy szinte &uacute;j Ford Mustang Convertible! 1. tulajdonost&oacute;l, &uacute;jkora &oacute;ta magyarorsz&aacute;gi! Elektromos, fűthető-szellőztethető bőr sport &uuml;l&eacute;sek, 2 z&oacute;n&aacute;s digit kl&iacute;ma, tolat&oacute; radar-kamera, kulcsn&eacute;lk&uuml;li ind&iacute;t&aacute;s, multifunkci&oacute;s bőr sportkorm&aacute;ny v&aacute;lt&oacute;f&uuml;lekkel, telefon kihangos&iacute;t&aacute;s, tempomat, vezető profil v&aacute;laszt&aacute;s k&ouml;nnyűf&eacute;m felnik, navig&aacute;ci&oacute;, vezet&eacute;st t&aacute;mogat&oacute; rendszerek.&nbsp;<br />\r\n<br />\r\nFelszerelts&eacute;g: ABS (blokkol&aacute;sg&aacute;tl&oacute;)&nbsp;- bőr belső&nbsp;- ESP (menetstabiliz&aacute;tor)&nbsp;- tempomat&nbsp;- ADS (adapt&iacute;v leng&eacute;scsillap&iacute;t&oacute;)&nbsp;- &aacute;ll&iacute;that&oacute; combt&aacute;masz&nbsp;- &aacute;ll&iacute;that&oacute; korm&aacute;ny&nbsp;- ASR (kip&ouml;rg&eacute;sg&aacute;tl&oacute;)&nbsp;- Automata (6 fokozat&uacute; tiptronic) sebess&eacute;gv&aacute;lt&oacute;&nbsp;- automatikusan s&ouml;t&eacute;tedő belső t&uuml;k&ouml;r&nbsp;- automatikusan s&ouml;t&eacute;tedő k&uuml;lső t&uuml;k&ouml;r&nbsp;- AUX csatlakoz&oacute;&nbsp;- bluetooth-os kihangos&iacute;t&oacute;&nbsp;- CD-s aut&oacute;r&aacute;di&oacute;&nbsp;- centr&aacute;lz&aacute;r&nbsp;- der&eacute;kt&aacute;masz&nbsp;- Digit&aacute;lis k&eacute;tz&oacute;n&aacute;s kl&iacute;ma&nbsp;- DVD&nbsp;- EDS (elektronikus differenci&aacute;lz&aacute;r)&nbsp;- elektromos ablak el&ouml;l&nbsp;- elektromos ablak h&aacute;tul&nbsp;- elektromos t&uuml;k&ouml;r&nbsp;- elektromos &uuml;l&eacute;s&aacute;ll&iacute;t&aacute;s utasoldal&nbsp;- elektromos &uuml;l&eacute;s&aacute;ll&iacute;t&aacute;s vezetőoldal&nbsp;- elektromosan behajthat&oacute; k&uuml;lső t&uuml;kr&ouml;k&nbsp;- esőszenzor&nbsp;- fed&eacute;lzeti komputer&nbsp;- f&eacute;nysz&oacute;r&oacute; magass&aacute;g&aacute;ll&iacute;t&aacute;s&nbsp;- fűthető sz&eacute;lv&eacute;dő&nbsp;- fűthető t&uuml;k&ouml;r&nbsp;- fűthető &uuml;l&eacute;s&nbsp;- GPS (navig&aacute;ci&oacute;)&nbsp;- guminyom&aacute;s-ellenőrző rendszer&nbsp;- hűthető kesztyűtart&oacute;&nbsp;- ind&iacute;t&aacute;sg&aacute;tl&oacute; (immobiliser)&nbsp;- iphone/ipod csatlakoz&oacute;&nbsp;- kikapcsolhat&oacute; l&eacute;gzs&aacute;k&nbsp;- korm&aacute;nyv&aacute;lt&oacute;&nbsp;- k&ouml;dl&aacute;mpa&nbsp;- k&ouml;nnyűf&eacute;m felni&nbsp;- k&ouml;z&eacute;pső kart&aacute;masz&nbsp;- kulcsn&eacute;lk&uuml;li ind&iacute;t&aacute;s&nbsp;- MP3 lej&aacute;tsz&aacute;s&nbsp;- MP4 lej&aacute;tsz&aacute;s&nbsp;- multifunkci&oacute;s korm&aacute;nyker&eacute;k&nbsp;- oldall&eacute;gzs&aacute;k&nbsp;- sebess&eacute;gf&uuml;ggő szerv&oacute;korm&aacute;ny&nbsp;- sportfut&oacute;mű&nbsp;- sport&uuml;l&eacute;sek&nbsp;- t&eacute;rdl&eacute;gzs&aacute;k&nbsp;- tolat&oacute;kamera&nbsp;- tolat&oacute;radar&nbsp;- USB csatlakoz&oacute;&nbsp;- utasoldali l&eacute;gzs&aacute;k&nbsp;- &uuml;l&eacute;shűt&eacute;s/szellőztet&eacute;s&nbsp;- &uuml;l&eacute;smagass&aacute;g &aacute;ll&iacute;t&aacute;s&nbsp;- vezetőoldali l&eacute;gzs&aacute;k&nbsp;- WMA lej&aacute;tsz&aacute;s.&nbsp;</p>\r\n', 'mustang.jpg', '2021-06-02 14:56:40'),
(17, 7, 1, 'Lincoln limuzin', 'Lincoln-limuzin', '<p>Lincoln Town Car 10 szem&eacute;lyes limuzin aut&oacute;buszos vizsg&aacute;val elad&oacute;.&nbsp;<br />\r\nMagyar rendsz&aacute;m, &eacute;rv&eacute;nyes műszaki.&nbsp;&nbsp;<br />\r\n10 szem&eacute;lyes, k&iacute;v&uuml;l-bel&uuml;l sz&eacute;p &aacute;llapotban elad&oacute;.&nbsp;<br />\r\nAz auto minden enged&eacute;llyel rendelkezik, nincs sz&eacute;t rohadva, nincs purhabozva.&nbsp;&nbsp;<br />\r\nBővebb Info telefonon.</p>\r\n', 'Lincoln_Limuzin__623641662276361.jpg', '2021-06-02 14:58:58'),
(18, 8, 1, 'Hummer H2 6.2 V8 Luxury', 'Hummer-H2-62-V8-Luxury', '<p>Sz&eacute;p megkim&eacute;lt &aacute;llapotban!&nbsp;<br />\r\n<br />\r\nFelszerelts&eacute;g: ABS (blokkol&aacute;sg&aacute;tl&oacute;)&nbsp;- ASR (kip&ouml;rg&eacute;sg&aacute;tl&oacute;)&nbsp;- Automata (5 fokozat&uacute;) sebess&eacute;gv&aacute;lt&oacute;&nbsp;- Automata kl&iacute;ma&nbsp;- bőr belső&nbsp;- centr&aacute;lz&aacute;r&nbsp;- elektromos ablak el&ouml;l&nbsp;- elektromos ablak h&aacute;tul&nbsp;- elektromos tol&oacute;tető&nbsp;- elektromos t&uuml;k&ouml;r&nbsp;- elektromos &uuml;l&eacute;s&aacute;ll&iacute;t&aacute;s utasoldal&nbsp;- elektromos &uuml;l&eacute;s&aacute;ll&iacute;t&aacute;s vezetőoldal&nbsp;- ESP (menetstabiliz&aacute;tor)&nbsp;- fed&eacute;lzeti komputer&nbsp;- f&uuml;gg&ouml;nyl&eacute;gzs&aacute;k&nbsp;- fűthető sz&eacute;lv&eacute;dő&nbsp;- fűthető t&uuml;k&ouml;r&nbsp;- fűthető &uuml;l&eacute;s&nbsp;- h&aacute;ts&oacute; oldal l&eacute;gzs&aacute;k&nbsp;- kieg&eacute;sz&iacute;tő f&eacute;nysz&oacute;r&oacute;&nbsp;- k&ouml;dl&aacute;mpa&nbsp;- k&ouml;nnyűf&eacute;m felni&nbsp;- k&ouml;z&eacute;pső kart&aacute;masz&nbsp;- multifunkci&oacute;s korm&aacute;nyker&eacute;k&nbsp;- oldall&eacute;gzs&aacute;k&nbsp;- riaszt&oacute;&nbsp;- szervokorm&aacute;ny&nbsp;- sz&iacute;nezett &uuml;veg&nbsp;- t&aacute;vols&aacute;gi f&eacute;nysz&oacute;r&oacute; asszisztens&nbsp;- tempomat&nbsp;- tolat&oacute;kamera&nbsp;- tol&oacute;tető (napf&eacute;nytető)&nbsp;- utasoldali l&eacute;gzs&aacute;k&nbsp;- &uuml;l&eacute;smagass&aacute;g &aacute;ll&iacute;t&aacute;s&nbsp;- vezetőoldali l&eacute;gzs&aacute;k&nbsp;- von&oacute;horog.&nbsp;<br />\r\n&nbsp;</p>\r\n', 'Hummer_H2_6_2_V8_Luxury_301901684345386.jpg', '2021-06-02 15:02:05'),
(19, 1, 1, 'Lykan Hypersport', 'Lykan-Hypersport', '<p>&nbsp;szerint eddig a Bugatty Veyron Super Sports volt a legdr&aacute;g&aacute;bb sz&eacute;riagy&aacute;rt&aacute;s&uacute; szem&eacute;lyaut&oacute; a maga 1,7 milli&oacute; eur&oacute;s alap&aacute;r&aacute;val. A Lykan m&eacute;g olyan csod&aacute;kat sz&eacute;gyen&iacute;t meg (legal&aacute;bbis az &aacute;r&aacute;val), mint az Aston Martin One-77, a Pagani Zonda Cinque Roadster, a Lamborghini Reventon vagy a Koenigsegg Agera R - illusztris t&aacute;rsas&aacute;g. Hogy olyan j&oacute; is lesz-e, mint a soroltak vagy a n&aacute;luk is bőven olcs&oacute;bb tucat-Ferrarik meg Porsch&eacute;k, m&aacute;r m&aacute;s t&eacute;szta.</p>\r\n', 'hypersport.jpg', '2021-06-02 15:04:53'),
(20, 1, 2, 'test1 first test', 'test1-first-test', '<p>check to see the validation</p>\r\n', 'noimage.jpg', '2021-06-02 12:47:05');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `zipcode`, `email`, `username`, `password`, `register_date`, `admin`) VALUES
(1, '3413', 'Sirák Norbert', 'siraknorbert99@gmail.com', 'snorbert99', 'a8f5f167f44f4964e6c998dee827110c', '2021-06-03 05:54:52', 1),
(2, '3413', 'test1', 'test1@gmail.com', 'test1', 'a8f5f167f44f4964e6c998dee827110c', '2021-06-03 11:51:42', 0),
(3, '3413', 'Test2', 'test2@gmai.com', 'test2', 'a8f5f167f44f4964e6c998dee827110c', '2021-06-03 08:46:26', 0);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
