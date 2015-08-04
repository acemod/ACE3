/**
 * fn_hasItem.sqf
 * @Descr: Check if unit has item
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, item STRING (Classname of item)]
 * @Return: BOOL
 * @PublicAPI: true
 */
 #include "script_component.hpp"

params ["_unit", "_item"];

// item classname in items unit
(_item in items _unit);
