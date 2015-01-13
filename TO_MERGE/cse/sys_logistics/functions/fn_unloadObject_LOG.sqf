/**
 * fn_unloadObject_LOG.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_obj","_veh","_loaded","_numberLoaded","_position","_mTw"];
_obj = _this select 0;
_veh = _this select 1;

if (speed _veh > 5) exitwith {
	hintSilent "Vehicle is moving to fast";
};
if (((getPos _veh) select 2) > 5) exitwith {
	hintSilent "Vehicle is to high";
};

_position = position _veh findEmptyPosition [0, 50, typeOf _obj];
if (count _position < 1) exitwith {
	hintSilent "No empty space available - cannot unload cargo!";
};

_loaded = _veh getvariable ["cse_logistics_loadedCargo_LOG",[]];

_numberLoaded = count _loaded;
_loaded = _loaded - [_obj];
_veh setvariable ["cse_logistics_loadedCargo_LOG",_loaded,true];
detach _obj;

_obj setPos _position;
//_obj setPos [((getPos _veh) select 0), ((getPos _veh) select 1), (getPos _veh ) select 2];
[[_obj, _veh, false], "cse_fnc_hideObjCargo_LOG", true, false] spawn BIS_fnc_MP;

if ([player, _obj] call cse_fnc_canCarryObj_LOG) then {
	if ([player,_obj,[0,1.5,1],false] call cse_fnc_carryObj) then {
		hint format["Object unloaded / moving"];
	};
} else {
	if ([player, _obj] call cse_fnc_canDragObj_LOG) then {
		[player, _obj] call cse_fnc_dragObject_LOG;
	};
};

[[_obj, _veh], "logistics_ObjectUnloaded"] call cse_fnc_customEventHandler_F;