/*//#define DEBUG_MODE_FULL
#include "script_component.hpp"

#define __MG_CFG configFile >> "CfgVehicles" >> (typeOf _gun)
#define __WEAPON (getArray(configFile >> "CfgVehicles" >> (typeOf _gun) >> "Turrets" >> "MainTurret" >> "weapons") select 0)

PARAMS_1(_gun);

// PLAYER !?

// Check if we have a player sitting in the gunner seat, instead of spawning an AI, we make the player fire it
if (isPlayer gunner _gun) exitWith {
	(gunner _gun) selectWeapon __WEAPON;
	(vehicle gunner _gun) fire __WEAPON;
};
*/
// FIRE ON RELOAD !!



// - _dummy fire _weapon
// Should be executed on client where vehicle is local?
// 1. Executing FOR with AI on a client works (when mortar is local to the client)
// 2. Executing FOR with AI on the server, when mortar is local to server does also work but no visual effects (firing sound, muzzleflash)
// Are effects visible for another client when performing step 1?
// - No they are not. An other client does not see firing effects
// - And if the other client who does not see the effects loads mortar, then the client where mortar is local to sees the effects

// Conclusion the firing is only local to the machine where the mortar is local to when using the FIRE command
// It seems not to be broadcasted over net (Arma bug)

// Testing now with USEWEAPON - ACTION command.
// - Tested. UseWeapon could work if the weapon index was known.
// - Since we remove the weapon and add a magazine and re-add the weapon,
//   the weapon index changes everytime, and AI fails to fire then
// Speculative, not really sure

// Probably the index is always 0 because its the only weapon even if re-added?
// - Confirmed

// Executing 
// (vehicle gunner cursorTarget) action ["useweapon",(vehicle cursorTarget),(gunner vehicle cursorTarget),0]
// on a client where the mortar is local, fires only for THAT client, other clients dont see the effects

// But executing it on a client where the mortar is NOT local, then ALL clients see the effects
// So, the firing should be done on any other client where the mortar is not local to

// Called from server Trigger !!!!!!

/* Disabled Fire on Reload for now 
if (!isNull (gunner _gun) && !isPlayer (gunner _gun)) exitWith {
	hintSilent "Auto-Fire failed, there is crew inside the mortar!";
};
_dummy = createAgent ["ACE_CivDummy", getPos _gun, [], 0, "FORM"]; // [10,10,0]

waitUntil { alive _dummy };

TRACE_1("Dummy",_dummy);

{
	//_x enableSimulation false;
	//_x disableAI "TARGET";
	//_x disableAI "AUTOTARGET";
	//_x disableAI "MOVE";
	//_x disableAI "ANIM";
} foreach [_dummy];

_dummy moveInGunner _gun;

waitUntil { gunner _gun == _dummy };

if (gunner _gun == _dummy) then {
	TRACE_1("Dummy UseWeapon",_dummy);
	TRACE_1("Executed fire command",_dummy);
	reload _gun;
	sleep 0.05;
	_dummy selectWeapon __WEAPON;
	sleep 0.05;
	_gun fire __WEAPON;
	(vehicle _dummy) fire __WEAPON;
	//(vehicle _dummy) action ["useWeapon",(vehicle _dummy), (gunner(vehicle _dummy)),0];
	_timeStart = time;
	_timeEnd = _timeStart + 45;
	waitUntil {_gun ammo __WEAPON == 0 || time > _timeEnd };

	TRACE_1("Past firing sequence",_dummy);
	if (_gun ammo __WEAPON > 0) then {
		TRACE_1("Firing seemed to have failed",nil);
		hintSilent "AutoFiring failed";
	} else {
		hintSilent "AutoFiring";
	};
};
moveOut _dummy;
sleep 1;
deleteVehicle _dummy;
*/