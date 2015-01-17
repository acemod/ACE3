/**
 * fn_carriedByObj.sqf
 * @Descr: Check if object A is being carried by object B.
 * @Author: Glowbal
 *
 * @Arguments: [object OBJECT, unit OBJECT]
 * @Return: BOOL True if B is carrying A.
 * @PublicAPI: true
 */

#include "script_component.hpp"

([(_this select 0)] call FUNC(getCarriedBy) == [(_this select 1)] call FUNC(getCarriedBy));