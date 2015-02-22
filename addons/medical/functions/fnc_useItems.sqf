/*
 * Author: Glowbal
 * Use Equipment items if any is available. Priority: 1) Medic, 2) Patient. If in vehicle: 3) Crew
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Items <ARRAY<STRING>>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_medic", "_patient", "_items"];
_medic = _this select 0;
_patient = _this select 1;
_items = _this select 2;

{
	// handle a one of type use item
	if (typeName _x == "ARRAY") then {
		{
			if ([_medic, _patient, _x] call FUNC(useItem)) exitwith {};
		}foreach _x;
	};

	// handle required item
	if (typeName _x == "STRING") then {
		[_medic, _patient, _x] call FUNC(useItem);
	};
}foreach _items;
