#include "script_component.hpp"

["ace_settingsInitialized", {
    TRACE_2("ace_settingsInitialized",GVAR(showUAV),GVAR(showACRE));
    if (GVAR(showUAV)) then {
        GVAR(signalSourceFuncs) pushBack LINKFUNC(getSignalsUAV);
    };
    if ((isClass (configFile >> "CfgPatches" >> "acre_sys_core")) && {missionNamespace getVariable [QGVAR(showACRE), false]}) then {
        GVAR(signalSourceFuncs) pushBack LINKFUNC(getSignalsACRE);
    };
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    ["ACE_transmitter_base", "init", FUNC(beaconInitServer), true, [], true] call CBA_fnc_addClassEventHandler;
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
// ToDo: IconImage
[LLSTRING(backpack_displayName), "", _conditonCode, _toggleCode, _closeCode] call EFUNC(common,deviceKeyRegisterNew);


#ifdef DEBUG_MODE_FULL
["Q", "Q", "Q", {
    systemChat "Q RECOMPILE";
    [] call ACE_PREP_RECOMPILE;
    [-1] call FUNC(toggleDisplayMode);
    false
}, {false}, [0x10, [false, false, false]], false] call CBA_fnc_addKeybind; // Q Key



#endif
