/*
 * Author: VKing, bux
 * Gets the current latitude and altitude offset for the map.
 *
 * Argument:
 * 0: Map name (default: worldName) <STRING>
 *
 * Return Value:
 * 0: Latitude <NUMBER>
 * 1: Altitude <NUMBER>
 *
 * Public: No
 */

params ["_map"];
_map = toLower _map;

// [latitude, altitude]

// the more important ones
if (_map in ["tanoa"]) exitWith { [-18, 0] };
if (_map in ["altis"]) exitWith { [40, 0] };
if (_map in ["stratis"]) exitWith { [40, 0] };

if (_map in ["abbottabad"]) exitWith { [34, 1256] };    //Abbottabad elevation 1256m (Wikipedia)
if (_map in ["abramia"]) exitWith { [60, 0] };
if (_map in ["af_kandahar_province"]) exitWith { [42, 0] };
if (_map in ["angel"]) exitWith { [38, 0] };
if (_map in ["anim_helvantis_v2"]) exitWith { [50, 0] };
if (_map in ["australia"]) exitWith { _lat = -25; _altitude = 0; };
if (_map in ["bootcamp_acr"]) exitWith { [50, 0] };
if (_map in ["bornholm"]) exitWith { [55, 0] };
if (_map in ["bozcaada"]) exitWith { [40, 0] };
if (_map in ["caribou"]) exitWith { [68, 0] };
if (_map in ["catalina"]) exitWith { [33, 0] };
if (_map in ["chernarus", "chernarus_summer", "chernarus_winter"]) exitWith { [50, 0] };
if (_map in ["chernobylzone", "chernobylzonea2"]) exitWith { [51, 0] };
if (_map in ["clafghan"]) exitWith { [34, 640] };
if (_map in ["dakrong"]) exitWith { [17, 0] };    //Unsung Mod
if (_map in ["desert_e"]) exitWith { [40, 800] };
if (_map in ["dya"]) exitWith { [34, 110] };    //Diyala Iraq - default elevationOffset
if (_map in ["esseker"]) exitWith { [43, 2000] };
if (_map in ["evergreen"]) exitWith { [41, 0] };    //Burgazada, Turkey - default elevationOffset
if (_map in ["fallujah"]) exitWith { [33, 0] };
if (_map in ["fata"]) exitWith { [33, 1347] };
if (_map in ["gorgona"]) exitWith { [43, 0] };
if (_map in ["hellskitchen", "hellskitchens"]) exitWith { [32, 900] };    //Sangin summer, Sangin winter - Sangin elevation 888m (Wikipedia)
if (_map in ["hindukush"]) exitWith { [36, 0] };
if (_map in ["imrali", "imralispring"]) exitWith { [40, 0] };
if (_map in ["intro"]) exitWith { [40, 0] };
if (_map in ["isladuala3"]) exitWith { _lat = -19; _altitude = 0; };
if (_map in ["jacobi"]) exitWith { [34, 2000] };    //default elevationOffset
if (_map in ["kapaulio"]) exitWith { [0, 0] };
if (_map in ["kerama"]) exitWith { [26, 0] };    //Kerama Islands, Japan - default elevationOffset
if (_map in ["kholm"]) exitWith { [36, 0] };
if (_map in ["koplic"]) exitWith { [42, 0] };
if (_map in ["kunduz"]) exitWith { [37, 0] };
if (_map in ["lingor", "lingor3"]) exitWith { _lat = -4; _altitude = 0; };
if (_map in ["lost", "lostw"]) exitWith { [60, 0] };
if (_map in ["mcn_aliabad"]) exitWith { [36, 0] };
if (_map in ["malvinas"]) exitWith { _lat = -52; _altitude = 0; };
if (_map in ["namalsk"]) exitWith { [65, 0] };
if (_map in ["mef_alaska"]) exitWith { [60, 5] };
if (_map in ["mountains_acr"]) exitWith { [35, 2000] };
if (_map in ["napf", "napfwinter"]) exitWith { [47, 0] };
if (_map in ["panthera3"]) exitWith { [46, 0] };
if (_map in ["pianosa_aut"]) exitWith { [43, 0] };    //Pianosa, Italy - default elevationOffset
if (_map in ["pja305"]) exitWith { [0, 0] };    //G.O.S N'Ziwasogo
if (_map in ["pja306"]) exitWith { [35, 0] };    //G.O.S Kalu Khan
if (_map in ["pja307"]) exitWith { [17, 0] };    //F.S.F Daryah
if (_map in ["pja308"]) exitWith { [36, 0] };    //G.O.S Gunkizli
if (_map in ["pja310"]) exitWith { [36, 0] };    //G.O.S Al Rayak
if (_map in ["pja312"]) exitWith { [16, 0] };    //G.O.S Song Bin Tanh
if (_map in ["porquerolles"]) exitWith { [43, 0] };
if (_map in ["porto"]) exitWith { [40, 0] };
if (_map in ["provinggrounds_pmc"]) exitWith { [35, 100] };
if (_map in ["reshmaan"]) exitWith { [35, 2000] };
if (_map in ["sara", "sara_dbe1"]) exitWith { [40, 0] };
if (_map in ["saralite"]) exitWith { [40, 0] };
if (_map in ["sb3"]) exitWith { [53, 25] };    //TrpUebPl Einfelde Nord (Munster North Training Area, Germany) - default elevationOffset
if (_map in ["shapur_baf"]) exitWith { [35, 100] };
if (_map in ["sfp_sturko"]) exitWith { [56, 0] };
if (_map in ["sfp_wamako"]) exitWith { [14, 0] };
if (_map in ["sugarlake"]) exitWith { [29, 0] };
if (_map in ["takistan"]) exitWith { [35, 2000] };
if (_map in ["thirsk"]) exitWith { [65, 0] };
if (_map in ["tilos"]) exitWith { [36, 0] };
if (_map in ["utes"]) exitWith { [50, 0] };
if (_map in ["vt5"]) exitWith { [61, 100] };    //Vt5, Suomi Finland - default elevationOffset
if (_map in ["wake"]) exitWith { [19, 0] };
if (_map in ["waziristan"]) exitWith { [33, 0] };
if (_map in ["wintermap"]) exitWith { [61, 0] };    //Nordkvingo - default elevationOffset
if (_map in ["wintertown", "wintertowna3"]) exitWith { [39, 600] };    //U.S. state Kansas mean elevation 610m (Wikipedia)
if (_map in ["woodland_acr"]) exitWith { [50, 0] };
if (_map in ["xcam_prototype"]) exitWith { [35, 0] };
if (_map in ["zargabad"]) exitWith { [35, 2000] };

[] //Return empty array if we have no specific data for the map
