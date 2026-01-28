#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

if (!hasInterface) exitWith {};

GVAR(currentPointer) = "";
GVAR(pfid) = -1;
GVAR(data) = createHashMap;

["ACE3 Equipment", QGVAR(range), [format ["MILR - %1", localize "str_a3_rscdisplayarsenal_stat_range"]], {
    ["range", true] call FUNC(keyPress);
}, {
    ["range", false] call FUNC(keyPress);
}, [DIK_TAB, [false, false, false]], false, 0] call CBA_fnc_addKeybind;

private _fnc_updatePointer = {
    params ["_player"];
    private _pointer = (_player weaponAccessories (currentWeapon _player)) param [1, ""];
    if (_pointer == GVAR(currentPointer)) exitWith {}; // fast exit if no change
    GVAR(currentPointer) = _pointer;

    if (_pointer isKindOf [QGVAR(base), configFile >> "CfgWeapons"]) then {
        if (GVAR(pfid) == -1) then {
            TRACE_1("Adding PFEH",_pointer);
            GVAR(pfid) = [LINKFUNC(pfeh), 0, []] call CBA_fnc_addPerFrameHandler;
        };
    } else {
        if (GVAR(pfid) != -1) then {
            TRACE_1("Stopping PFEH",_pointer);
            [GVAR(pfid)] call CBA_fnc_removePerFrameHandler;
            GVAR(pfid) = -1;
        };
    };
};
["loadout", _fnc_updatePointer] call CBA_fnc_addplayerEventHandler;
["weapon", _fnc_updatePointer, true] call CBA_fnc_addplayerEventHandler;


#ifdef ENABLE_QUICK_TESTING
player addPrimaryWeaponItem "ace_milr_base";
[player] call CBA_fnc_addUnitTrackProjectiles;
player addItem "ace_rangecard";

["recompile", "recompile", "recompile", {
    private _start = diag_tickTime;
    [] call ACE_PREP_RECOMPILE;
    [] call ace_common_fnc_dumpPerformanceCounters;
    private _end = diag_tickTime;
    systemChat format ["recompile took [%1 ms]", (1000 * (_end - _start)) toFixed 1];
    if (productVersion #4 == "Diag") then {
        call compile "diag_mergeConfigFile ['P:\z\ace\addons\milr\config.cpp']";
    };
    false
}, {false}, [0x21, [false, false, false]], false] call CBA_fnc_addKeybind; // F Key
#endif
