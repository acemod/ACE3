#include "script_component.hpp";

params ["_object", "_pos", "_sensorLookVector", "_sensorLookAngle", "_range", "_sensorMisc"];
_sensorMisc params ["_launchUnit", "_launchWeapon", "_pilotCam", "_launchPos"];

if (isNil "_launchUnit") then {
    _sensorMisc set [0, _object]; // _launchUnit;
};
if (isNil "_launchWeapon") then {
    _sensorMisc set [1, currentWeapon _launchUnit];
};
if (isNil "_pilotCam") then {
    _sensorMisc set [2, false];
};
if (_object != _launchUnit && {isNil "_launchPos"}) then {
    _sensorMisc set [3, _pos]; // _launchPos
};

private _sensorVector = [_launchUnit weaponDirection _launchWeapon,_launchUnit vectorModelToWorld getPilotCameraDirection _launchUnit] select _pilotCam;

{
    _x params ["_countermeasureObject", "_type", "_enabled", "_mempoint", "_offset", "_direction", "_angle", "_misc"];
    private _countermeasurePos = _countermeasureObject modelToWorldVisualWorld [0, 0, 0];
    if (
        _type == "SACLOS" && //appropriate type
        {((_launchPos vectorFromTo _countermeasurePos) vectorDotProduct (_sensorVector)) < _sensorLookAngle} && //countermeasure location can be seen by sensor
        {acos ( (_countermeasurePos vectorFromTo _pos) vectorDotProduct (_countermeasureObject vectorModelToWorldVisual _direction) ) <= _angle} && //countermeasure pointing the right way
        {[_pos, _countermeasureObject, _object] call FUNC(checkLOS)} //checks Line of Sight to target
    ) then {
        _targetsList pushback [_x, _counterMeasurePos, ( (_pos vectorFromTo _countermeasurePos) vectorDotProduct _sensorLookVector ), (_pos distance _countermeasurePos)/3];
    };
} forEach GVAR(countermeasures);

