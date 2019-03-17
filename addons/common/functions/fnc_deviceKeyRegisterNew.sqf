#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Finds next valid index for the device array.
 *
 * Arguments:
 * 0: Localized Device Display Name <STRING>
 * 1: Image <STRING>
 * 2: Condtion Code (do they have the device) <CODE>
 * 3: Toggle Code (on home press) <CODE>
 * 4: Close Code (on ctrl-home press) <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [(localize "STR_ACE_microdagr_itemName"), QPATHTOF(images\microDAGR_item.paa), _conditionCode, _toggleCode, _closeCode] call ace_common_fnc_deviceKeyRegisterNew
 *
 * Public: No
 */

params ["_displayName", "_iconImage", "_conditionCode", "_toggleCode", "_closeCode"];

GVAR(deviceKeyHandlingArray) pushBack [_displayName, _iconImage, _conditionCode, _toggleCode, _closeCode];

[] call FUNC(deviceKeyFindValidIndex);
