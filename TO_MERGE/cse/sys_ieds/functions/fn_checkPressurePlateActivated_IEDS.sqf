/**
 * fn_checkPressurePlateActivated_IEDS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_pressurePlate","_return","_list","_pos"];
_pressurePlate = _this select 0;
_return = false;

	_pos = ASLToATL (getPosASL _pressurePlate);
	_list = _pos nearEntities [(_pressurePlate getvariable ["activatedForTargets",["Man", "Air", "Car", "Motorcycle", "Tank"]]),3];
	{
		if (side _x in (_pressurePlate getvariable ["activatedForSides",[WEST]])) then {
			if (_x isKindOf "CaManBase") then {
				if (_x distance _pressurePlate < random(1)) then {
					_return = true;
				};
			} else {
				if (_x distance _pressurePlate < (0.5+random(3))) then {
					_return = true;
				};
			};
		};
		if (_return) exitwith {};
		false;
	}count _list;

_return

