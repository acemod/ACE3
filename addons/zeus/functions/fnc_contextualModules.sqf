/*
 * Author: SilentSpike
 * Removes ace_zeus modules from zeus based on the prescence of other ACE addons
 *
 * Arguments:
 * 0: The zeus logic <LOGIC>
 * 1: The zeus player <UNIT>
 *
 * Return Value:
 * nil
 *
 * Public: No
 */

private ["_logic","_addons","_removeAddons","_classname"];

_logic = _this select 0;
_addons = ["captives","medical"];

_removeAddons = [];
{
	_classname = format ["ace_%1",_x];
	if !(isClass (configFile >> "CfgPatches" >> _classname)) then {
		_removeAddons pushBack (format ["ace_zeus_%1",_x]);
	};
} forEach _addons;

_logic removeCuratorAddons _removeAddons;
