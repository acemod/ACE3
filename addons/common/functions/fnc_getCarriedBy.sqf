/**
 * fn_getCarriedBy.sqf
 * @Descr: Get the object that is carrying given unit or object
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: OBJECT Returns the object that is carrying the unit. Otherwise returns ObjNull
 * @PublicAPI: true
 */

#include "script_component.hpp"

((_this select 0) getvariable [QGVAR(carriedBy),objNull]);