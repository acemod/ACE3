#include "script_component.hpp"

//#include "initKeybinds.sqf"

if (count (profileNamespace getVariable ["ACE_ATragMX_gunList", []]) > 0) then {
    GVAR(gunList) = profileNamespace getVariable "ACE_ATragMX_gunList";
} else {
    // Profile Name, Muzzle Velocity, Zero Range, Scope Base Angle, AirFriction, Bore Height, Scope Unit, Elevation Scope Step, Windage Scope Step, Maximum Elevation, Dialed Elevation, Dialed Windage, Mass, Ammo Class Name, Magazine Class Name, BC, Drag Model, Atmosphere Model
    GVAR(gunList) =  [["12.7x108mm"       , 820, 500, 0.255, -0.0005600, 3.81, 0, 0.338, 0.338, 120, 0, 0, 48.28, "B_127x108_Ball"  , "5Rnd_127x108_Mag"        , 0.700, 1, "ASM" ],
                              ["12.7x99mm"        , 880, 500, 0.202, -0.0005600, 3.81, 0, 0.338, 0.338, 120, 0, 0, 41.92, "B_127x99_Ball"   , "5Rnd_mas_127x99_Stanag"  , 0.670, 1, "ASM" ],
                              ["10.4x77mm"        , 910, 500, 0.200, -0.0004800, 3.81, 0, 0.338, 0.338, 120, 0, 0, 27.15, "B_408_Ball"      , "7Rnd_408_Mag"            , 0.970, 1, "ASM" ],
                              ["7.62x51mm"        , 850, 500, 0.280, -0.0010000, 3.81, 0, 0.338, 0.338, 120, 0, 0, 9.460, "B_762x51_Ball"   , "20Rnd_762x51_Mag"        , 0.393, 1, "ICAO"],
                              ["6.5x39mm"         , 800, 500, 0.304, -0.0009000, 3.81, 0, 0.338, 0.338, 120, 0, 0, 7.776, "B_65x39_Caseless", "30Rnd_65x39_caseless_mag", 0.263, 1, "ICAO"],
                              ["5.56x45mm"        , 920, 500, 0.259, -0.0012000, 3.81, 0, 0.338, 0.338, 120, 0, 0, 4.000, "B_556x45_Ball"   , "30Rnd_556x45_Stanag"     , 0.304, 1, "ASM" ],
                              ["5.56x45mm Mk262"  , 850, 500, 0.294, -0.0011250, 3.81, 0, 0.338, 0.338, 120, 0, 0, 4.990, "RH_556x45_Mk262" , "RH_30Rnd_556x45_Mk262"   , 0.361, 1, "ASM" ]];
    
    profileNamespace setVariable ["ACE_ATragMX_gunList", GVAR(gunList)];
};

[] call FUNC(init);
//[] call FUNC(sord); // Connection to Vector
