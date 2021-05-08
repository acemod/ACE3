#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Attaches a launch suitcase to a control box
 *
 * Arguments:
 * 0: Suitcase <OBJECT>
 * 1: Control Box <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, obj2] call ace_malyutka_fnc_attachPlug
 *
 * Public: No
 */
params ["_suitcase", "_controlBox"];

private _statuses = _controlBox getVariable QGVAR(plugStatus);
private _availableIndex = _statuses findIf { _x isEqualTo objNull };
if (_availableIndex >= 0) then {
    _statuses set [_availableIndex, _suitcase];
    _controlBox setVariable [QGVAR(plugStatus), _statuses, true];

    private _plug = _suitcase getVariable QGVAR(plugHeader);
    _plug attachTo [_controlBox, [0, 0, 0], format ["plug_%1", _availableIndex + 1]];
    _plug setVariable [QGVAR(attachedControlBox), _controlBox, true];
    _suitcase setVariable [QGVAR(attachedToPlugNumber), _availableIndex, true];

    if (someAmmo _suitcase) then {
        private _currentAmmoState = (_controlBox getVariable QGVAR(vehicleAmmo)) + 1;
        _controlBox setVariable [QGVAR(vehicleAmmo), _currentAmmoState, true];
        
        // can only hold 4 missiles at a time, so we multiply by 1/4 to get correct ammo
        _controlBox setVehicleAmmo (_currentAmmoState * 0.25);
    };

    // transfer locality so missileguidance works
    if !(local gunner _controlBox) then {
        private _gunnerID = ((gunner _controlBox) getVariable [QEGVAR(common,playerOwner), CBA_clientID]);
        ["ace_setOwner", [_suitcase, _gunnerID]] call CBA_fnc_serverEvent;
        _suitcase setVariable [QGVAR(owner), _unit];
    };
} else {
    // how did we get here?
    WARNING_2("Managed to attach plug to a full control box",_availableIndex,_statuses);
};

