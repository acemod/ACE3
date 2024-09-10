// Add Keybinds
["ACE3 Common", QGVAR(drag), LLSTRING(DragKeybind), {
    private _player = ACE_player;

    if (!alive _player) exitWith {false};
    if !([_player, objNull, ["isNotDragging", "isNotCarrying", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};

    // If we are dragging/carrying something right now then just drop it
    if (_player getVariable [QGVAR(isDragging), false]) exitWith {
        [_player, _player getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject);

        false
    };

    if (_player getVariable [QGVAR(isCarrying), false]) exitWith {
        [_player, _player getVariable [QGVAR(carriedObject), objNull]] call FUNC(dropObject_carry);

        false
    };

    private _cursorObject = cursorObject;
    if (_cursorObject isKindOf "CaManBase" && {unitIsUAV _cursorObject}) then { _cursorObject = vehicle _cursorObject };

    if (isNull _cursorObject || {(_cursorObject distance _player) > 2.6}) exitWith {false};
    if !([_player, _cursorObject] call FUNC(canDrag)) exitWith {false};

    [_player, _cursorObject] call FUNC(startDrag);

    false
}, {}, [-1, [false, false, false]]] call CBA_fnc_addKeybind; // UNBOUND

["ACE3 Common", QGVAR(carry), LLSTRING(CarryKeybind), {
    private _player = ACE_player;

    if (!alive _player) exitWith {false};
    if !([_player, objNull, ["isNotDragging", "isNotCarrying"]] call EFUNC(common,canInteractWith)) exitWith {false};

    // If we are dragging/carrying something right now then just drop it
    if (_player getVariable [QGVAR(isDragging), false]) exitWith {
        [_player, _player getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject);

        false
    };

    if (_player getVariable [QGVAR(isCarrying), false]) exitWith {
        [_player, _player getVariable [QGVAR(carriedObject), objNull], true] call FUNC(dropObject_carry);

        false
    };

    private _cursorObject = cursorObject;
    if (_cursorObject isKindOf "CaManBase" && {unitIsUAV _cursorObject}) then { _cursorObject = vehicle _cursorObject };

    if (isNull _cursorObject || {(_cursorObject distance _player) > 2.6}) exitWith {false};
    if !([_player, _cursorObject] call FUNC(canCarry)) exitWith {false};

    [_player, _cursorObject] call FUNC(startCarry);

    false
}, {}, [-1, [false, false, false]]] call CBA_fnc_addKeybind; // UNBOUND
