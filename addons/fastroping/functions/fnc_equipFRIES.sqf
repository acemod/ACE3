#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Equips the given helicopter with a FRIES.
 *
 * Arguments:
 * 0: The helicopter <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call ace_fastroping_fnc_equipFRIES
 *
 * Public: Yes
 */

[{
    params ["_vehicle"];

    if (!alive _vehicle) exitWith { WARNING_1("bad vehicle %1",_this); };
    if (alive (_vehicle getVariable [QGVAR(FRIES),objNull])) exitWith { WARNING_1("already equiped %1",_this); };

    private _config = configOf _vehicle;
    if !(isNumber (_config >> QGVAR(enabled))) then {
        ["%1 has not been configured for ACE_Fastroping.", getText (_config >> "displayName")] call BIS_fnc_error;
    } else {
        if (getNumber (_config >> QGVAR(enabled)) == 2) then {
            private _fries = (getText (_config >> QGVAR(friesType))) createVehicle [0, 0, 0];
            _fries attachTo [_vehicle, getArray (_config >> QGVAR(friesAttachmentPoint))];
            _vehicle setVariable [QGVAR(FRIES), _fries, true];
        };
    };
}, _this] call CBA_fnc_execNextFrame;
