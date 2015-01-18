/**
 * fn_isArrested.sqf
 * @Descr: Check if unit is in arrested state
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL Returns true if unit or object is in arrest state
 * @PublicAPI: true
 */

#include "script_component.hpp"

((_this select 0) getvariable [QGVAR(StateArrested),false])