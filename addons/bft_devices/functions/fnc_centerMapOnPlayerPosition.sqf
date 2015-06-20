/*
 * Author: Gundy
 *
 * Description:
 *   Center BFT Map on current player position
 *
 * Arguments:
 *   0: Device ID <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["deviceID"] call ace_bft_devices_fnc_centerMapOnPlayerPosition;
 *
 * Public: No
 */

#include "script_component.hpp"

private [];

[_this select 0,[["mapWorldPos",getPosASL vehicle ACE_player]],true,true] call FUNC(setSettings);

true