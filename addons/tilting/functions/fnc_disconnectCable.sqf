/*
 * Author: GitHawk
 * Disconnects the tilt cable.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_tilting_fnc_disconnectCable
 *
 * Public: no
 */
#include "script_component.hpp"

[2, _this, {
    [_this select 0] call FUNC(cancelConnect);
    [LSTRING(SuccessDisconnecting), 2] call EFUNC(common,displayTextStructured);
}, {
    [LSTRING(FailedDisconnecting)] call EFUNC(common,displayTextStructured);
}, localize LSTRING(Disconnecting)] call EFUNC(common,progressBar);
