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
 * [_explosive, "SatchelCharge_Remote_Mag","Timer"] call ACE_Explosives_fnc_selectTrigger;
 *
 * Public: No
 */

params ["_explosive", "_magazine", "_trigger"];
TRACE_3("params",_explosive,_magazine,_trigger);

private _config = ConfigFile >> "ACE_Triggers" >> _trigger;

// Make selected trigger the active one (for keybind) if it's the first to be connected
private _activeTrigger = GVAR(activeTrigger);
if (
    _activeTrigger == "" &&
    {(["Command", "MK16_Transmitter", "DeadManSwitch"] findIf {_x == _trigger}) != -1}
) then {
    GVAR(activeTrigger) = getArray (_config >> "requires") select 0;
};

// If the onSetup function returns true, it is handled elsewhere
if (isText(_config >> "onSetup") && {[_explosive,_magazine] call compile getText (_config >> "onSetup")}) exitWith {
    TRACE_2("onSetup returned true",_explosive,_trigger);
};

[ACE_player, getPosATL _explosive, _explosive getVariable [QGVAR(Direction), 0],_magazine, _trigger, [], _explosive] call FUNC(placeExplosive);
