#include "script_component.hpp"

#include "initKeybinds.sqf"

if (count (profileNamespace getVariable ["ACE_ATragMX_gunList", []]) > 0) then {
    GVAR(gunList) = profileNamespace getVariable "ACE_ATragMX_gunList";
} else {
    // Profile Name, Muzzle Velocity, Zero Range, Scope Base Angle, AirFriction, Bore Height, Scope Unit, Elevation Scope Step, Windage Scope Step, Maximum Elevation, Dialed Elevation, Dialed Windage, Mass, Ammo Class Name, Magazine Class Name, BC, Drag Model, Atmosphere Model
    GVAR(gunList) =  [["12.7x108mm"        , 820, 100, 0.0659, -0.0008600, 3.81, 0, 0.338, 0.338, 120, 0, 0, 48.28, "B_127x108_Ball"                   , "5Rnd_127x108_Mag"                      , 0.630, 1, "ASM" ],
    
                      ["12.7x99mm AMAX"    , 860, 100, 0.0612, -0.0008600, 3.81, 0, 0.338, 0.338, 120, 0, 0, 48.60, "B_127x99_Ball"                    , "5Rnd_mas_127x99_Stanag"                , 1.050, 1, "ASM" ],
                      ["12.7x99mm"         , 853, 100, 0.0623, -0.0008600, 3.81, 0, 0.338, 0.338, 120, 0, 0, 41.92, "B_127x99_Ball"                    , "5Rnd_mas_127x99_Stanag"                , 0.670, 1, "ASM" ],
                      
                      ["12.7x54mm"         , 300, 100, 0.3394, -0.0014000, 3.81, 0, 0.338, 0.338, 120, 0, 0, 48.60, "B_127x54_Ball"                    , "10Rnd_127x54_Mag"                      , 1.050, 1, "ASM" ],
                      
                      [".408 Chey Tac"     , 910, 100, 0.0569, -0.0004800, 3.81, 0, 0.338, 0.338, 120, 0, 0, 27.15, "B_408_Ball"                       , "7Rnd_408_Mag"                          , 0.970, 1, "ASM" ],
                      
                      ["9.3×64mm"          , 870, 100, 0.0619, -0.0007500, 3.81, 0, 0.338, 0.338, 120, 0, 0, 14.90, "B_93x64_Ball"                     , "10Rnd_93x64_DMR_05_Mag"                , 0.368, 1, "ASM" ],
                      
                      [".338LM 250gr"      , 880, 100, 0.0598, -0.0006060, 3.81, 0, 0.338, 0.338, 120, 0, 0, 16.20, "B_338_Ball"                       , "10Rnd_338_Mag"                         , 0.322, 7, "ICAO"],
                      [".338LM 300gr"      , 800, 100, 0.0677, -0.0005350, 3.81, 0, 0.338, 0.338, 120, 0, 0, 19.44, "ACE_338_Ball"                     , "ACE_10Rnd_338_300gr_HPBT_Mag"          , 0.381, 7, "ICAO"],
                      [".338LM API526"     , 880, 100, 0.0601, -0.0006730, 3.81, 0, 0.338, 0.338, 120, 0, 0, 16.39, "ACE_338_Ball_API526"              , "ACE_10Rnd_338_API526_Mag"              , 0.290, 7, "ICAO"],
                      
                      [".300WM Mk248 Mod 0", 900, 100, 0.0584, -0.0008300, 3.81, 0, 0.338, 0.338, 120, 0, 0, 13.31, "ACE_762x67_Ball_Mk248_Mod_0"      , "ACE_20Rnd_762x67_Mk248_Mod_0_Mag"      , 0.268, 7, "ICAO"],
                      [".300WM Mk248 Mod 1", 867, 100, 0.0611, -0.0008150, 3.81, 0, 0.338, 0.338, 120, 0, 0, 14.26, "ACE_762x67_Ball_Mk248_Mod_1"      , "ACE_20Rnd_762x67_Mk248_Mod_1_Mag"      , 0.310, 7, "ICAO"],
                      [".300WM Berger OTM" , 853, 100, 0.0622, -0.0007600, 3.81, 0, 0.338, 0.338, 120, 0, 0, 14.90, "ACE_762x67_Ball_Berger_Hybrid_OTM", "ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag", 0.368, 7, "ICAO"],
                      
                      ["7.62x54mmR"        , 800, 100, 0.0692, -0.0010230, 3.81, 0, 0.338, 0.338, 120, 0, 0, 9.849, "B_762x54_Ball"                    , "10Rnd_762x54_Mag"                      , 0.400, 1, "ICAO"],
                      
                      ["7.62x51mm M80"     , 810, 100, 0.0679, -0.0010350, 3.81, 0, 0.338, 0.338, 120, 0, 0, 9.525, "B_762x51_Ball"                    , "20Rnd_762x51_Mag"                      , 0.200, 7, "ICAO"],
                      ["7.62x51mm M118LR"  , 820, 100, 0.0662, -0.0008525, 3.81, 0, 0.338, 0.338, 120, 0, 0, 11.34, "ACE_762x51_Ball_M118LR"           , "ACE_20Rnd_762x51_M118LR_Mag"           , 0.243, 7, "ICAO"],
                      ["7.62x51mm Mk319"   , 820, 100, 0.0670, -0.0010300, 3.81, 0, 0.338, 0.338, 120, 0, 0, 8.424, "ACE_762x51_Ball_Mk319_Mod_0"      , "ACE_20Rnd_762x51_Mk319_Mod_0_Mag"      , 0.377, 1, "ICAO"],
                      ["7.62x51mm Subsonic", 320, 100, 0.3060, -0.0004910, 3.81, 0, 0.338, 0.338, 120, 0, 0, 12.96, "ACE_762x51_Ball_Subsonic"         , "ACE_20Rnd_762x51_Mag_SD"               , 0.235, 7, "ICAO"],
                      
                      ["6.5x39mm"          , 800, 100, 0.0683, -0.0007850, 3.81, 0, 0.338, 0.338, 120, 0, 0, 7.970, "B_65x39_Caseless"                 , "30Rnd_65x39_caseless_mag"              , 0.263, 7, "ICAO"],
                      ["6.5x47mm Lapua"    , 800, 100, 0.0682, -0.0007710, 3.81, 0, 0.338, 0.338, 120, 0, 0, 9.007, "ACE_65x47_Ball_Scenar"            , "ACE_30Rnd_65x47_Scenar_mag"            , 0.290, 7, "ICAO"],
                      
                      ["5.56x45mm M855"    , 870, 100, 0.0626, -0.0012650, 3.81, 0, 0.338, 0.338, 120, 0, 0, 4.018, "B_556x45_Ball"                    , "30Rnd_556x45_Stanag"                   , 0.151, 7, "ASM" ],
                      ["5.56x45mm Mk262"   , 820, 100, 0.0671, -0.0011250, 3.81, 0, 0.338, 0.338, 120, 0, 0, 4.990, "ACE_556x45_Ball_Mk262"            , "ACE_30Rnd_556x45_Stanag_Mk262_mag"     , 0.361, 1, "ASM" ],
                      ["5.56x45mm Mk318"   , 880, 100, 0.0616, -0.0011200, 3.81, 0, 0.338, 0.338, 120, 0, 0, 4.018, "ACE_556x45_Ball_Mk318"            , "ACE_30Rnd_556x45_Stanag_Mk318_mag"     , 0.307, 1, "ASM" ]];
    
    profileNamespace setVariable ["ACE_ATragMX_gunList", GVAR(gunList)];
};

[] call FUNC(init);

["RangerfinderData", {_this call FUNC(sord)}] call EFUNC(common,addEventHandler);
