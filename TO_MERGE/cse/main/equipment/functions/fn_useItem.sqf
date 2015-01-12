/**
 * fn_useItem.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

private ["_unit","_item","_return"];
_unit = _this select 0;
_item = _this select 1;
_vehicleUsage = [_this, 2, false, [false]] call BIS_fnc_Param;

if (!_vehicleUsage) then {
	if (_item != "") then {
		if (_item in (items _unit)) then {
			_unit removeItem _item;
			_return = true;
		} else {
			if (_item in (assignedItems _unit)) then {
				_unit unassignItem _item;
				_unit removeItem _item;
				_return = true;
			};
		};
	} else {
		_return = false;
	};
	[format["fnc_useItem: %1 | %2",_this,_return]] call cse_fnc_debug;
_return
} else
{
	// TODO implement shared item functionality
};