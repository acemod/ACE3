/**
 * fn_getBloodVolumeChange_CMS.sqf
 * @Descr: Calculates the blood volume change and decreases the IVs given to the unit.
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: NUMBER Bloodvolume change
 * @PublicAPI: false
 */

/*
	IV Change per second calculation:
	250ml should take 60 seconds to fill. 250/60 = 4.166.
*/
#define IV_CHANGE_PER_SECOND 		-4.166

/*
	Blood Change per second calculation for IVs:
	250ml should take 60 seconds to fill in. Total blood volume is 7000ml = 100%.
	7000/100 = 70 = 1%
	250 / 70 = 3.571428571%
	3.571428571 / 60 = 0.0595% per second.
*/
#define BLOOD_CHANGE_PER_SECOND		0.0595



private ["_unit","_bloodVolume","_bloodVolumeChange", "_ivVolume"];
_unit = _this select 0;

_bloodVolume = _unit getvariable ["cse_bloodVolume", 100];
_bloodVolumeChange = -(_unit call cse_fnc_getBloodLoss_CMS);

if (_bloodVolume < 100.0) then {
	if ((_unit getvariable ["cse_salineIVVolume", 0]) > 0) then {
		_bloodVolumeChange = _bloodVolumeChange + BLOOD_CHANGE_PER_SECOND;
		_ivVolume = (_unit getvariable ["cse_salineIVVolume", 0]) + IV_CHANGE_PER_SECOND;
		_unit setvariable ["cse_salineIVVolume",_ivVolume];
		if (["cse_sys_field_rations"] call cse_fnc_isModuleEnabled_F) then {
			if ([_unit] call cse_fnc_canDrink_FR) then {
				_unit setvariable ["cse_drink_status_fr", (_unit getvariable ["cse_drink_status_fr", 100]) + 0.2];
			};
		};
	};
	if ((_unit getvariable ["cse_plasmaIVVolume", 0]) > 0) then {
		_bloodVolumeChange = _bloodVolumeChange + BLOOD_CHANGE_PER_SECOND;
		_ivVolume = (_unit getvariable ["cse_plasmaIVVolume", 0]) + IV_CHANGE_PER_SECOND;
		_unit setvariable ["cse_plasmaIVVolume",_ivVolume];
	};
	if ((_unit getvariable ["cse_bloodIVVolume", 0]) > 0) then {
		_bloodVolumeChange = _bloodVolumeChange + BLOOD_CHANGE_PER_SECOND;
		_ivVolume = (_unit getvariable ["cse_bloodIVVolume", 0]) + IV_CHANGE_PER_SECOND;
		_unit setvariable ["cse_bloodIVVolume",_ivVolume];
	};
};

_bloodVolumeChange
