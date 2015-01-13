/**
 * fn_canRefill_FR.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit", "_target"];
_unit = [_this, 0, objNull, [objNull]] call bis_fnc_param;
_target = [_this, 1, objNull, [objNull]] call bis_fnc_param;


(((_target getvariable ["cse_isRefillObject_FR", false]) || (_target iskindof "Land_Misc_Well_C_EP1") || (_target iskindof "Land_Misc_Well_L_EP1") || (_target iskindof "Land_Barrel_water") || (_target iskindof "Land_stand_waterl_EP1") || (_target iskindof "Land_Reservoir_EP1")) && (_target distance _unit < 5))