#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

if (!hasInterface) exitWith {};

GVAR(pfID) = -1;
["turret", LINKFUNC(turretChangedEH), true] call CBA_fnc_addPlayerEventHandler;

GVAR(masterOverridePressed) = false;
["ACE3 Vehicles", QGVAR(masterOverride), [LLSTRING(commanderOverride), LLSTRING(commanderOverride_description)],
{
    GVAR(masterOverridePressed) = true;
}, {
    GVAR(masterOverridePressed) = false;
},
[DIK_Q, [false, false, false]], false, 0] call CBA_fnc_addKeybind;


// DEV:
["ACE3 Vehicles", QGVAR(test), "test",
{
    private _vec = vectorNormalized [-1 + random 2,-1 + random 2,random 0.1];
    systemChat format ["Random look at %1", _vec];
    (vehicle player) setVariable [QGVAR(puppetLookAt), _vec, true];
}, {
},
[DIK_E, [false, false, false]], false, 0] call CBA_fnc_addKeybind; 
["recompile", "recompile", "recompile", {
    private _start = diag_tickTime;
    [] call ACE_PREP_RECOMPILE;
    [] call ace_common_fnc_dumpPerformanceCounters;
    private _end = diag_tickTime;
    systemChat format ["[recompile took %1 ms]", (1000 * (_end - _start)) toFixed 1];
    false
}, {false}, [0x21, [false, false, false]], false] call CBA_fnc_addKeybind; // F Key
