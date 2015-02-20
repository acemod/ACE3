/*
 * Author: bux, commy2
 * Remove the ai's missle launcher tube after the missle has exploded
 *
 * Arguments:
 * 0: Params [unit<OBJECT>, Tube<STRING>, Projectile<OBJECT>] <ARRAY>
 * 1: CBA PFH ID <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [[someAI, "emptyTube", theRocket], 55] call ace_disposable_fnc_aiDropWeaponCallback;
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_params,_pfhId);
EXPLODE_3_PVT(_params,_unit,_tube,_projectile);

if (!isNull _projectile) exitWith {};

//remove frameEH
[_pfhId] call cba_fnc_removePerFrameHandler;

if ([_unit] call EFUNC(common,isPlayer)) exitWith {}; //Just in case a player took control
if (!alive _unit) exitWith {}; //No point doing this for dead

//If AI still has tube, throw it on ground
if (secondaryWeapon _unit == _tube) then {
    private ["_logic"];
    _logic = createVehicle ["GroundWeaponHolder", position _unit, [], 0, "CAN_COLLIDE"];
    _logic addWeaponCargoGlobal [_tube, 1];  // @todo secondary weapon items
    _unit removeWeaponGlobal _tube;
};
