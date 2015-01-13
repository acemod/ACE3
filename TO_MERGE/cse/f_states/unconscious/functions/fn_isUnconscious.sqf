/**
 * fn_isUnconscious.sqf
 * @Descr: Checks whatever given object is in the unconscious state
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL True when object is in unconscious state
 * @PublicAPI: true
 */

 ((_this select 0) getvariable ["cse_state_unconscious",false]);