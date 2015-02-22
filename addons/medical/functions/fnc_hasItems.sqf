/*
 * Author: Glowbal
 * Check if all items are present between the patient and the medic.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Item <STRING>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: Yes
 */

#include "script_component.hpp"


private ["_medic", "_patient", "_items", "_return"];
_medic = _this select 0;
_patient = _this select 1;
_items = _this select 2;

_return = true;
{
	if !([_medic, _patient, _x] call FUNC(hasItem)) exitwith {
		_return = false;
	};
}foreach _items;

_return;
