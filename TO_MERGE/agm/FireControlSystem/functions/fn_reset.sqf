/*
 * Author: KoffeinFlummi
 *
 * Resets the FCS to default.
 *
 * Arguments:
 * 0: Vehicle
 *
 * Return Value:
 * none
 */

private ["_vehicle"];

_vehicle = _this select 0;

_vehicle setVariable ["AGM_FCSDistance", 0, true];
_vehicle setVariable ["AGM_FCSMagazines", [], true];
_vehicle setVariable ["AGM_FCSElevation", 0, true];
_vehicle setVariable ["AGM_FCSAzimuth", 0, true];

[localize "STR_AGM_FireControlSystem_HasBeenReset"] call AGM_Core_fnc_displayTextStructured;
