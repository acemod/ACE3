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
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];
private ["_config", "_fries"];

_config = configFile >> "CfgVehicles" >> typeOf _vehicle;
if !(isNumber (_config >> QGVAR(enabled))) then {
    ["%1 has not been configured for ACE_Fastroping.", getText (_config >> "DisplayName")] call BIS_fnc_error;
} else {
    if (getNumber (_config >> QGVAR(enabled)) == 2) then {
        _fries = (getText (_config >> QGVAR(friesType))) createVehicle [0, 0, 0];
        _fries attachTo [_vehicle, (getArray (_config >> QGVAR(friesAttachmentPoint)))];
        _vehicle setVariable [QGVAR(FRIES), _fries, true];
        _vehicle addEventHandler ["Killed", {
            params ["_vehicle"];
            deleteVehicle (_vehicle getVariable [QGVAR(FRIES), objNull]);
            _vehicle setVariable [QGVAR(FRIES), nil, true];

            if !((_vehicle getVariable [QGVAR(deployedRopes), []] isEqualTo [])) then {
                [_vehicle] call FUNC(cutRopes);
            };
        }];
        [FUNC(checkVehicleThread), [_vehicle, _fries], 5] call CBA_fnc_waitAndExecute;
    };
};
