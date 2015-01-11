#include "script_component.hpp"

ADDON = false;

// core functionality functions
PREP(openPrepDialog);
PREP(onLoadGun);
PREP(onUnloadGun);
PREP(onPickupShell);
PREP(onDropShell);
PREP(onPrepShell);

// random functionality stuff
PREP(dropShell);
PREP(spawnShell);

PREP(convertShell); // Converts a traditional CSWDM into a useable ACE mortar shell, wicked eh?!11 

// object events
PREP(onShellDestroyed);

// dialog populators and setters
PREP(populateRoundsList);
PREP(populateChargeList);
PREP(setDialogParameters);

// dialog events
PREP(onDialogOpen);
PREP(onDialogClose);
PREP(onDoPrep);

// dialog events
PREP(onSelectRound);
PREP(onSelectFuze);
PREP(onSelectCharge);
PREP(onSelectProx);

// misc functionality helpers/libs
PREP(isKindOf);
PREP(menuDef);

// cart ejection
PREP(onFired_cartEject);

//GVARS
GVAR(isDialogOpen) = false;
GVAR(currentCharge) = -1;
GVAR(currentFuze) = "";
GVAR(fuzeTime) = "";

GVAR(wpCount) = 0;

FUNC(changeCharge) = {
	private["_magData", "_maxCharge", "_minCharge", "_newCharge"];
	PARAMS_1(_dir);
	_magData = configFile >> "CfgMagazines" >> GVAR(currentRoundType);
	_maxCharge = getNumber(_magData >> "ACE_ARTY_MAXCHARGE");
	_minCharge = getNumber(_magData >> "ACE_ARTY_MINCHARGE");
	_newCharge = ((GVAR(currentCharge) + _dir) max _minCharge) min _maxCharge;
	GVAR(currentCharge) = _newCharge;
	TRACE_1("New Charge",GVAR(currentCharge));
	ctrlSetText [12556, format["Current Charge: %1", GVAR(currentCharge)]];
	ctrlSetText [12559, format[getText(_magData >> "ACE_ARTY_CHARGE_IMAGE_FORMAT"), GVAR(currentCharge)]];
};

FUNC(attachSmokeEffects) = {
	PARAMS_1(_grenades);
	{
		private ["_g", "_light", "_sp", "_sm"];
		_g = _x select 0;
		_v = _x select 1;
		_g setVelocity _v;
		_light = "#lightpoint" createVehicle getPos _g;
		_light setPos getPos _g;
		_light setLightBrightness 0.05;
		_light setLightAmbient[1,1,1];
		_light setLightColor[1,1,1];
		_light lightAttachObject [_g, [0,0,0]];
		
		_sp = "#particlesource" createVehicle getPos _g;
		_sp setParticleRandom [0.03, [0, 0, 0], [0, 0, 0], 0, 0.2, [0, 0, 0, 0], 0, 0, 360];
		_sp setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal", 16, 13, 2,0],
			"", "Billboard", 1, 0.1, [0, 0, 0],
			[0,0,0], 1, 1, 0.80, 0.5, [1.5,0],
			[[1,1,1,-4], [1,1,1,-4], [1,1,1,-2],[1,1,1,0]],[1000],0.1,0.1,"","",_g,360];
		_sp setDropInterval 0.001;
		
		_sm = "#particlesource" createVehicle getPos _g;
		_sm setParticleRandom [0.5, [0, 0, 0], [0, 0, 0], 0, 0.3, [0, 0, 0, 0], 0, 0, 360];
		_sm setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal", 16, 12, 8,0],
			"", "Billboard", 1, 30, [0, 0, 0],
			[0,0,0], 1, 1, 0.80, 0.5, [1.3,4],
			[[0.9,0.9,0.9,0.6], [1,1,1,0.3], [1,1,1,0]],[1],0.1,0.1,"","",_g];
		_sm setDropInterval 0.02;
		
		[_g, _sp, _sm, _light] spawn {
			private["_time"];
			_time = time;
			waitUntil {
				sleep 0.1;
				if (time-_time > getNumber(configFile >> "CfgAmmo" >> "ace_arty_105mm_m84a1_m782_smokeCanisterHC" >> "explosionTime")) then {
					deleteVehicle (_this select 2);
				};
				!(alive (_this select 0));
			};
			deleteVehicle (_this select 1);
			deleteVehicle (_this select 3);
		};
	} forEach _grenades;
};

FUNC(AddModelIncrements) = {
	private ["_selection","_charge","_chargecount"];
	PARAMS_1(_shell);
	for "_i" from 1 to 10 do {
		_selection = format["hide_inc%1",_i];
		_shell animate [_selection,1];	
	};
	_charge = _shell getVariable ["ACE_ARTY_PREP",[]];
	_chargecount = if (count _charge == 0) then { 0 } else { _charge select 3 };
	for "_i" from 1 to _chargecount do {
		_selection = format["hide_inc%1",_i];
		_shell animate [_selection,0];
	};
};

FUNC(packShell) = {
	PARAMS_3(_shell,_box,_magazine);
	deleteVehicle _shell;
	_box addMagazineCargoGlobal [_magazine,1];
};

FUNC(reload) = {
	private ["_magazine","_weapon"];
	PARAMS_1(_gun);
	_magazine = (_gun getVariable "ace_sys_arty_currentRound") select 0;
	_weapon = (weapons _gun) select 0;
	_gun removeWeapon _weapon;
	_gun addMagazine _magazine;
	_gun addWeapon _weapon;
	_gun selectWeapon _weapon;
	reload _gun;
};
[QGVAR(reload), { _this call FUNC(reload) }] call CBA_fnc_addEventHandler;

FUNC(unload) = {
	private ["_magazine","_weapon"];
	PARAMS_1(_gun);
	_weapon = (weapons _gun) select 0;
	_magazine = (magazines _gun) select 0;
	_gun removeWeapon _weapon;
	_gun removeMagazines _magazine;
	_gun addWeapon _weapon;
	_gun selectWeapon _weapon;
};
[QGVAR(unload), { _this call FUNC(unload) }] call CBA_fnc_addEventHandler;

ADDON = true;
