/*
 * Author: VKing, bux
 * Gets the current latitude and altitude offset for the map.
 *
 * Arguments:
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

if (_map in ["abbottabad"]) exitWith { [34, 1256] }; // Abbottabad elevation 1256m (Wikipedia)
if (_map in ["abel"]) exitWith { [39, 0] }; // CWR2 Malden
if (_map in ["abramia"]) exitWith { [60, 0] };
if (_map in ["af_kandahar_province"]) exitWith { [42, 0] };
if (_map in ["angel"]) exitWith { [38, 0] };
if (_map in ["anim_helvantis_v2"]) exitWith { [50, 0] };
if (_map in ["australia"]) exitWith { [-25, 0] };
if (_map in ["baranow", "ivachev", "panavo", "staszow"]) exitWith { [50, 148.1] }; // IFA3LITE - default elevationOffset
if (_map in ["beketov"]) exitWith { [55, 0] };
if (_map in ["blud_cordelia"]) exitWith { [12, 5] }; // Trung Si
if (_map in ["bootcamp_acr"]) exitWith { [50, 0] };
if (_map in ["bornholm"]) exitWith { [55, 0] };
if (_map in ["bozcaada"]) exitWith { [40, 0] };
if (_map in ["cain"]) exitWith { [40, 0] }; // CWR2 Kolgujev
if (_map in ["caribou"]) exitWith { [68, 0] };
if (_map in ["cartercity"]) exitWith { [43, 130] }; // Pecher, based on Grozny (1995 - 1996) elevation 130m (Wikipedia)
if (_map in ["catalina"]) exitWith { [33, 0] };
if (_map in ["chernarus", "chernarus_summer", "chernarus_winter"]) exitWith { [50, 0] };
if (_map in ["chernobylzone", "chernobylzonea2"]) exitWith { [51, 0] };
if (_map in ["clafghan"]) exitWith { [34, 640] };
if (_map in ["colleville"]) exitWith { [49, 0] }; // IFA3LITE, Omaha Beach 1944
if (_map in ["csj_lawlands", "uns_dong_ha"]) exitWith { [12, 0] }; // Unsung Mod
if (_map in ["csj_sea"]) exitWith { [15, 0] }; // Unsung Mod
if (_map in ["dakrong"]) exitWith { [16, 0] }; // Unsung Mod
if (_map in ["desert_e"]) exitWith { [40, 800] };
if (_map in ["desert_island"]) exitWith { [40, 0] }; // CWR2 Desert Island
if (_map in ["dya"]) exitWith { [34, 110] }; // Diyala Iraq - default elevationOffset
if (_map in ["eden"]) exitWith { [45, 0] }; // CWR2 Everon
if (_map in ["esseker"]) exitWith { [43, 2000] };
if (_map in ["evergreen"]) exitWith { [41, 0] }; // Burgazada, Turkey - default elevationOffset
if (_map in ["fallujah"]) exitWith { [33, 0] };
if (_map in ["fata"]) exitWith { [33, 1347] };
if (_map in ["gorgona"]) exitWith { [43, 0] };
if (_map in ["hellskitchen", "hellskitchens"]) exitWith { [32, 900] }; // Sangin summer, Sangin winter - Sangin elevation 888m (Wikipedia)
if (_map in ["hindukush"]) exitWith { [36, 0] };
if (_map in ["i44_omaha_v2"]) exitWith { [49, 0] };
if (_map in ["imrali", "imralispring"]) exitWith { [40, 0] };
if (_map in ["intro"]) exitWith { [40, 0] };
if (_map in ["isladuala3"]) exitWith { [-19, 0] };
if (_map in ["jacobi"]) exitWith { [34, 2000] }; // default elevationOffset
if (_map in ["kapaulio"]) exitWith { [0, 0] };
if (_map in ["kerama"]) exitWith { [26, 0] }; // Kerama Islands, Japan - default elevationOffset
if (_map in ["khe_sanh"]) exitWith { [17, 0] }; // Unsung Mod
if (_map in ["kholm"]) exitWith { [36, 0] };
if (_map in ["kidal"]) exitWith { [18, 0] }; // Kidal, Mali - default elevationOffset
if (_map in ["koplic"]) exitWith { [42, 0] };
if (_map in ["kunduz"]) exitWith { [37, 0] };
if (_map in ["lingor", "lingor3", "dingor"]) exitWith { [-4, 0] };
if (_map in ["lost", "lostw"]) exitWith { [60, 0] };
if (_map in ["lythium"]) exitWith { [34, 0] };
if (_map in ["malvinas"]) exitWith { [-52, 0] };
if (_map in ["marenice"]) exitWith { [51, 0] }; // CSA38 Mod (Czechoslovak army 1938 - Munich crisis), Lisatian Mountains.
if (_map in ["mcn_aliabad"]) exitWith { [36, 0] };
if (_map in ["mcn_neaville", "mcn_neaville_winter"]) exitWith { [45, 0] }; // I44: Neaville, I44: Neaville (Winter)
if (_map in ["mef_alaska"]) exitWith { [60, 5] };
if (_map in ["mog"]) exitWith { [2, 0] }; // Mogadishu, Somalia
if (_map in ["mountains_acr"]) exitWith { [35, 2000] };
if (_map in ["mske"]) exitWith { [35, 0] }; // MSKE 2017
if (_map in ["nam2"]) exitWith { [14, 0] };
if (_map in ["namalsk"]) exitWith { [65, 0] };
if (_map in ["napf", "napfwinter"]) exitWith { [47, 0] };
if (_map in ["newyork_lumnuon"]) exitWith { [41, 5] }; // Governer´s Island, New York - default elevationOffset
if (_map in ["noe"]) exitWith { [45, 0] }; // CWR2 Nogova
if (_map in ["panthera3", "winthera3"]) exitWith { [46, 0] };
if (_map in ["phu_bai", "rockwall", "us101_cao_bang"]) exitWith { [14, 0] }; // Unsung Mod
if (_map in ["pianosa_aut"]) exitWith { [43, 0] }; // Pianosa, Italy - default elevationOffset
if (_map in ["pja305"]) exitWith { [0, 0] }; // G.O.S N'Ziwasogo
if (_map in ["pja306"]) exitWith { [35, 0] }; // G.O.S Kalu Khan
if (_map in ["pja307"]) exitWith { [17, 0] }; // F.S.F Daryah
if (_map in ["pja308"]) exitWith { [36, 0] }; // G.O.S Gunkizli
if (_map in ["pja310"]) exitWith { [36, 0] }; // G.O.S Al Rayak
if (_map in ["pja312"]) exitWith { [16, 0] }; // G.O.S Song Bin Tanh
if (_map in ["pja314"]) exitWith { [46, 0] }; // G.O.S Leskovets
if (_map in ["plr_bulge"]) exitWith { [49, 0] }; // I44: Battle of the Bulge
if (_map in ["porquerolles"]) exitWith { [43, 0] };
if (_map in ["porto"]) exitWith { [40, 0] };
if (_map in ["provinggrounds_pmc"]) exitWith { [35, 100] };
if (_map in ["reshmaan"]) exitWith { [35, 2000] };
if (_map in ["rungsat"]) exitWith { [10, 0] }; // Unsung Mod
if (_map in ["sara", "sara_dbe1"]) exitWith { [40, 0] };
if (_map in ["saralite"]) exitWith { [40, 0] };
if (_map in ["sb3"]) exitWith { [53, 25] }; // TrpUebPl Einfelde Nord (Munster North Training Area, Germany) - default elevationOffset
if (_map in ["sfp_sturko"]) exitWith { [56, 0] };
if (_map in ["sfp_wamako"]) exitWith { [14, 0] };
if (_map in ["shapur_baf"]) exitWith { [35, 100] };
if (_map in ["sugarlake"]) exitWith { [29, 0] };
if (_map in ["takistan"]) exitWith { [35, 2000] };
if (_map in ["thirsk"]) exitWith { [65, 0] };
if (_map in ["tilos"]) exitWith { [36, 0] };
if (_map in ["uhao"]) exitWith { [21, 0] };
if (_map in ["uns_idv", "uns_ptv"]) exitWith { [13, 0] }; // Unsung Mod
if (_map in ["utes"]) exitWith { [50, 0] };
if (_map in ["vt5"]) exitWith { [61, 100] }; // Valtatie 5, Finland - default elevationOffset
if (_map in ["wake"]) exitWith { [19, 0] };
if (_map in ["waziristan"]) exitWith { [33, 0] };
if (_map in ["wintermap"]) exitWith { [61, 0] }; // Nordkvingo - default elevationOffset
if (_map in ["wintertown", "wintertowna3"]) exitWith { [39, 600] }; // U.S. state Kansas mean elevation 610m (Wikipedia)
if (_map in ["woodland_acr"]) exitWith { [50, 0] };
if (_map in ["xcam_prototype"]) exitWith { [35, 0] };
if (_map in ["xcam_taunus"]) exitWith { [50, 0] };
if (_map in ["zargabad"]) exitWith { [35, 2000] };

[] //Return empty array if we have no specific data for the map
