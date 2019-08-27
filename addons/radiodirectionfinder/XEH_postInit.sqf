#include "script_component.hpp"

// debug
["Q", "Q", "Q", {
    systemChat "Q RECOMPILE";
    [] call ACE_PREP_RECOMPILE;
    [-1] call FUNC(toggleDisplayMode);
    false
}, {false}, [0x10, [false, false, false]], false] call CBA_fnc_addKeybind; // Q Key


if (isServer) then {
    ["ACE_transmitter_base", "init", FUNC(beaconInit), true, [], true] call CBA_fnc_addClassEventHandler;
    [QGVAR(getUavFreq), {
        params ["_uav"];
        if (!isNil {_uav getVariable QGVAR(freqMhz)}) exitWith {TRACE_1("getUavFreq - already set",_uav);};
        private _randomFreq = 1675 + floor random 250;
        TRACE_2("getUavFreq eh",_uav,_randomFreq);
        _uav setVariable [QGVAR(freqMhz), _randomFreq, true];
    }] call CBA_fnc_addEventHandler;
};
if (!hasInterface) exitWith {};

GVAR(currentShowMode) = 0;

// Add deviceKey entry:
private _conditonCode = {
    [ACE_player] call FUNC(displayCondition)
};
private _toggleCode = {
    if !([ACE_player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {};
    [] call FUNC(toggleDisplayMode); //toggle display mode
};
private _closeCode = {
    if (GVAR(currentShowMode) == DISPLAY_MODE_CLOSED) exitWith {};
    [DISPLAY_MODE_CLOSED] call FUNC(toggleDisplayMode);
};
// [(localize LSTRING(itemName)), QPATHTOF(images\x_item.paa), _conditonCode, _toggleCode, _closeCode] call EFUNC(common,deviceKeyRegisterNew);
["RDF", "", _conditonCode, _toggleCode, _closeCode] call EFUNC(common,deviceKeyRegisterNew);
