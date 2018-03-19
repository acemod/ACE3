/*
 * Author: TCVM
 * If the CSW is mounted or in use this will not allow you to dismount the weapon
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 *
 * Return Value:
 * Can Dismount <BOOL>
 *
 * Example:
 * [weapon] call ace_csw_fnc_canDismountWeapon
 *
 * Public: No
 */
#include "script_component.hpp"
params["_csw"];

private _crewed = (crew _csw) isEqualTo [];
private _deadCrew = !(alive (gunner _csw));
private _disassembleDefined = !(isNull(configfile >> "CfgVehicles" >> typeof(_csw) >> QGVAR(options) >> "disassembleTo"));
private _configEnabled = (getNumber(configfile >> "CfgVehicles" >> typeof(_csw) >> QGVAR(options) >> "enabled") == 1);

(_crewed || _deadCrew) && _disassembleDefined && _configEnabled && _csw getVariable[QGVAR(enableCSW), true];

