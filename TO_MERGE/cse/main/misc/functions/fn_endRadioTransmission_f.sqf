/**
 * fn_endRadioTransmission_f.sqf
 * @Descr: force end all radio transmissions by TFAR or ACRE
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: nil
 * @PublicAPI: true
 */


if (["acre_api"] call cse_fnc_isModLoaded_F) then {
	[-1] call acre_sys_core_fnc_handleMultiPttKeyPressUp;
	[0] call acre_sys_core_fnc_handleMultiPttKeyPressUp;
	[1] call acre_sys_core_fnc_handleMultiPttKeyPressUp;
	[2] call acre_sys_core_fnc_handleMultiPttKeyPressUp;
};

if (["task_force_radio"] call cse_fnc_isModLoaded_F) then {
	call TFAR_fnc_onSwTangentReleased;
	call TFAR_fnc_onAdditionalSwTangentReleased;

	call TFAR_fnc_onLRTangentReleased;
	call TFAR_fnc_onAdditionalLRTangentReleased;

	call TFAR_fnc_onDDTangentReleased;
};

nil;