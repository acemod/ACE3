/**
 * fn_hasFlightDisplay_CC.sqf
 * @Descr: Check if vehicle has an onboard BFT display. Works for aircraft and other vehicles.
 * @Author: Glowbal
 *
 * @Arguments: [vehicle OBJECT]
 * @Return: BOOL
 * @PublicAPI: true
 */

private ["_vehicle"];
_vehicle = _this select 0;

if (alive _vehicle) then {
	if (_vehicle isKindOf "CAManBase") exitwith {false};
	if (_vehicle getvariable ["cse_disableVehicleDisplay_CC", false]) exitwith {false};
	if !(CSE_ALLOW_VEHICLE_DISPLAYS_CC) exitwith {false};
	_info = _vehicle getvariable "cse_bft_info_cc";
	if (isnil "_info") exitwith {false};
	true;
} else {
	false;
};