#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Gets the distance to the nearest detectable object.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Mine detector <STRING>
 * 2: Mine detector config <ARRAY>
 *
 * Return Value:
 * <ARRAY>
 * 0: If mine was detected <BOOL>
 * 1: Detected mine <OBJECT>
 * 2: Distance to mine <NUMBER>
 *
 * Example:
 * [player, currentWeapon player, (currentWeapon player) call ace_minedetector_fnc_getDetectorConfig] call ace_minedetector_fnc_getDetectedObject
 *
 * Public: No
 */

params ["_unit", "_detectorType", "_detectorConfig"];
_detectorConfig params ["_detectorPosition", "_radius"];

private _worldPosition = _unit modelToWorld (_unit selectionPosition "granat");

// Move _detectorPosition along the direction vector of the unit's weapon
private _detectorPointAGL = _worldPosition vectorAdd (([_detectorPosition] matrixMultiply ((_unit weaponDirection _detectorType) call EFUNC(common,createOrthonormalReference))) select 0);
private _nearestObjects = nearestObjects [_detectorPointAGL, [], _radius];

#ifdef DEBUG_MODE_FULL
GVAR(debugDetector) = [_detectorPointAGL, _nearestObjects];
#endif

private _detectableClasses = uiNamespace getVariable QGVAR(detectableClasses);
private _index = _nearestObjects findIf {(typeOf _x) in _detectableClasses && {(getModelInfo _x) select 0 != "empty.p3d"}};

// Not found
if (_index == -1) then {
    [false, objNull, -1] // return
} else {
    private _mine = _nearestObjects select _index;

    // Found
    [true, _mine, _detectorPointAGL distance _mine] // return
};
