/**
 * fn_canEat_FR.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit"];
_unit = [_this, 0, objNull, [objNull]] call bis_fnc_param;

((_unit getvariable ["cse_food_status_fr", 100]) < 101)