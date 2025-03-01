#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Sets the flag texture of the flag carrier depending on the linked item to it.
 *
 * Arguments:
 * 0: Flag pole <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [_this] call ace_flags_fnc_setFlagTexture
 *
 * Public: No
 */

params ["_flag"];

private _carrierClass = typeOf _flag;
private _item = GVAR(carrierItemMapping) getOrDefault [_carrierClass, ""];
if (_item isEqualTo "") exitWith {ERROR_1("Cannot set flag texture. No linked item for carrier %1.",_carrierClass)};
(GVAR(flagItemCache) get _item) params ["", "_texture"];

_flag setFlagTexture _texture;
