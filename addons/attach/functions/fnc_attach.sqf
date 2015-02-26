/*
 * Author: eRazeri and CAA-Picard
 * Attach an item to the unit
 *
 * Arguments:
 * 0: unit doing the attach (player) <OBJECT>
 * 1: vehicle that it will be attached to (player or vehicle) <OBJECT>
 * 2: Name of the attachable item <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_unit,_attachToVehicle,_itemName);

//Sanity Check (_unit has item in inventory, not over attach limit)
if !([_unit, _attachToVehicle, _itemName] call FUNC(canAttach)) exitWith {ERROR("Tried to attach, but check failed");};

private ["_itemVehClass", "_onAtachText", "_selfAttachPosition"];

_itemVehClass = "";
_onAtachText = "";
_selfAttachPosition = [_unit, [-0.05, 0, 0.12], "rightshoulder"];

switch (true) do {
    case (_itemName == "ACE_IR_Strobe_Item"): {
        _itemVehClass = "ACE_IR_Strobe_Effect";
        _onAtachText = localize "STR_ACE_Attach_IrStrobe_Attached";
        //_selfAttachPosition = [_unit, [0, -0.11, 0.16], "pilot"];  //makes it attach to the head a bit better, shoulder is not good for visibility - eRazeri
    };
    case (_itemName == "B_IR_Grenade"): {
        _itemVehClass = "B_IRStrobe";
        _onAtachText = localize "STR_ACE_Attach_IrGrenade_Attached";
    };
    case (_itemName == "O_IR_Grenade"): {
        _itemVehClass = "O_IRStrobe";
        _onAtachText = localize "STR_ACE_Attach_IrGrenade_Attached";
    };
    case (_itemName == "I_IR_Grenade"): {
        _itemVehClass = "I_IRStrobe";
        _onAtachText = localize "STR_ACE_Attach_IrGrenade_Attached";
    };
    case (toLower _itemName in ["chemlight_blue", "chemlight_green", "chemlight_red", "chemlight_yellow"]): {
        _itemVehClass = _itemName;
        _onAtachText = localize "STR_ACE_Attach_Chemlight_Attached";
    };
};

if (_itemVehClass == "") exitWith {ERROR("no _itemVehClass for Item");};

if (_unit == _attachToVehicle) then {  //Self Attachment
    _unit removeItem _itemName;  // Remove item
    _attachedItem = _itemVehClass createVehicle [0,0,0];
    _attachedItem attachTo _selfAttachPosition;
    [_onAtachText] call EFUNC(common,displayTextStructured);
    _attachToVehicle setVariable [QGVAR(Objects), [_attachedItem], true];
    _attachToVehicle setVariable [QGVAR(ItemNames), [_itemName], true];
} else {
    GVAR(setupObject) = _itemVehClass createVehicleLocal [0,0,-10000];
    GVAR(setupObject) enableSimulationGlobal false;
    GVAR(SetupPlacmentText) = _onAtachText;
    GVAR(SetupPlacmentItem) = _itemName;
    GVAR(SetupAttachVehicle) = _attachToVehicle;
    GVAR(placer) = _unit;
    [_unit, QGVAR(vehAttach), true] call EFUNC(common,setForceWalkStatus);

    [QGVAR(PlacementEachFrame),"OnEachFrame", {
        private "_player";
        _player = ACE_player;
        //Stop if player switch or player gets to far from vehicle
        if (GVAR(placer) != _player || {_player distance GVAR(SetupAttachVehicle) > 7}) exitWith {
            call FUNC(placeCancel);
        };
        GVAR(pfeh_running) = true;
        _pos = (ASLtoATL eyePos _player) vectorAdd (positionCameraToWorld [0,0,1] vectorDiff positionCameraToWorld [0,0,0]);
        GVAR(setupObject) setPosATL _pos;
    }] call BIS_fnc_addStackedEventHandler;     // @todo replace with CBA PFH

    //had to delay the mouseHint, not sure why
    [{[localize "STR_ACE_Attach_PlaceAction", localize "STR_ACE_Attach_CancelAction"] call EFUNC(interaction,showMouseHint)}, [], 0, 0] call EFUNC(common,waitAndExecute);

    _unit setVariable [QGVAR(placeActionEH), [_unit, "DefaultAction", {GVAR(pfeh_running) && {!isNull (GVAR(setupObject))}}, {call FUNC(placeApprove);}] call EFUNC(common,AddActionEventHandler)];
    _unit setVariable [QGVAR(cancelActionEH), [_unit, "MenuBack", {GVAR(pfeh_running) && {!isNull (GVAR(setupObject))}}, {call FUNC(placeCancel);}] call EFUNC(common,AddActionEventHandler)];
};
