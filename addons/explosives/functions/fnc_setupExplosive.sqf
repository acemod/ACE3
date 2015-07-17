/*
 * Author: Garth 'L-H' de Wet
 * Starts the setup process for the passed explosive. Player only.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player Unit <OBJECT>
 * 2: Classname of explosive to place. (CfgMagazine class) <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "SatchelCharge_Remote_Mag"] call ACE_Explosives_fnc_SetupExplosive;
 *
 * Public: Yes
 */
#define ENABLE_PERFORMANCE_COUNTERS
#include "script_component.hpp"

PARAMS_3(_vehicle,_unit,_magClassname);

[_unit, "ACE_Explosives", true] call EFUNC(common,setForceWalkStatus);

//Get setup object vehicle and model:
_setupObjectClass = getText(ConfigFile >> "CfgMagazines" >> _magClassname >> "ACE_SetupObject");
if (!isClass (configFile >> "CfgVehicles" >> _setupObjectClass)) exitWith {ERROR("Bad Vehicle");};
_p3dModel = getText (configFile >> "CfgVehicles" >> _setupObjectClass >> "model");
if (_p3dModel == "") exitWith {ERROR("No Model");}; //"" - will crash game!

//Show mouse buttons:
[localize LSTRING(PlaceAction), localize LSTRING(CancelAction), localize LSTRING(ScrollAction)] call EFUNC(interaction,showMouseHint);
_unit setVariable [QGVAR(placeActionEH), [_unit, "DefaultAction", {true}, {GVAR(placeAction) = PLACE_APPROVE;}] call EFUNC(common,AddActionEventHandler)];
_unit setVariable [QGVAR(cancelActionEH), [_unit, "zoomtemp", {true}, {GVAR(placeAction) = PLACE_CANCEL;}] call EFUNC(common,AddActionEventHandler)];

//Display to show virtual object:
(QGVAR(virtualAmmo) call BIS_fnc_rscLayer) cutRsc [QGVAR(virtualAmmo), "PLAIN", 0, false];
((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlSetModel _p3dModel;

//Make sure it has a trigger that works when attached (eg, no tripwires that only do pressurePlate)
_isAttachable = false;
_supportedTriggers = getArray (configFile >> "CfgMagazines" >> _magClassname >> "ACE_Triggers" >> "SupportedTriggers");
{
    if ((getNumber (configFile >> "ACE_Triggers" >> _x >> "isAttachable")) == 1) exitWith {_isAttachable = true;};
} forEach _supportedTriggers;


GVAR(pfeh_running) = true;
GVAR(placeAction) = PLACE_WAITING;
GVAR(TweakedAngle) = 0;

[{
    BEGIN_COUNTER(pfeh);

    PARAMS_2(_args,_pfID);
    EXPLODE_4_PVT(_args,_unit,_magClassname,_setupObjectClass,_isAttachable);

    _lookDirVector = (positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [0,0,1]);
    _cameraAngle = (_lookDirVector select 0) atan2 (_lookDirVector select 1);

    _basePosASL = (eyePos _unit);
    if (cameraView == "EXTERNAL") then {
        _basePosASL = _basePosASL vectorAdd ((positionCameraToWorld [0.3,0,0]) vectorDiff (positionCameraToWorld [0,0,0]));
    };

    _testPositionIsValid = {
        _testDistance = _this select 0;
        _testBase = _basePosASL vectorAdd (_lookDirVector vectorMultiply _testDistance);
        _return = true;
        {
            _testPos = _testBase vectorAdd [0.1 * (_x select 0) * (cos _cameraAngle), 0.1 * (_x select 0) * (sin _cameraAngle), 0.1 * (_x select 1)];
            drawLine3d [(eyePos _unit) call EFUNC(common,ASLToPosition), (_testPos) call EFUNC(common,ASLToPosition), [1,0,0,1]];
            if (lineIntersects [eyePos _unit, _testPos, _unit]) exitWith {_return = false;};
        } forEach [[0,0], [-1,-1], [1,-1], [-1,1], [1,1]];
        _return
    };

    _distanceFromBase = 1;
    _badPosition = !([_distanceFromBase] call _testPositionIsValid);
    _attachVehicle = objNull;


    if (_isAttachable && _badPosition) then {
        _attachVehicle = objNull;
        _testBase = _basePosASL vectorAdd _lookDirVector;
        {
            _testPos = _testBase vectorAdd [0.1 * (_x select 0) * (cos _cameraAngle), 0.1 * (_x select 0) * (sin _cameraAngle), 0.1 * (_x select 1)];
            _intersectsWith = lineIntersectsWith [eyePos _unit, _testPos, _unit];
            if (count _intersectsWith == 1) exitWith {_attachVehicle = (_intersectsWith select 0);};
        } forEach [[0,0], [-1,-1], [1,-1], [-1,1], [1,1]];
        if ((!isNull _attachVehicle) && {[0.05] call _testPositionIsValid} &&
                {(_attachVehicle isKindOf "Car") || {_attachVehicle isKindOf "Tank"} || {_attachVehicle isKindOf "Air"} || {_attachVehicle isKindOf "Ship"}}) then {
            _min = 0.05;
            _max = 1;
            for "_index" from 0 to 6 do {
                _distanceFromBase = (_min + _max) / 2;
                if ([_distanceFromBase] call _testPositionIsValid) then {
                    _min = _distanceFromBase;
                } else {
                    _max = _distanceFromBase;
                };
            };
            _badPosition = false;
            _distanceFromBase = ((_min + _max) / 2 + 0.075) min 1;
            systemChat format ["Attaching to %1 dist %2", _attachVehicle, _distanceFromBase];
        } else {
            _attachVehicle = objNull;
        };
    };

    _virtualPosASL = _basePosASL vectorAdd (_lookDirVector vectorMultiply _distanceFromBase);
    //Don't allow Placing bellow terrain
    if ((getTerrainHeightASL _virtualPosASL) > (_virtualPosASL select 2)) then {
        _virtualPosASL set [2, (getTerrainHeightASL _virtualPosASL)];
    };

    //Don't allow placing in a bad position:
    if (_badPosition && {GVAR(placeAction) == PLACE_APPROVE}) then {GVAR(placeAction) = PLACE_WAITING;};

    //Cancel on RMB, For some reason this works (when held) but AddActionEventHandler doesn't
    if ((inputAction "zoomTemp") > 0) then {GVAR(placeAction) = PLACE_CANCEL;};

    if ((GVAR(placeAction) != PLACE_WAITING) ||
            {_unit != ACE_player})            then {

        [_pfID] call CBA_fnc_removePerFrameHandler;
        GVAR(pfeh_running) = false;

        [_unit, "ACE_Explosives", false] call EFUNC(common,setForceWalkStatus);
        [] call EFUNC(interaction,hideMouseHint);
        [_unit, "DefaultAction", (_unit getVariable [QGVAR(placeActionEH), -1])] call EFUNC(common,removeActionEventHandler);
        [_unit, "zoomtemp", (_unit getVariable [QGVAR(cancelActionEH), -1])] call EFUNC(common,removeActionEventHandler);

        (QGVAR(virtualAmmo) call BIS_fnc_rscLayer) cutText ["", "PLAIN"];

        if (GVAR(placeAction) == PLACE_APPROVE) then {
            systemChat format ["place %1 - %2", _virtualPosASL, aslToAtl _virtualPosASL];;
            _placeAngle = 0;
            _expSetupVehicle = _setupObjectClass createVehicle (_virtualPosASL call EFUNC(common,ASLToPosition));
            if (isNull _attachVehicle) then {
                _placeAngle = _cameraAngle - GVAR(TweakedAngle) + 180;
                _expSetupVehicle setPosAsl _virtualPosASL;
                _expSetupVehicle setDir _placeAngle;
                _placeAngle = _placeAngle + 180; //CfgAmmos seem to be 180 for some reason
            } else {
                _modelOffset = _attachVehicle worldToModel (_virtualPosASL call EFUNC(common,ASLToPosition));
                _placeAngle = _cameraAngle - (getDir _attachVehicle) + 180;
                _expSetupVehicle attachTo [_attachVehicle, _modelOffset];
                _expSetupVehicle setVectorDirAndUp [[0,0,-1],[(sin _placeAngle),(cos _placeAngle),0]];
            };

            systemChat format ["Place angel %1", _placeAngle];

            _expSetupVehicle setVariable [QGVAR(class), _magClassname, true];
            _expSetupVehicle setVariable [QGVAR(Direction), _placeAngle, true];

            _unit removeMagazine _magClassname;
            _unit playActionNow "PutDown";
            _unit setVariable [QGVAR(PlantingExplosive), true];
            [{_this setVariable [QGVAR(PlantingExplosive), false]}, _unit, 1.5] call EFUNC(common,waitAndExecute);

            x3 = _expSetupVehicle;
            systemChat format ["Mass %1", getMass _expSetupVehicle];
            // x3 setMass 1;
        };
    } else {
        _screenPos = worldToScreen (_virtualPosASL call EFUNC(common,ASLToPosition));
        if (_badPosition || {_screenPos isEqualTo []}) then {
            ((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlShow false;
        } else {
            ((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlShow true;

            _realDistance = ((_virtualPosASL call EFUNC(common,ASLToPosition)) distance (positionCameraToWorld [0,0,0])) / ((call CBA_fnc_getFov) select 1);
            _screenPos = [(_screenPos select 0), _realDistance, (_screenPos select 1)];
            ((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlSetPosition _screenPos;

            _modelDir = [0,0,-1];
            _modelUp = [0,-1,0];
            if (isNull _attachVehicle) then {
                _angle = acos (_lookDirVector select 2);
                _modelUp = [0, (cos _angle), (sin _angle)];
                _modelDir = [cos GVAR(TweakedAngle), sin GVAR(TweakedAngle), 0] vectorCrossProduct _modelUp;
            };
            // systemChat format ["Running %1 [%2]", [_modelDir, _modelUp], _attachVehicle];
            ((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlSetModelDirAndUp [_modelDir, _modelUp];
        };
    };

    END_COUNTER(pfeh);
}, 0, [_unit, _magClassname, _setupObjectClass, _isAttachable]] call CBA_fnc_addPerFrameHandler;
