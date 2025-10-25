#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Starts the setup process for the passed explosive. Player only.
 *
 * Arguments:
 * 0: Target (not used) <OBJECT>
 * 1: Unit <OBJECT> (default: objNull)
 * 2: Magazine classname of explosive to place <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [objNull, player, "SatchelCharge_Remote_Mag"] call ace_explosives_fnc_setupExplosive
 *
 * Public: Yes
 */

#define TEST_LENGTH 0.1
#define PLACE_RANGE_MAX 1
#define PLACE_RANGE_MIN 0.025

params ["", ["_unit", objNull, [objNull]], ["_magClassname", "", [""]]];
TRACE_2("params",_unit,_magClassname);

if (!alive _unit || {_magClassname == ""}) exitWith {};

// Get setup object vehicle and model
private _configMagazine = configFile >> "CfgMagazines" >> _magClassname;
private _setupObjectClass = getText (_configMagazine >> QGVAR(setupObject));

if (!isClass (configFile >> "CfgVehicles" >> _setupObjectClass)) exitWith {
    ERROR("Bad Vehicle");
};

private _p3dModel = getText (configFile >> "CfgVehicles" >> _setupObjectClass >> "model");

 // "" will crash game!
if (_p3dModel == "") exitWith {
    ERROR("No Model");
};

[_unit, "forceWalk", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);

// Show mouse buttons
[LLSTRING(PlaceAction), LELSTRING(common,Cancel), LLSTRING(ScrollAction)] call EFUNC(interaction,showMouseHint);
_unit setVariable [QGVAR(placeActionEH), [_unit, "DefaultAction", {true}, {GVAR(placeAction) = PLACE_APPROVE}] call EFUNC(common,AddActionEventHandler)];
_unit setVariable [QGVAR(cancelActionEH), [_unit, "zoomtemp", {true}, {GVAR(placeAction) = PLACE_CANCEL}] call EFUNC(common,AddActionEventHandler)];

// Display to show virtual object
(QGVAR(virtualAmmo) call BIS_fnc_rscLayer) cutRsc [QGVAR(virtualAmmo), "PLAIN", 0, false];
((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlSetModel _p3dModel;

// Make sure it has a trigger that works when attached (e.g. no tripwires that only do pressurePlate)
private _supportedTriggers = getArray (_configMagazine >> "ACE_Triggers" >> "SupportedTriggers");
private _aceTriggers = configFile >> "ACE_Triggers";
private _isAttachable = _supportedTriggers findIf {(getNumber (_aceTriggers >> _x >> "isAttachable")) == 1} != -1;

GVAR(pfeh_running) = true;
GVAR(placeAction) = PLACE_WAITING;
GVAR(TweakedAngle) = 0;

[{
    BEGIN_COUNTER(pfeh);

    disableSerialization;

    params ["_args", "_pfhID"];
    _args params ["_unit", "_magClassname", "_setupObjectClass", "_isAttachable"];

    private _lookDirVector = ((positionCameraToWorld [0, 0, 0]) call EFUNC(common,positionToASL)) vectorFromTo ((positionCameraToWorld [0, 0, 10]) call EFUNC(common,positionToASL));
    private _basePosASL = eyePos _unit;

    // If external, show explosive over the right shoulder
    if (cameraView == "EXTERNAL") then {
        _basePosASL = _basePosASL vectorAdd ((positionCameraToWorld [0.3, 0, 0]) vectorDiff (positionCameraToWorld [0, 0, 0]));
    };

    if ((stance _unit) == "PRONE") then {
        // If prone, lower base and increase up angle of look - Makes it much easier to attach to underside of vehicles
        _basePosASL vectorAdd [0, 0, -0.3];
        _lookDirVector = ((positionCameraToWorld [0, 0, 0]) call EFUNC(common,positionToASL)) vectorFromTo ((positionCameraToWorld [0, 3, 10]) call EFUNC(common,positionToASL));
    };

    private _cameraAngle = (_lookDirVector select 0) atan2 (_lookDirVector select 1);

    private _testPositionIsValid = {
        private _testBase = _basePosASL vectorAdd (_lookDirVector vectorMultiply _this);
        private _return = true;

        {
            private _testPos = _testBase vectorAdd [(_x select 0) * (cos _cameraAngle), (_x select 0) * (sin _cameraAngle), _x select 1];
            #ifdef DEBUG_MODE_FULL
            drawLine3D [(eyePos _unit) call EFUNC(common,ASLToPosition), _testPos call EFUNC(common,ASLToPosition), [1, 0, 0, 1]];
            #endif

            if ((lineIntersectsSurfaces [eyePos _unit, _testPos, _unit]) isNotEqualTo []) exitWith {
                _return = false;
            };
        } forEach [[0, 0], [-TEST_LENGTH, -TEST_LENGTH], [TEST_LENGTH, -TEST_LENGTH], [-TEST_LENGTH, TEST_LENGTH], [TEST_LENGTH, TEST_LENGTH]];

        _return
    };

    private _distanceFromBase = PLACE_RANGE_MAX;
    private _badPosition = !(_distanceFromBase call _testPositionIsValid);
    private _attachVehicle = objNull;

    if (_isAttachable && _badPosition) then {
        private _testBase = _basePosASL vectorAdd _lookDirVector;

        {
            private _testPos = _testBase vectorAdd [(_x select 0) * (cos _cameraAngle), (_x select 0) * (sin _cameraAngle), _x select 1];
            private _intersectObject = ((lineIntersectsSurfaces [eyePos _unit, _testPos, _unit]) param [0, objNull]) param [3, objNull];

            if (!isNull _intersectObject) exitWith {
                _attachVehicle = _intersectObject;
            };
        } forEach [[0, 0], [-TEST_LENGTH, -TEST_LENGTH], [TEST_LENGTH, -TEST_LENGTH], [-TEST_LENGTH, TEST_LENGTH], [TEST_LENGTH, TEST_LENGTH]];

        if (
            !isNull _attachVehicle &&
            {(_attachVehicle isKindOf "Car") || {_attachVehicle isKindOf "Tank"} || {_attachVehicle isKindOf "Air"} || {_attachVehicle isKindOf "Ship"}} &&
            {PLACE_RANGE_MIN call _testPositionIsValid}
        ) then {
            private _min = PLACE_RANGE_MIN;
            private _max = PLACE_RANGE_MAX;

            for "_index" from 0 to 6 do {
                _distanceFromBase = (_min + _max) / 2;

                if (_distanceFromBase call _testPositionIsValid) then {
                    _min = _distanceFromBase;
                } else {
                    _max = _distanceFromBase;
                };
            };

            _badPosition = false;
            _distanceFromBase = ((_min + _max) / 2 + 0.075) min 1;
        } else {
            _attachVehicle = objNull;
        };
    };

    private _virtualPosASL = _basePosASL vectorAdd (_lookDirVector vectorMultiply _distanceFromBase);

    // Update mouse hint
    private _ctrlTextLMB = (uiNamespace getVariable [QEGVAR(interaction,mouseHint), displayNull]) displayCtrl 2420;

    if (_badPosition) then {
        _ctrlTextLMB ctrlSetText LLSTRING(BlockedAction);
    } else {
        _ctrlTextLMB ctrlSetText localize ([LSTRING(AttachAction), LSTRING(PlaceAction)] select (isNull _attachVehicle));
    };

    private _terrainHeightASL = getTerrainHeightASL _virtualPosASL;

    // Don't allow Placing below terrain
    if (_terrainHeightASL > (_virtualPosASL select 2)) then {
        _virtualPosASL set [2, _terrainHeightASL];
    };

    // Don't allow placing in a bad position
    if (_badPosition && {GVAR(placeAction) == PLACE_APPROVE}) then {
        GVAR(placeAction) = PLACE_WAITING;
    };

    if (_unit != ACE_player ||
        {!([_unit, objNull, ["isNotSwimming"]] call EFUNC(common,canInteractWith))} ||
        {!([_unit, _magClassname] call EFUNC(common,hasMagazine))}
    ) then {
        GVAR(placeAction) = PLACE_CANCEL;
    };

    if (GVAR(placeAction) != PLACE_WAITING) then {
        _pfhID call CBA_fnc_removePerFrameHandler;

        GVAR(pfeh_running) = false;

        [_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
        [_unit, "blockThrow", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

        [] call EFUNC(interaction,hideMouseHint);

        [_unit, "DefaultAction", _unit getVariable [QGVAR(placeActionEH), -1]] call EFUNC(common,removeActionEventHandler);
        [_unit, "zoomtemp", _unit getVariable [QGVAR(cancelActionEH), -1]] call EFUNC(common,removeActionEventHandler);

        (QGVAR(virtualAmmo) call BIS_fnc_rscLayer) cutText ["", "PLAIN"];

        if (GVAR(placeAction) == PLACE_APPROVE) then {
            private _placeAngle = 0;
            private _expSetupVehicle = _setupObjectClass createVehicle [0, 0, 0]; //(_virtualPosASL call EFUNC(common,ASLToPosition));

            TRACE_1("Planting Mass",getMass _expSetupVehicle);

            // If the object is too heavy, it can kill a player if it collides
            if (getMass _expSetupVehicle > 5) then {
                _expSetupVehicle setMass 5;
            };

            if (isNull _attachVehicle) then {
                _placeAngle = _cameraAngle - GVAR(tweakedAngle) + 180;
                _expSetupVehicle setDir _placeAngle;
                _expSetupVehicle setPosASL _virtualPosASL;
                _placeAngle = _placeAngle + 180; // CfgAmmos seem to be 180 for some reason
            } else {
                private _modelOffset = _attachVehicle worldToModel (_virtualPosASL call EFUNC(common,ASLToPosition));
                _placeAngle = _cameraAngle - (getDir _attachVehicle) + 180;
                _expSetupVehicle attachTo [_attachVehicle, _modelOffset];
                _expSetupVehicle setVectorDirAndUp [[0, 0, -1], [sin _placeAngle, cos _placeAngle, 0]];
            };

            TRACE_1("Place angle",_placeAngle);

            _expSetupVehicle setVariable [QGVAR(class), _magClassname, true];
            _expSetupVehicle setVariable [QGVAR(direction), _placeAngle, true];

            [_unit, _magClassname] call EFUNC(common,adjustMagazineAmmo);
            [_unit, "PutDown"] call EFUNC(common,doGesture);
            _unit setVariable [QGVAR(plantingExplosive), true];
            [{_this setVariable [QGVAR(plantingExplosive), false]}, _unit, 1.5] call CBA_fnc_waitAndExecute;

            // API
            [QGVAR(setup), [_expSetupVehicle, _magClassname, _unit]] call CBA_fnc_globalEvent;
        };
    } else {
        private _screenPos = worldToScreen (_virtualPosASL call EFUNC(common,ASLToPosition));

        if (_badPosition || {_screenPos isEqualTo []}) then {
            ((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlShow false;
        } else {
            private _display = uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull];

            // Show the model on the hud in aprox the same size/location as it will be placed
            (_display displayCtrl 800851) ctrlShow true;

            private _realDistance = ((_virtualPosASL call EFUNC(common,ASLToPosition)) distance (positionCameraToWorld [0, 0, 0])) / ((call CBA_fnc_getFov) select 1);
            _screenPos = [_screenPos select 0, _realDistance, _screenPos select 1];
            (_display displayCtrl 800851) ctrlSetPosition _screenPos;

            private _modelDir = [0, 0, -1];
            private _modelUp = [0, -1, 0];

            if (isNull _attachVehicle) then {
                private _angle = acos (_lookDirVector select 2);
                _modelUp = [0, cos _angle, sin _angle];
                _modelDir = [cos GVAR(tweakedAngle), sin GVAR(tweakedAngle), 0] vectorCrossProduct _modelUp;
            };

            (_display displayCtrl 800851) ctrlSetModelDirAndUp [_modelDir, _modelUp];
        };
    };

    END_COUNTER(pfeh);
}, 0, [_unit, _magClassname, _setupObjectClass, _isAttachable]] call CBA_fnc_addPerFrameHandler;

nil
