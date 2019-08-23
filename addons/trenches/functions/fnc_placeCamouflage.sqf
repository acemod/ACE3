#include "script_component.hpp"
/*
 * Author: chris579, Salbei
 * Places camouflage on a trench.
 *
 * Arguments:
 * 0: Trench <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj, Unit] call ace_trenches_fnc_placeCamouflage
 *
 * Public: No
 */

params [
    ["_trench", objnull, [objnull]],
    ["_unit", objnull, [objnull]]
];

if (isNull _trench || {count getArray (configFile >> "CfgWorldTexture" >> worldName >> "camouflageObjects") == 0}) exitWith {};

private _fnc_onFinish = {
    (_this select 0) params ["_unit", "_trench"];

    private _camouflageObjects = getArray (configFile >> "CfgWorldTexture" >> worldName >> "camouflageObjects");
    private _statusNumber = _trench getVariable [QGVAR(trenchCamouflageStatus), 0];
    _statusNumber = _statusNumber +1;
    private _statusString = str _statusNumber;

    private _placedObjects = [];
    private _camouflageObjectsArray = _trench getVariable [QGVAR(camouflageObjects), []];

    {
        private _object = createSimpleObject [selectRandom _camouflageObjects, [0,0,0]];
        _object attachTo [_trench, getArray _x];

        if (is3DEN) then {
            _object setVariable [QGVAR(positionData), getArray _x,true];
        };

        _placedObjects pushBack _object;
    } forEach (configProperties [configFile >> "CfgVehicles" >> (typeof _trench) >> ("CamouflagePositions" + _statusString)]);

    // pushFront
    reverse _camouflageObjectsArray;
    _camouflageObjectsArray pushBack _placedObjects;
    reverse _camouflageObjectsArray;

    _trench setVariable [QGVAR(camouflageObjects), _camouflageObjectsArray, true];
    _trench setVariable [QGVAR(trenchCamouflageStatus), _statusNumber];

    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
};

private _fnc_onFailure = {
    (_this select 0) params ["_unit"];
    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
};

if (isNull _unit) exitWith {
    [[objnull, _trench]] call _fnc_onFinish;
};

[CAMOUFLAGE_DURATION, [_unit, _trench], _fnc_onFinish, _fnc_onFailure, localize LSTRING(placeCamouflageProgress)] call ace_common_fnc_progressBar;

[_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call EFUNC(common,doAnimation);
