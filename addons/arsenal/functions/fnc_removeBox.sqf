#include "script_component.hpp"
#include "..\defines.hpp"

params ["_object", "_global"];

if (isNull _object || {isNil QGVAR(EHIDArray)}) exitWith {};

if (_global && {isMultiplayer}) then {
    private _ID = (GVAR(EHIDArray) select {_x select 1 == _object}) select 0;

    if !(isNil "_ID") then {
        [_ID select 0] call CBA_fnc_removeGlobalEventJIP;
        GVAR(EHIDArray) deleteAt (GVAR(EHIDArray) find _ID);
        publicVariable QGVAR(EHIDArray);
        [QGVAR(removeBox), [_object, false]] call CBA_fnc_globalEvent;
    };
} else {
     _object setVariable [QGVAR(virtualItems), nil, false];
    [_object, 0, ["ACE_MainActions", QGVAR(interaction)]] call EFUNC(interact_menu,removeActionFromObject);
};