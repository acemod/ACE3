#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

GVAR(shown) = false;
GVAR(data) = createHashMap;
GVAR(data) set ["latitude", EGVAR(common,mapLatitude)];


// Add Keybinds
["ACE3 Equipment", QGVAR(range), [format ["XM157 - %1", localize "str_a3_rscdisplayarsenal_stat_range"]], {
    ["range", true] call FUNC(keyPress);
}, {
    ["range", false] call FUNC(keyPress);
}, [DIK_TAB, [false, false, false]], false, 0] call CBA_fnc_addKeybind;

["ACE3 Equipment", QGVAR(left), [format ["XM157 - %1", localize "str_a3_left"]], {
    ["right", true] call FUNC(keyPress);
}, {
    ["right", false] call FUNC(keyPress);
}, [DIK_END, [false, false, false]], false, 0] call CBA_fnc_addKeybind;

["ACE3 Equipment", QGVAR(right), [format ["XM157 - %1", localize "str_a3_right"]], {
    ["left", true] call FUNC(keyPress);
}, {
    ["left", false] call FUNC(keyPress);
}, [DIK_DELETE, [false, false, false]], false, 0] call CBA_fnc_addKeybind;

["ACE3 Equipment", QGVAR(up), [format ["XM157 - %1", localize "str_a3_rscattributetargetstate_up"]], {
    ["up", true] call FUNC(keyPress);
}, {
    ["up", false] call FUNC(keyPress);
}, [DIK_PGUP, [false, false, false]], false, 0] call CBA_fnc_addKeybind;

["ACE3 Equipment", QGVAR(down), [format ["XM157 - %1", localize "str_a3_rscattributetargetstate_down"]], {
    ["down", true] call FUNC(keyPress);
}, {
    ["down", false] call FUNC(keyPress);
}, [DIK_PGDN, [false, false, false]], false, 0] call CBA_fnc_addKeybind;



#ifdef ENABLE_QUICK_TESTING
#ifdef CREATE_MOCK_PLATFORMS
[player, "ace_xm157_mock_gl", 5] call bis_fnc_addWeapon;
#endif
player addPrimaryWeaponItem "ace_xm157_prototype";
[player] call CBA_fnc_addUnitTrackProjectiles;
player addItem "ACE_ATragMX";
player addItem "ace_rangecard";

["recompile", "recompile", "recompile", {
    private _start = diag_tickTime;
    [] call ACE_PREP_RECOMPILE;
    [] call ace_common_fnc_dumpPerformanceCounters;
    private _end = diag_tickTime;
    systemChat format ["recompile took [%1 ms]", (1000 * (_end - _start)) toFixed 1];

    if (productVersion #4 == "Diag") then {
        call compile "diag_mergeConfigFile ['P:\z\ace\addons\xm157\config.cpp']";
    };

    private _windSpd = vectorMagnitude wind;
    private _windDir = (wind select 0) atan2 (wind select 1);
    systemChat format ["Wind %1 @ %2", _windSpd, _windDir + 180];

    false
}, {false}, [0x21, [false, false, false]], false] call CBA_fnc_addKeybind; // F Key
#endif
