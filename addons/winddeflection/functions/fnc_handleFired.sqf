/*
 * Author: Glowbal, Ruthberg
 * Handles wind deflection for projectiles.
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: weapon - Fired weapon <STRING>
 * 2: muzzle - Muzzle that was used <STRING>
 * 3: mode - Current mode of the fired weapon <STRING>
 * 4: ammo - Ammo used <STRING>
 * 5: magazine - magazine name which was used <STRING>
 * 6: projectile - Object of the projectile that was shot <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_advanced_ballistics_fnc_handleFired
 *
 * Public: No
 */
#include "script_component.hpp"

if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) exitWith {false};

private ["_unit", "_bullet"];
_unit = _this select 0;
_bullet = _this select 6;

if (!hasInterface) exitWith {false};
if (!(_bullet isKindOf "BulletBase")) exitWith {false};
if (_unit distanceSqr ACE_player > 9000000) exitWith {false};
if (!GVAR(EnableForAI) && !([_unit] call EFUNC(common,isPlayer))) exitWith {false}; // TODO: Remove this?

[_bullet, getNumber(configFile >> "cfgAmmo" >> (_this select 4) >> "airFriction")] call FUNC(updateTrajectoryPFH);

true;