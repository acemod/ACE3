/**
 * fn_createIEDObject_IEDS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define LAND_IEDS 		["IEDLandBig_Remote_Ammo", "IEDLandSmall_Remote_Ammo"]
#define URBAN_IEDS 		["IEDUrbanBig_Remote_Ammo", "IEDUrbanSmall_Remote_Ammo"]

private ["_logic","_typeOfIED", "_sizeOfIED", "_heightOfIED", "_iedClass", "_iedCreated"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (isNull _logic) exitwith {

};
_typeOfIED = _logic getvariable ["typeOfIED", 0];
_sizeOfIED = _logic getvariable ["sizeOfIED", 0];
_heightOfIED = _logic getvariable ["heightOfIED", 0];

_iedClass = switch (_typeOfIED) do {
	case 0: { LAND_IEDS select _sizeOfIED};
	case 1: { URBAN_IEDS select _sizeOfIED };
};
_iedCreated = _iedClass createVehicle (getPos _logic);
_logic setvariable ["cse_linkedIED_IEDS",_iedCreated, true];
_iedCreated setPos [getPos _Logic select 0, getPos _Logic select 1, (getPos _Logic select 2) + _heightOfIED];
[format["CREATED IED: %1", _iedCreated]] call cse_fnc_debug;