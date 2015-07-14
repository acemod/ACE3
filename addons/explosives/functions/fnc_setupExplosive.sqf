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
#include "script_component.hpp"

PARAMS_3(_vehicle,_player,_magClassname);

[_player, "ACE_Explosives", true] call EFUNC(common,setForceWalkStatus);
GVAR(TweakedAngle) = 0;

//Get setup object vehicle and model:
_setupObjectClass = getText(ConfigFile >> "CfgMagazines" >> _magClassname >> "ACE_SetupObject");
if (!isClass (configFile >> "CfgVehicles" >> _setupObjectClass)) exitWith {ERROR("Bad Vehicle");};
_p3dModel = getText (configFile >> "CfgVehicles" >> _setupObjectClass >> "model");
if (_p3dModel == "") exitWith {ERROR("No Model");}; //"" - will crash game!

[localize LSTRING(PlaceAction), localize LSTRING(CancelAction), localize LSTRING(ScrollAction)] call EFUNC(interaction,showMouseHint);
_player setVariable [QGVAR(placeActionEH), [_player, "DefaultAction", {true}, {GVAR(placeAction) = PLACE_APPROVE;}] call EFUNC(common,AddActionEventHandler)];
_player setVariable [QGVAR(cancelActionEH), [_player, "zoomtemp", {true}, {GVAR(placeAction) = PLACE_CANCEL;}] call EFUNC(common,AddActionEventHandler)];


//Display to show virtual object:
(QGVAR(virtualAmmo) call BIS_fnc_rscLayer) cutRsc [QGVAR(virtualAmmo), "PLAIN", 0, false];
((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlSetModel _p3dModel;

GVAR(pfeh_running) = true;
GVAR(placeAction) = PLACE_WAITING;


[{
    private["_angle", "_dir", "_screenPos", "_realDistance", "_up", "_virtualPos", "_virtualPosASL", "_badPosition"];

    PARAMS_2(_args,_pfID);
    EXPLODE_3_PVT(_args,_unit,_magClassname,_setupObjectClass);

    _virtualPosASL = (eyePos _unit) vectorAdd (positionCameraToWorld [0,0,1]) vectorDiff (positionCameraToWorld [0,0,0]);
    if (cameraView == "EXTERNAL") then {
        _virtualPosASL = _virtualPosASL vectorAdd ((positionCameraToWorld [0.3,0,0]) vectorDiff (positionCameraToWorld [0,0,0]));
    };
    _virtualPos = _virtualPosASL call EFUNC(common,ASLToPosition);
    _intersectsWith = lineIntersectsWith [eyePos ACE_player, _virtualPosASL, ACE_player];

    hintSilent format ["IntersectsWith %1", _intersectsWith];
    
    _badPosition = (count _intersectsWith) > 0;
    
    //Don't allow placing in a bad position:
    if (_badPosition && {GVAR(placeAction) == PLACE_APPROVE}) then {GVAR(placeAction) = PLACE_WAITING;};

    //Cancel on RMB, For some reason this works (when held) but AddActionEventHandler doesn't
    if ((inputAction "zoomTemp") > 0) then {GVAR(placeAction) = PLACE_CANCEL;};

    if ((GVAR(placeAction) != PLACE_WAITING) ||
            {_unit != ACE_player} ||
            {(inputAction "optics") > 0})            then {

        [_pfID] call CBA_fnc_removePerFrameHandler;
        GVAR(pfeh_running) = false;

        [_unit, "ACE_Explosives", false] call EFUNC(common,setForceWalkStatus);
        [] call EFUNC(interaction,hideMouseHint);
        [_unit, "DefaultAction", (_unit getVariable [QGVAR(placeActionEH), -1])] call EFUNC(common,removeActionEventHandler);
        [_unit, "zoomtemp", (_unit getVariable [QGVAR(cancelActionEH), -1])] call EFUNC(common,removeActionEventHandler);

        (QGVAR(virtualAmmo) call BIS_fnc_rscLayer) cutText ["", "PLAIN"];

        if (GVAR(placeAction) == PLACE_APPROVE) then {
            systemChat "place";
            _dir = (positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [0,0,1]);
            _angle = ((_dir select 0) atan2 (_dir select 1)) - GVAR(TweakedAngle) - 180;

            systemChat format ["Pos %1, Cam %2, Ang %3", _virtualPosASL, ((_dir select 0) atan2 (_dir select 1)), _angle];

            _realObject = _setupObjectClass createVehicle _virtualPos;
            _realObject setPosAsl _virtualPosASL;
            _realObject setDir _angle;
            // [_unit, _attachToVehicle, _itemClassname, _itemVehClass, _onAtachText, _virtualPos] call FUNC(placeApprove);
        };
    } else {
        // systemChat format ["A Running %1 - %2", time, _badPosition];
        //Show the virtual object:
        if (_badPosition) then {
            ((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlShow false;
        } else {
            ((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlShow true;
            _screenPos = worldToScreen _virtualPos;
            if (_screenPos isEqualTo []) exitWith {
                ((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlShow false;
            };
            _realDistance = (_virtualPos distance (positionCameraToWorld [0,0,0])) / ((call CBA_fnc_getFov) select 1);
            _screenPos = [(_screenPos select 0), _realDistance, (_screenPos select 1)];
            ((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlSetPosition _screenPos;
            _dir = (positionCameraToWorld [0,0,1]) vectorFromTo (positionCameraToWorld [0,0,0]);
            _angle = asin (_dir select 2) + 90;

            _modelUp = [0, (cos _angle), (sin _angle)];
            _modelDir = [cos GVAR(TweakedAngle), sin GVAR(TweakedAngle), 0] vectorCrossProduct _modelUp;

            // systemChat format ["Running %1", [_modelDir, _modelUp]];
            ((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlSetModelDirAndUp [_modelDir, _modelUp];
        };
    };
}, 0, [_player, _magClassname, _setupObjectClass]] call CBA_fnc_addPerFrameHandler;












/*


closeDialog 0;
EXPLODE_2_PVT(_this,_unit,_class);
GVAR(placer) = _unit;
// TODO: check MP performance and MP compatible.
GVAR(Setup) = createVehicle [getText(ConfigFile >> "CfgMagazines" >> _class >> "ACE_SetupObject"),[0,0,-10000],[], 0, "NONE"];

GVAR(Setup) enableSimulationGlobal false;
GVAR(Setup) setVariable [QGVAR(class), _class, true];




[QGVAR(Placement),"OnEachFrame", {
    private ["_player", "_pos"];
    _player = ACE_player;
    if (GVAR(placer) != _player) exitWith {
        call FUNC(place_Cancel);
    };
    GVAR(pfeh_running) = true;
    _pos = (ASLtoATL eyePos _player) vectorAdd (positionCameraToWorld [0,0,1] vectorDiff positionCameraToWorld [0,0,0]);
    GVAR(Setup) setPosATL _pos;
    if (ACE_Modifier == 0) then {
        GVAR(Setup) setDir (GVAR(TweakedAngle) + getDir _player);
    };
}] call CALLSTACK(BIS_fnc_addStackedEventHandler);

 */
