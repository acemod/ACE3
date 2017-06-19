/*
 * Author: BaerMitUmlaut
 * Auomatically deploy a helicopter filled with AI units.
 *
 * Arguments:
 * 0: The helicopter <OBJECT>
 * 1: Deploy special roles (gunners, copilot) (default: false) <BOOL>
 * 2: Create deployment group (default: true) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call ace_fastroping_fnc_deployAI
 *
 * Public: Yes
 */

#include "script_component.hpp"
params [["_vehicle", objNull, [objNull]], ["_deploySpecial", false, [true]], ["_createDeploymentGroup", true, [true]]];
private ["_config", "_configEnabled", "_deployTime", "_unitsToDeploy", "_deployGroup"];

if (isNull _vehicle || {!(_vehicle isKindOf "Helicopter")}) exitWith {
    if (hasInterface) then {
        // Note: BIS_fnc_guiMessage causes a CTD with call, so spawn is used instead.
        ["deployAI was called with an invalid or non-existant vehicle.", QFUNC(deployAI)] spawn BIS_fnc_guiMessage;
    };
    ERROR('FUNC(deployAI): deployAI was called with an invalid or non-existant vehicle.');
};

_config = configFile >> "CfgVehicles" >> typeOf _vehicle;
_configEnabled = getNumber (_config >> QGVAR(enabled));
if (_configEnabled == 0) exitWith {
    if (hasInterface) then {
        [format ["You cannot fast rope from a ""%1"" helicopter.", getText (_config >> "DisplayName")], QFUNC(deployAI)] spawn BIS_fnc_guiMessage;
    };
    ERROR_1('FUNC(deployAI): You cannot fast rope from a "%1" helicopter.',getText (_config >> "DisplayName"));
};

if (_configEnabled == 2 && {isNull (_vehicle getVariable [QGVAR(FRIES), objNull])}) exitWith {
    if (hasInterface) then {
        [format ["""%1"" requires a FRIES for fastroping, but has not been equipped with one.", getText (_config >> "DisplayName")], QFUNC(deployAI)] spawn BIS_fnc_guiMessage;
    };
    ERROR_1('FUNC(deployAI): "%1" requires a FRIES for fastroping but has not been equipped with one.',getText (_config >> "DisplayName"));
};

_unitsToDeploy = crew _vehicle;
if (_deploySpecial) then {
    _unitsToDeploy deleteAt (_unitsToDeploy find driver _vehicle);
} else {
    _unitsToDeploy = _unitsToDeploy select {(assignedVehicleRole _x) select 0 == "cargo"};
};

if (_unitsToDeploy isEqualTo []) exitWith {
    WARNING_1('FUNC(deployAI): Found no units to deploy in "%1".',getText (_config >> "DisplayName"));
};

if (_createDeploymentGroup) then {
    _deployGroup = createGroup side (_unitsToDeploy select 0);
    _unitsToDeploy joinSilent _deployGroup;
};

_deployTime = 0;
if (getText (_config >> QGVAR(onPrepare)) != "") then {
    _deployTime = [_vehicle] call (missionNamespace getVariable (getText (_config >> QGVAR(onPrepare))));
};
[{[_this] call FUNC(deployRopes)}, _vehicle, _deployTime] call CBA_fnc_waitAndExecute;
driver _vehicle disableAI "MOVE";

DFUNC(deployAIRecursive) = {
    params ["_vehicle", "_unitsToDeploy"];

    private _unit = _unitsToDeploy deleteAt 0;
    unassignVehicle _unit;
    [_unit, _vehicle] call FUNC(fastRope);

    if !(_unitsToDeploy isEqualTo []) then {
        [{
            [{
                params ["_vehicle"];
                private _deployedRopes = _vehicle getVariable [QGVAR(deployedRopes), []];
                ({!(_x select 5)} count (_deployedRopes)) > 0
            }, FUNC(deployAIRecursive), _this] call CBA_fnc_waitUntilAndExecute;
        }, [_vehicle, _unitsToDeploy], 1] call CBA_fnc_waitAndExecute;
    } else {
        [{
            private _deployedRopes = _this getVariable [QGVAR(deployedRopes), []];
            ({_x select 5} count (_deployedRopes)) == 0
        }, {
            [_this] call FUNC(cutRopes);
            driver _this enableAI "MOVE";
        }, _vehicle] call CBA_fnc_waitUntilAndExecute;
    };
};

[FUNC(deployAIRecursive), [_vehicle, _unitsToDeploy], _deployTime + 4] call CBA_fnc_waitAndExecute;
