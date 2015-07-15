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
#include "script_component.hpp"
private ["_config"];

EXPLODE_3_PVT(_this,_explosive,_magazine,_trigger);
_config = ConfigFile >> "ACE_Triggers" >> _trigger;

// If the onSetup function returns true, it is handled elsewhere
if (isText(_config >> "onSetup") && {[_explosive,_magazine] call compile getText (_config >> "onSetup")}) exitWith {};

[ACE_player, getPosATL _explosive, _explosive getVariable [QGVAR(Direction), 0],_magazine, _trigger, [], _explosive] call FUNC(placeExplosive);
