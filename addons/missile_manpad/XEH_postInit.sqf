#include "script_component.hpp"

if (!hasInterface) exitWith {};

// todo
GVAR(isLockKeyDown) = true;
GVAR(isUncageKeyDown) = true;
GVAR(running) = [];

["weapon", LINKFUNC(weaponChanged)] call CBA_fnc_addPlayerEventHandler;
["unit", LINKFUNC(weaponChanged), true] call CBA_fnc_addPlayerEventHandler;

[QGVAR(soundEffect), {
    params ["_unit", "_sound"];
    TRACE_2("soundEffect",_unit,_sound);
    private _old = _unit getVariable [QGVAR(soundEffect), objNull];
    if (!isNull _old) then {
        deleteVehicle _old;
    };
    if (_sound != "") then {
        private _new = _unit say3D _sound;
        _unit setVariable [QGVAR(soundEffect), _new];
    };
}] call CBA_fnc_addEventHandler;


#ifdef ENABLE_QUICK_TESTING
["recompile", "recompile", "recompile", {
    private _start = diag_tickTime;
    [] call ACE_PREP_RECOMPILE;
    [] call ace_common_fnc_dumpPerformanceCounters;
    private _end = diag_tickTime;
    systemChat format ["recompile took [%1 ms]", (1000 * (_end - _start)) toFixed 1];
    if (productVersion #4 == "Diag") then {
        call compile "diag_mergeConfigFile ['P:\z\ace\addons\missile_manpad\config.cpp']";
    };
    false
}, {false}, [59, [false, false, false]], false] call CBA_fnc_addKeybind; // F1 Key
#endif
