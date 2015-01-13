/**
 * fn_isBFTItem_CC.sqf
 * @Descr: Check if item has blue force tracking enabled.
 * @Author: Glowbal
 *
 * @Arguments: [item STRING (Classname of item)]
 * @Return: BOOL
 * @PublicAPI: true
 */

(getNumber(configFile >> "CfgWeapons" >> (_this select 0) >> "cse_blueForceTracker") == 1);