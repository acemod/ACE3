#include "..\script_component.hpp"
/*
 * Author: veteran29
 * Handle placement of punji trap object.
 *
 * Arguments:
 * 0: Punji trap <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [trap] call ace_compat_sog_fnc_handlePunjiTrapPlace
 *
 * Public: No
 */

params ["_trap"];

if (isServer && {_trap isKindOf QEXPLOSIVES_PLACE(punji_03)}) exitWith {

    private _spikes = createSimpleObject ["vn\weapons_f_vietnam\mines\punji\vn_mine_punji_03_ammo", [0,0,0]];
    _spikes animateSource ["mine_trigger_source", 0.1];

    private _offset = [0.0655, -0.0357, 0.0906];
    _spikes attachTo [_trap, _offset];
    _trap setVariable [QGVAR(spikes), _spikes];

    _trap addEventHandler ["Deleted", {
        params ["_trap"];
        deleteVehicle (_trap getVariable [QGVAR(spikes), objNull]);
    }];
};
