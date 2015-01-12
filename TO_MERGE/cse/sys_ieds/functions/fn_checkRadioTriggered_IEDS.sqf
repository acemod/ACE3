/**
 * fn_checkRadioTriggered_IEDS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_ied","_return","_list","_radioBlock","_personsAround","_targetDetected","_triggerMan"];
_ied = _this select 0;
_return = false;
_targetDetected = false;
_triggerManUnits = _ied getvariable ["cse_ieds_triggerManUnits",[]];
if ((_triggerManUnits isEqualTo [])) exitwith{false;};
_list = (position _ied) nearEntities [(_ied getvariable ["activatedForTargets",["CaManBase", "Air", "Car", "Motorcycle", "Tank"]]),5];
{
	_target = _x;
	{
		if ([_x, _target] call cse_fnc_triggerManGotVisual_IEDS) then {
			if (side _target in (_ied getvariable ["activatedForSides",[WEST]])) then {
				_targetDetected = true;
			};
		};
		if (_targetDetected) exitwith {};
	}count _triggerManUnits;
	if (_targetDetected) exitwith {};
}count _list;

if (!(_list isEqualTo []) && _targetDetected) then {
	_radioBlock = [_ied] call cse_fnc_checkifJammed_IEDS;
	_nearestPerson = _list select 0;
	_vehicleNear = false;
	{
		if (_ied distance _x < (_ied distance _nearestPerson)) then {
			_nearestPerson = _x;
		};
		if (!(_x iskindof "CaManBase")) then {
			_vehicleNear = true;
		};
	}foreach _list;

	if (!_radioBlock) then {
		if (count _list > 5) then {
			_return = true;
		} else {
			if (((_nearestPerson distance _ied < 1) || _vehicleNear) && random(1) >0.985) then {
				_return = true;
			};
		};
	};
};
_return
