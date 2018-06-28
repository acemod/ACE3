/*
 * Author: Orbis2358
 * Remove time expired actions from list
 *
 * Arguments:
 * 0: The patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [patient] call ace_medical_fnc_clearExpired
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_target"];

private _joint = _target getVariable [QGVAR(jointTreatment), []];
private _itemCount = 0;

if (!(_joint isEqualTo [])) then {
	{
		if ((_x select 3) < CBA_missionTime) then {
			_joint deleteAt _itemCount;
		};
		_itemCount = _itemCount + 1;
	} forEach _joint;
};

_target setVariable [QGVAR(jointTreatment), _joint, true];
