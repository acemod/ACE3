/*
 * Author: eRazeri, esteldunedain, PabstMirror
 * Attach an item to the unit
 *
 * Arguments:
 * 0: vehicle that it will be attached to (player or vehicle) <OBJECT>
 * 1: unit doing the attach (player) <OBJECT>
 * 2: Array containing a string of the attachable item <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, bob, ["light"]] call ace_attach_fnc_attach;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_attachToVehicle","_unit","_args", ["_silentScripted", false]];
_args params [["_itemClassname","", [""]]];
TRACE_4("params",_attachToVehicle,_unit,_itemClassname,_silentScripted);

private ["_itemVehClass", "_onAtachText", "_selfAttachPosition", "_attachedItem", "_tempObject", "_actionID", "_model"];

//Sanity Check (_unit has item in inventory, not over attach limit)
if ((_itemClassname == "") || {(!_silentScripted) && {!(_this call FUNC(canAttach))}}) exitWith {ERROR("Tried to attach, but check failed");};

_itemVehClass = getText (configFile >> "CfgWeapons" >> _itemClassname >> "ACE_Attachable");
_onAtachText = getText (configFile >> "CfgWeapons" >> _itemClassname >> "displayName");

if (_itemVehClass == "") then {
    _itemVehClass = getText (configFile >> "CfgMagazines" >> _itemClassname >> "ACE_Attachable");
    _onAtachText = getText (configFile >> "CfgMagazines" >> _itemClassname >> "displayName");
};

if (_itemVehClass == "") exitWith {ERROR("no ACE_Attachable for Item");};

_onAtachText = format [localize LSTRING(Item_Attached), _onAtachText];

if (_unit == _attachToVehicle) then {  //Self Attachment
    _attachedItem = _itemVehClass createVehicle [0,0,0];
    _attachedItem attachTo [_unit, [0.05, -0.09, 0.1], "leftshoulder"];
    if (!_silentScripted) then {
        _unit removeItem _itemClassname;  // Remove item
        [_onAtachText] call EFUNC(common,displayTextStructured);
    };
    _unit setVariable [QGVAR(attached), [[_attachedItem, _itemClassname]], true];
} else {
    GVAR(placeAction) = PLACE_WAITING;

    [_unit, "forceWalk", "ACE_Attach", true] call EFUNC(common,statusEffect_set);

    [{[localize LSTRING(PlaceAction), ""] call EFUNC(interaction,showMouseHint)}, []] call CBA_fnc_execNextFrame;
    _unit setVariable [QGVAR(placeActionEH), [_unit, "DefaultAction", {true}, {GVAR(placeAction) = PLACE_APPROVE;}] call EFUNC(common,AddActionEventHandler)];

    _actionID = _unit addAction [format ["<t color='#FF0000'>%1</t>", localize LSTRING(CancelAction)], {GVAR(placeAction) = PLACE_CANCEL}];

    //Display to show virtual object:
    _model = getText (configFile >> "CfgAmmo" >> _itemVehClass >> "model");
    if (_model == "") then {
        _model = getText (configFile >> "CfgVehicles" >> _itemVehClass >> "model");
    };
    //"\A3\Weapons_F\empty.p3d" is fine, but ctrlSetModel ""; - will crash game!
    if (_model == "") exitWith {ERROR("No Model");};
    (QGVAR(virtualAmmo) call BIS_fnc_rscLayer) cutRsc [QGVAR(virtualAmmo), "PLAIN", 0, false];
    ((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlSetModel _model;

    [{
        private ["_angle", "_dir", "_screenPos", "_realDistance", "_up", "_virtualPos", "_virtualPosASL", "_lineInterection"];
        params ["_args","_idPFH"];
        _args params ["_unit","_attachToVehicle","_itemClassname","_itemVehClass","_onAtachText","_actionID"];

        _virtualPosASL = (eyePos _unit) vectorAdd (positionCameraToWorld [0,0,0.6]) vectorDiff (positionCameraToWorld [0,0,0]);
        if (cameraView == "EXTERNAL") then {
            _virtualPosASL = _virtualPosASL vectorAdd ((positionCameraToWorld [0.3,0,0]) vectorDiff (positionCameraToWorld [0,0,0]));
        };
        _virtualPos = _virtualPosASL call EFUNC(common,ASLToPosition);
        _lineInterection = lineIntersects [eyePos ACE_player, _virtualPosASL, ACE_player];

        //Don't allow placing in a bad position:
        if (_lineInterection && {GVAR(placeAction) == PLACE_APPROVE}) then {GVAR(placeAction) = PLACE_WAITING;};

        if ((GVAR(placeAction) != PLACE_WAITING) ||
                {_unit != ACE_player} ||
                {!([_unit, _attachToVehicle, []] call EFUNC(common,canInteractWith))} ||
                {!([_attachToVehicle, _unit, _itemClassname] call FUNC(canAttach))}) then {

            [_idPFH] call CBA_fnc_removePerFrameHandler;
            [_unit, "forceWalk", "ACE_Attach", false] call EFUNC(common,statusEffect_set);
            [] call EFUNC(interaction,hideMouseHint);
            [_unit, "DefaultAction", (_unit getVariable [QGVAR(placeActionEH), -1])] call EFUNC(common,removeActionEventHandler);
            _unit removeAction _actionID;

            (QGVAR(virtualAmmo) call BIS_fnc_rscLayer) cutText ["", "PLAIN"];

            if (GVAR(placeAction) == PLACE_APPROVE) then {
                [_unit, _attachToVehicle, _itemClassname, _itemVehClass, _onAtachText, _virtualPos] call FUNC(placeApprove);
            };
        } else {
            //Show the virtual object:
            if (_lineInterection) then {
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
                _angle = asin (_dir select 2);
                _up = [0, cos _angle, sin _angle];
                ((uiNamespace getVariable [QGVAR(virtualAmmoDisplay), displayNull]) displayCtrl 800851) ctrlSetModelDirAndUp [[1,0,0], _up];
            };
        };
    }, 0, [_unit, _attachToVehicle, _itemClassname, _itemVehClass, _onAtachText, _actionID]] call CBA_fnc_addPerFrameHandler;
};
