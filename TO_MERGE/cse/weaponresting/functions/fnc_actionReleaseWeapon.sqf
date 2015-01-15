/**
 * fn_actionReleaseWeapon_WR.sqf
 * @Descr: Force unrest/undeploy of the weapon
 * @Author: Ruthberg
 *
 * @Arguments: []
 * @Return: nil
 * @PublicAPI: false
 */

#include "script_component.hpp"

player setVariable [QGVAR(isWeaponRested), false, false];
player setVariable [QGVAR(isWeaponDeployed), false, false];
