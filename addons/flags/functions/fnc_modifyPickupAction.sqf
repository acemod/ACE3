#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Modifies the pickup action to include the flags name in the action.
 *
 * Arguments:
 * 0: Flag pole <OBJECT>
 * 1: Player <OBJECT>
 * 2: Args <ANY>
 * 3: Action Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_target, _player, [], _this select 3] call ace_flags_fnc_modifyPickupAction
 *
 * Public: No
 */

params ["_flag", "", "", "_actionData"];

private _item = GVAR(carrierItemMapping) get (typeOf _flag);
(GVAR(flagItemCache) get _item) params ["_flagName"];

_actionData set [1, format [LLSTRING(Pickup), _flagName]];
