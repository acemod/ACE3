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
 * Nothing
 *
 * Example:
 * [bob, bob, ["light"]] call ace_attach_fnc_attach;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_itemClassname", "_itemVehClass", "_onAtachText", "_selfAttachPosition", "_attachedItem", "_tempObject", "_actionID"];

PARAMS_3(_attachToVehicle,_unit,_args);
_itemClassname = [_args, 0, ""] call CBA_fnc_defaultParam;

//Sanity Check (_unit has item in inventory, not over attach limit)
if ((_itemClassname == "") || {!(_this call FUNC(canAttach))}) exitWith {ERROR("Tried to attach, but check failed");};

_selfAttachPosition = [_unit, [-0.05, 0, 0.12], "rightshoulder"];

_itemVehClass = getText (configFile >> "CfgWeapons" >> _itemClassname >> "ACE_Attachable");
_onAtachText = getText (configFile >> "CfgWeapons" >> _itemClassname >> "displayName");

if (_itemVehClass == "") then {
    _itemVehClass = getText (configFile >> "CfgMagazines" >> _itemClassname >> "ACE_Attachable");
    _onAtachText = getText (configFile >> "CfgMagazines" >> _itemClassname >> "displayName");
};

if (_itemVehClass == "") exitWith {ERROR("no ACE_Attachable for Item");};

_onAtachText = format [localize STRING(Item_Attached), _onAtachText];

if (_unit == _attachToVehicle) then {  //Self Attachment
    _unit removeItem _itemClassname;  // Remove item
    _attachedItem = _itemVehClass createVehicle [0,0,0];
    _attachedItem attachTo _selfAttachPosition;
    [_onAtachText] call EFUNC(common,displayTextStructured);
    _attachToVehicle setVariable [QGVAR(Objects), [_attachedItem], true];
    _attachToVehicle setVariable [QGVAR(ItemNames), [_itemClassname], true];
} else {
    GVAR(placeAction) = -1;

    _tempObject = _itemVehClass createVehicleLocal [0,0,-10000];
    _tempObject enableSimulationGlobal false;

    [_unit, QGVAR(vehAttach), true] call EFUNC(common,setForceWalkStatus);

    //MenuBack isn't working for now (localize STRING(CancelAction))
    [{[localize STRING(PlaceAction), ""] call EFUNC(interaction,showMouseHint)}, [], 0, 0] call EFUNC(common,waitAndExecute);
    _unit setVariable [QGVAR(placeActionEH), [_unit, "DefaultAction", {true}, {GVAR(placeAction) = 1;}] call EFUNC(common,AddActionEventHandler)];
    // _unit setVariable [QGVAR(cancelActionEH), [_unit, "MenuBack", {true}, {GVAR(placeAction) = 0;}] call EFUNC(common,AddActionEventHandler)];

    _actionID = _unit addAction [format ["<t color='#FF0000'>%1</t>", localize STRING(CancelAction)], {GVAR(placeAction) = 0}];

    [{
        private "_startingPosition";
        PARAMS_2(_args,_pfID);
        EXPLODE_7_PVT(_args,_unit,_attachToVehicle,_itemClassname,_itemVehClass,_tempObject,_onAtachText,_actionID);

        if ((GVAR(placeAction) != -1) ||
                {_unit != ACE_player} ||
                {!([_unit, _attachToVehicle, []] call EFUNC(common,canInteractWith))} ||
                {!([_attachToVehicle, _unit, _itemClassname] call FUNC(canAttach))}) then {

            [_pfID] call CBA_fnc_removePerFrameHandler;
            [_unit, QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus);
            [] call EFUNC(interaction,hideMouseHint);
            [_unit, "DefaultAction", (_unit getVariable [QGVAR(placeActionEH), -1])] call EFUNC(common,removeActionEventHandler);
            //[_unit, "MenuBack", (_unit getVariable [QGVAR(cancelActionEH), -1])] call EFUNC(common,removeActionEventHandler);
            _unit removeAction _actionID;

            if (GVAR(placeAction) == 1) then {
                _startingPosition = _tempObject modelToWorldVisual [0,0,0];
                [_unit, _attachToVehicle, _itemClassname, _itemVehClass, _onAtachText, _startingPosition] call FUNC(placeApprove);
            };
            deleteVehicle _tempObject;
        } else {
            _tempObject setPosATL ((ASLtoATL eyePos _unit) vectorAdd (positionCameraToWorld [0,0,1] vectorDiff positionCameraToWorld [0,0,0]));;
        };
    }, 0, [_unit, _attachToVehicle, _itemClassname, _itemVehClass, _tempObject, _onAtachText, _actionID]] call CBA_fnc_addPerFrameHandler;
};
