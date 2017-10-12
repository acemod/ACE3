/*
 * Author: TCVM
 * Deploys the current CSW
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_csw_fnc_deployWeapon
 *
 * Public: No
 */
#include "script_component.hpp"

params["_tripod", "_player"];

[{
	params["_tripod", "_player"];
	private _backpackClassname = backpack _player;
	removeBackpackGlobal _player;
	
	private _onFinish = {
		params["_args"];
		_args params["_tripod", "_player", "_backpackClassname"];
		private _assembledClassname = getText(configfile >> "CfgVehicles" >> _backpackClassname >> QGVAR(cswOptions) >> "ace_csw_assembleTo");
		private _tripodPos = getPosATL _tripod;
		private _tripodDir = getDir _tripod;
	
		_tripodPos set[2, (_tripodPos select 2) + 0.5];
	
		private _csw = createVehicle [_assembledClassname, [0, 0, 0], [], 0, "NONE"];
		deleteVehicle _tripod;
		_csw setPosATL(_tripodPos);
		_csw setDir _tripodDir;
		_csw setVectorUp (surfaceNormal _tripodPos);

		// Set the ammo to zero so no config mess-ups will allow for infinite ammo
		_csw setVehicleAmmo 0;

		[QGVAR(addObjectToServer), [_csw]] call CBA_fnc_serverEvent;
		GVAR(newVehicle) = objNull;
	};
	
	private _onFailure = {
		params["_args"];
		_args params["", "_player", "_backpack"];
		_player addBackpackGlobal _backpack;
	};
	
	[15, [_tripod, _player, _backpackClassname], _onFinish, _onFailure, localize CSTRING(AssembleCSW_progressBar)] call EFUNC(common,progressBar);
}, [_tripod, _player]] call CBA_fnc_execNextFrame;