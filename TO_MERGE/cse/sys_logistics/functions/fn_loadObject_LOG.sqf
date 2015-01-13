/**
 * fn_loadObject_LOG.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_obj","_veh","_loaded","_numberLoaded"];
_obj = _this select 0;
_veh = _this select 1;
if (isNull _veh) exitwith {
	hintSilent "Cannot load object in vehicle";
	false;
};
if (speed _veh > 1) exitwith {false};
if (((getPos _veh) select 2) > 3) exitwith {false};
_loaded = _veh getvariable ["cse_logistics_loadedCargo_LOG",[]];
_numberLoaded = count _loaded;
if (_numberLoaded > 5) exitwith {
	// we need to properly implement a check for amount of cargo in vehicle
	hintSilent "This vehicle is full!";
	false;
};
_loaded set[ _numberLoaded, _obj];
_veh setvariable ["cse_logistics_loadedCargo_LOG",_loaded,true];
detach _obj;
_obj attachTo [_veh,[0,0,100]];

[[_obj, _veh, true], "cse_fnc_hideObjCargo_LOG", true, false] spawn BIS_fnc_MP;

[[_obj, _veh], "logistics_ObjectLoaded"] call cse_fnc_customEventHandler_F;

true;