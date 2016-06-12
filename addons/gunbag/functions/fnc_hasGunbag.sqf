/*
 * Author: Ir0n1E
 * switches gunbag full/empty for mass calculation
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * (BOOL)
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

backpackContainer _unit isKindOf QUOTE(CLASSNAME)
