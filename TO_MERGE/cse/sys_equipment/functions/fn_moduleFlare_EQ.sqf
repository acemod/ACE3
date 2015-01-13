/**
 * fn_moduleFlare_EQ.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_logic", "_className", "_cfg", "_ammo", "_flare"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (!isNull _logic) then {
	_className = typeOf _logic;
	_cfg = (ConfigFile >> "CfgVehicles" >> _className);
	_ammo = getText(_cfg >> "ammo");
	if (_ammo != "") then {
		_flare = [_logic, _ammo] call cse_fnc_dropFlare_EQ;
		if (isnull _flare) then {
			deleteVehicle _logic;
			deleteVehicle _flare;
		} else {
			_logic setvariable ["cse_droppedFlare", _flare];

			{
				if !(_x getvariable ["CSE_CURATOR_ADDITIONAL_EQ", false]) then {
					_x setvariable ["CSE_CURATOR_ADDITIONAL_EQ", true];
					_X addEventHandler["CuratorObjectDeleted", {
						_obj = _this select 1;
						if !(isNull (_obj getvariable ["cse_droppedFlare", objNull])) then {
							deleteVehicle (_obj getvariable ["cse_droppedFlare", objNull]);
						};
					 }];
				};
			}foreach objectCurators _logic;
		};
	};
};