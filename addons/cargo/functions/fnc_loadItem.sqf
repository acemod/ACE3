#include "script_component.hpp"

_item = _this select 0;
_vehicle = _this select 1;

_item setVariable [QGVAR(canInteract), player, true];
_size = getNumber(ConfigFile >> "CfgVehicles" >> typeOf(_item) >> "ACE_Size");
if (isClass (configFile >> "CfgVehicles" >> typeOf(_vehicle) >> "ACE_Load")) exitWith {
	_attachPoints = _vehicle call FUNC(getLoadPoints);
	{
		if ((_x select 4) == (_this select 2)) exitWith {
			if ([_x select 1, _x select 3] call FUNC(remainingSpace) >= _size) then {
				[5 * _size, [_item, _vehicle, _x select 4, false], {_this call FUNC(loadItemCallback)}, {_this call FUNC(loadItemAbort)}, localize "STR_ACE_Cargo_LoadingItem"] call EFUNC(common,progressBar);
			};
		};
	} count _attachPoints;
};
// Fallback to magic menu
[5 * _size, [_item, _vehicle, "", true], {_this call FUNC(loadItemCallback)}, {_this call FUNC(loadItemAbort)}, localize "STR_ACE_Cargo_LoadingItem", {true}, ["isNotDragging", "isNotCarrying"]] call EFUNC(common,progressBar);
[_vehicle] call EFUNC(common,closeDialogIfTargetMoves);