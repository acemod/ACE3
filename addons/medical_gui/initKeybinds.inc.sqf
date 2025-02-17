["ACE3 Common", QGVAR(openMedicalMenuKey), LLSTRING(OpenMedicalMenu), {
    // Get target (cursorTarget, cursorObject, and lineIntersectsSurfaces along camera to maxDistance), if not valid then target is ACE_player
    TRACE_3("Open menu key",cursorTarget,cursorObject,ACE_player);
    private _target = cursorTarget;
    if !(_target isKindOf "CAManBase" && {[ACE_player, _target] call FUNC(canOpenMenu)}) then {
        _target = cursorObject;
        if !(_target isKindOf "CAManBase" && {[ACE_player, _target] call FUNC(canOpenMenu)}) then {
            private _start = AGLToASL positionCameraToWorld [0, 0, 0];
            private _end = AGLToASL positionCameraToWorld [0, 0, GVAR(maxDistance)];
            private _intersections = lineIntersectsSurfaces [_start, _end, ACE_player, objNull, true, -1, "FIRE"];
            {
                _x params ["", "", "_intersectObject"];
                // Only look "through" player and player's vehicle
                if (!(_intersectObject isKindOf "CAManBase") && {_intersectObject != vehicle ACE_player}) exitWith {};
                if (_intersectObject != ACE_player && {_intersectObject isKindOf "CAManBase" && {[ACE_player, _intersectObject] call FUNC(canOpenMenu)}}) exitWith {
                    _target = _intersectObject;
                };
            } forEach _intersections;
            if (!(_target isKindOf "CAManBase") || {!([ACE_player, _target] call FUNC(canOpenMenu))}) then {
                _target = ACE_player;
            };
        };
    };

    // Check conditions: canInteract and canOpenMenu
    if !([ACE_player, _target, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if !([ACE_player, _target] call FUNC(canOpenMenu)) exitWith {false};

    // Statement
    [_target] call FUNC(openMenu);
    false
}, {
    // Close menu if enough time passed from opening
    if (CBA_missionTime - GVAR(lastOpenedOn) > 0.5) exitWith {
        [objNull] call FUNC(openMenu);
    };
}, [DIK_H, [false, false, false]], false, 0] call CBA_fnc_addKeybind;

["ACE3 Common", QGVAR(peekMedicalInfoKey), LLSTRING(PeekMedicalInfo), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside", "isNotSwimming", "isNotEscorting", "isNotDragging", "isNotCarrying", "isNotOnLadder"]] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    [ACE_player, -1] call FUNC(displayPatientInformation);
    false
}, {
    if (CBA_missionTime - GVAR(peekLastOpenedOn) > GVAR(peekMedicalInfoReleaseDelay)) then {
        [{
            CBA_missionTime - GVAR(peekLastOpenedOn) > GVAR(peekMedicalInfoReleaseDelay)
        }, {
            QGVAR(RscPatientInfo) cutFadeOut 0.3;
        }] call CBA_fnc_waitUntilAndExecute;
    };
    GVAR(peekLastOpenedOn) = CBA_missionTime;
}, [DIK_H, [false, true, false]], false, 0] call CBA_fnc_addKeybind;
