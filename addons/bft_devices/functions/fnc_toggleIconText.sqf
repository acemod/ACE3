/*
 * Author: Gundy
 *
 * Description:
 *   Toggle text next to BFT icons
 *
 * Arguments:
 *   0: Interface ID <STRING>
 *
 * Return Value:
 *   Show icon text <BOOL>
 *
 * Example:
 *   ["interfaceID"] call ace_bft_devices_fnc_toggleIconText;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_showIconText"];

params ["_interfaceID"];

_showIconText = !([_interfaceID,"showIconText"] call FUNC(getSettings));
[_interfaceID,[["showIconText",_showIconText]]] call FUNC(setSettings);

_showIconText