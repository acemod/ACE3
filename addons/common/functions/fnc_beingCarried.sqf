/**
 * fn_beingCarried.sqf
 * @Descr: Check if object is being carried
 * @Author: Glowbal
 *
 * @Arguments: [object OBJECT]
 * @Return: BOOL True if object is being carried
 * @PublicAPI: true
 */
#include "script_component.hpp"

!(isNull ([_this select 0] call FUNC(getCarriedObj)));