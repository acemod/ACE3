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

// item classname in items unit
((_this select 1) in items (_this select 0));