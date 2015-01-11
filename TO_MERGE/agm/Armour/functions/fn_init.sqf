/*
 * Author: KoffeinFlummi
 *
 * Because CBA's EHs sucks.
 *
 * Arguments:
 * Init EH
 *
 * Return Value:
 * None
 */

_vehicle = _this select 0;
if (_vehicle isKindOf "CAManBase") exitWith {};

_vehicle addEventHandler ["HandleDamage", {_this call AGM_Armour_fnc_handleDamage}];
