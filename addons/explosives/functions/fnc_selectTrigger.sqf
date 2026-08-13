#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Selects a trigger for an explosive.
 *
 * Arguments:
 * 0: Explosive <OBJECT>
 * 1: Magazine <STRING>
 * 2: Trigger mode <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, "SatchelCharge_Remote_Mag", "Timer"] call ace_explosives_fnc_selectTrigger
 *
 * Public: No
 */

params ["_explosive", "_magazine", "_trigger"];
TRACE_3("params",_explosive,_magazine,_trigger);

private _config = configFile >> "ACE_Triggers" >> _trigger;

// Make selected trigger the active one (for keybind) if it's the first to be connected, or the current active trigger has no connected explosives
if (
    (GVAR(activeTrigger) == "" || {([ACE_Player, getArray (configFile >> "ACE_Triggers" >> GVAR(activeTrigger) >> "requires") select 0] call FUNC(getPlacedExplosives)) isEqualTo []}) 
    && {(["Command", "MK16_Transmitter", "DeadManSwitch"] findIf {_x == _trigger}) != -1}
) then {
    GVAR(activeTrigger) = getArray (_config >> "requires") select 0;
};

// If the onSetup function returns true, it is handled elsewhere
if (isText (_config >> "onSetup") && {[_explosive, _magazine] call compile getText (_config >> "onSetup")}) exitWith {
    TRACE_2("onSetup returned true",_explosive,_trigger);
};

[ACE_player, getPosATL _explosive, _explosive getVariable [QGVAR(direction), 0], _magazine, _trigger, [], _explosive] call FUNC(placeExplosive);

nil
