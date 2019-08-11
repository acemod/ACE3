#include "script_component.hpp"
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
params ["_vehicle"];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;
if !(isNumber (_config >> QGVAR(enabled))) then {
    ["%1 has not been configured for ACE_Fastroping.", getText (_config >> "DisplayName")] call BIS_fnc_error;
} else {
    if (getNumber (_config >> QGVAR(enabled)) == 2) then {
        private _fries = (getText (_config >> QGVAR(friesType))) createVehicle [0, 0, 0];
        _fries attachTo [_vehicle, (getArray (_config >> QGVAR(friesAttachmentPoint)))];
        _vehicle setVariable [QGVAR(FRIES), _fries, true];

        _vehicle addEventHandler ["Killed", FUNC(unequipFRIES)];
        _vehicle addEventHandler ["Deleted", FUNC(unequipFRIES)];
    };
};
