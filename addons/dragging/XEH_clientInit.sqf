// by PabstMirror, commy2
#include "script_component.hpp"

[DFUNC(handleScrollWheel)] call EFUNC(common,addScrollWheelEventHandler);

if (isNil "ACE_maxWeightDrag") then {
    ACE_maxWeightDrag = 800;
};

if (isNil "ACE_maxWeightCarry") then {
    ACE_maxWeightCarry = 600;
};

["isNotDragging", {!((_this select 0) getVariable [QGVAR(isDragging), false])}] call EFUNC(common,addCanInteractWithCondition);
["isNotCarrying", {!((_this select 0) getVariable [QGVAR(isCarrying), false])}] call EFUNC(common,addCanInteractWithCondition);

// release object on player change. This does work when returning to lobby, but not when hard disconnecting.
["playerChanged", DFUNC(handlePlayerChanged)] call EFUNC(common,addEventhandler);
["playerVehicleChanged", {[ACE_player, objNull] call DFUNC(handlePlayerChanged)}] call EFUNC(common,addEventhandler);
["playerWeaponChanged", DFUNC(handlePlayerWeaponChanged)] call EFUNC(common,addEventhandler);

// handle waking up dragged unit and falling unconscious while dragging
["medical_onUnconscious", DFUNC(handleUnconscious)] call EFUNC(common,addEventhandler);

[
    "ACE3 Common",
    QGVAR(Drop),
    (localize LSTRING(Drop)),
    {
        private ["_draggedObject", "_carriedObject"];
        _draggedObject = (ACE_player getVariable [QGVAR(draggedObject),objNull]);
        // End Dragging
        if !(isNull _draggedObject) then {
            [ACE_player, _draggedObject] call FUNC(dropObject);
            true
        };
        _carriedObject = (ACE_player getVariable [QGVAR(carriedObject),objNull]);
        // End Carry
        if !(isNull _carriedObject) then {
            [ACE_player, _carriedObject] call FUNC(dropObject_carry);
            true
        };
        false
    },
    { false },
    [0, [false, false, false]]
] call CBA_fnc_addKeybind;

//@todo Captivity?
