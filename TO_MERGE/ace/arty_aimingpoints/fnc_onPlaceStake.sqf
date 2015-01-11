//#define DEBUG_MODE_FULL
#include "script_component.hpp"

#define ACE_TEXT_RED(Text) ("<t color='#FF0000'>" + ##Text + "</t>")
#define ACE_TEXT_SILVER(Text) ("<t color='#C0C0C0'>" + ##Text + "</t>")
#define ACE_TEXT_ORANGE(Text) ("<t color='#ffa500'>" + ##Text + "</t>")

TRACE_1("enter", _this);

GVAR(placingStake) = true;

// begin stake placement
private["_localStake", "_pos", "_dir"];

PARAMS_1(_stake);
if(IS_STRING(_stake)) then {
	player removeWeapon _stake;

	_localStake = _stake createVehicle [0,0,0];
} else {
	_localStake = _stake;
};
TRACE_1("", _localStake);

_pos = player modelToWorld [0, 1, 0];
_dir = getDir player;
_stakeType = typeOf _localStake;
[_pos, _dir, _localStake, _stakeType] spawn {
	private["_gunArray", "_confirmPlaceAction", "_cancelPlaceAction"];
	
	PARAMS_4(_pos,_dir,_obj,_stakeType);

	player setVariable [QGVAR(stakePlaced), false, false];
	player setVariable [QGVAR(stakeCancel), false, false];
	player setVariable [QGVAR(registeredGun),objNull,false];
	
	_confirmPlaceAction = player addAction[ACE_TEXT_SILVER(localize "STR_ACE_ARTY_PLACE_STAKE"),QPATHTO_F(fnc_onPlaceStakeConfirm),[_obj],-99,false,false,"","_target == player"];
	_cancelPlaceAction  = player addAction[ACE_TEXT_RED(localize "STR_ACE_ARTY_TAKE_STAKE"),QPATHTO_F(fnc_onPlaceStakeCancel),[_obj],-100,false,false,"","_target == player"];
	_registerGunAction = player addAction[ACE_TEXT_ORANGE(localize "STR_ACE_ARTY_REGISTERGUN2STAKE"),QPATHTO_F(fnc_onRegisterGun),[],-101,false,false,"","_target == player && {cursorTarget isKindOf ""StaticWeapon""}"];
	
	_obj attachTo [player, [0, 1, 0]];
	_obj setDir 0;
	if (typeOf _obj == "ACE_Arty_M1A1_Collimator") then {
		_obj setDir 180;
	};
	_atlPos = [0,0,0];
	_aslPos = [0,0,0];
	while {!(player getVariable QGVAR(stakePlaced)) && {!(player getVariable QGVAR(stakeCancel))} && {alive player}} do{
		private["_distance", "_gun"];
		_pos = getPos _obj;
		_atlPos = getPosATL _obj;
		_aslPos = getPosASL _obj;
		_dir = getDir player;
		if (typeOf _obj == "ACE_Arty_M1A1_Collimator") then {
			_dir = (_dir + 180) mod 360;
		};
		// _obj setDir _dir;
		// _obj setPos _pos;
		// _obj setVectorUp[0,0,0.00001]; // fix incase we are on an incline
		// TODO: show the "distance from gun" and "mil from gun" hints...? or a non-interrupt dialog?
		//_gun = player getVariable [QGVAR(registeredGun),objNull];
		_gun = [] call FUNC(findGun); // keep working code in till you find a better fix rocko! :O
		_distance =  (_obj distance _gun) max 0;
		_dn = if (!isNull _gun) then { getText(configFile >> "CfgVehicles" >> typeOf _gun >> "displayName") } else { "" };
		hintSilent format[localize "STR_ACE_ARTY_DISTANCE2GUN",_dn,_distance];
		sleep 0.1;
	};
	detach _obj;
	if ((player getVariable QGVAR(stakePlaced)) && {alive player}) then {
		// deleteVehicle _obj;
	
		// _obj = _stakeType createVehicle _pos;
		// player sideChat format["atl: %1, agl: %2", (_atlPos select 2), (_pos select 2)];
		// if(abs((_atlPos select 2)-(_pos select 2)) < 0.05) then {
			// _aslPos set[2, (getTerrainHeightASL [_aslPos select 0, _aslPos select 1])];
		// };
		
		_obj setPosASL _aslPos;
		_obj setDir _dir;
		_obj setVectorUp[0,0,0.00001]; // fix incase we are on an incline
		{
			(group _x) reveal _obj;
		} forEach playableUnits;
		(group player) reveal _obj;
	
	} else {
		deleteVehicle _obj;
		player addWeapon _stakeType;
	};
	
	// remove action item menus
	player removeAction _confirmPlaceAction;
	player removeAction _cancelPlaceAction;
	player removeAction _registerGunAction;
	
	GVAR(placingStake) = false;
};