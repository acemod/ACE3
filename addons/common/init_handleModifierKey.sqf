#include "script_component.hpp"
/*
 * Author: commy2
 * Initializes the modifier key handler.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public : No
 */

_this spawn {//
    waitUntil {!isNull findDisplay 46};//
    sleep 2;//

    disableSerialization;

    params ["_display"];

    _display displayAddEventHandler ["KeyDown", {_this call FUNC(handleModifierKey)}];
    _display displayAddEventHandler ["KeyUp", {_this call FUNC(handleModifierKeyUp)}];
};//

//@todo, remove all lines with comments after CBA update, events rewrite branch
// note 2, will break in save games after ~ 10 seconds thanks to CBA, fixed with above
