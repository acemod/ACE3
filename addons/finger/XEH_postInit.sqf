#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ace_settingsInitialized", {
    //If not enabled, dont't bother adding eventhandler
    TRACE_1("ace_settingsInitialized eh", GVAR(enabled));
    if (!GVAR(enabled)) exitWith {};
    
    GVAR(lastFPTime) = -1;
    GVAR(fingersHash) = [] call CBA_fnc_hashCreate;
    GVAR(pfeh_id) = -1;
    
    [QGVAR(fingered), {_this call FUNC(incomingFinger)}] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;

//Add Keybind:
["ACE3 Common", QGVAR(finger), [(localize LSTRING(keyComb)), (localize LSTRING(keyComb_description))],
{
    if (!GVAR(enabled)) exitWith {false};
    _this call FUNC(keyPress);
},
{false},
[41, [true, false, false]], true] call CBA_fnc_addKeybind; // Shift + Tilda (hold)
