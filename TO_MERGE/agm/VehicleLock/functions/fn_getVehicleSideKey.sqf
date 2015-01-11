/*
  Name: AGM_VehicleLock_fnc_getVehicleSideKey

  Author: Pabst Mirror

  Description:
    Returns the side specifc key for a vehicle

  Parameters:
    0: OBJECT - vehicle

  Returns:
    STRING - Key Classname

  Example:
    [tank1] call AGM_VehicleLock_fnc_getVehicleSideKey;
*/

private ["_veh","_vehConfigSide","_vehSide","_returnValue"];

_veh =   [_this, 0, objNull, [objNull]] call bis_fnc_param;
if (isNull _veh) exitWith {["AGM_VehicleLock_fnc_getVehicleSideKey: null vehicle"] call BIS_fnc_error; ""};

_vehConfigSide = [_veh, true] call bis_fnc_objectSide;
_vehSide = _veh getVariable ["agm_lock_side", _vehConfigSide];

_returnValue = "";

switch (_vehSide) do {
case (west):       {_returnValue = "AGM_item_key_west"};
case (east):       {_returnValue = "AGM_item_key_east"};
case (resistance): {_returnValue = "AGM_item_key_indp"};
case (civilian):   {_returnValue = "AGM_item_key_civ"};
};

_returnValue
