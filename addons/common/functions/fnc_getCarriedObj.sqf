/**
 * fn_getCarriedObj.sqf
 * @Descr: Grab the registered carried object
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: OBJECT Returns the object that the unit is currently carrying. If not carrying, returns ObjNull
 * @PublicAPI: true
 */

#include "script_component.hpp"

((_this select 0) getvariable [QGVAR(carriedObj),objNull]);
