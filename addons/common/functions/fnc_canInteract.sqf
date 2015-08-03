/**
 * fn_canInteract.sqf
 * @Descr: Check if unit can interact with enviroment. Unit has to be awake and not be in arrested state.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL True if unit can interact with enviroment.
 * @PublicAPI: true
 */
#include "script_component.hpp"

params ["_unit"];

(((_unit getvariable [QGVAR(canInteract),0]) < 1) && ([_unit] call FUNC(isAwake)) && !([_unit] call FUNC(isArrested)))