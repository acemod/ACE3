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

((crew _csw) isEqualTo [] || !(alive (gunner _csw))) && !(isNull(configfile >> "CfgVehicles" >> typeof(_csw) >> QGVAR(cswOptions) >> "disassembleTo"))

