/*
    Author:
    voiper, derived in part from BIS_fnc_camera by Karel Moricky

    Description:
    Spectator camera and UI.

    Arguments:
    0: Mode: "Init" is the only mission relevant one <String>
    1: <Array> (optional):
        0: Whether camera is permanent (can't be escaped via escape key) <Bool>

    Example:
    ["Init", [true]] call ace_spectator_fnc_camera;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

disableSerialization;

_mode = _this select 0;
_this = _this select 1;

switch _mode do {

    case "Init": {

        GVAR(noEscape) = if (count _this > 0) then {
            _this select 0
        } else {
            false
        };

        _camPos = if (!isNil QGVAR(startingPos)) then {
            GVAR(startingPos)
        } else {
            getPos cameraOn
        };

        _camDir = if (!isNil QGVAR(startingDir)) then {
            GVAR(startingDir)
        } else {
            0
        };

        _camPos set [2, (_camPos select 2) + 2];
        _cam = "Camera" camCreate _camPos;
        _cam setDir _camDir;
        _cam cameraEffect ["internal", "back"];
        _cam camSetFocus [-1, -1];
        _cam camCommit 0;
        showCinemaBorder false;
        cameraEffectEnableHUD true;

        //camera vars
        GVAR(cam) = _cam;
        GVAR(vector) = [_camDir, 0, 0];
        GVAR(fov) = 0.7;
        GVAR(vision) = 0;
        GVAR(moveScale) = 0.1;
        GVAR(cameraOn) = true;
        GVAR(focus) = [-1, -1];
        GVAR(lock) = [-1];
        GVAR(attach) = objNull;
        GVAR(unit) = objNull;
        GVAR(markers) = 3;
        GVAR(accTime) = 1;
        GVAR(third) = false;

        //mouse vars
        GVAR(mouseLeft) = false;
        GVAR(mouseRight) = false;
        GVAR(mouseBusy) = false;

        //kb vars
        GVAR(keyCamMoveForward) = false;
        GVAR(keyCamMoveBackward) = false;
        GVAR(keyCamMoveLeft) = false;
        GVAR(keyCamMoveRight) = false;
        GVAR(keyCamMoveUp) = false;
        GVAR(keyCamMoveDown) = false;
        GVAR(keyCamRotDownLeft) = false;
        GVAR(keyCamRotDown) = false;
        GVAR(keyCamRotDownRight) = false;
        GVAR(keyCamRotLeft) = false;
        GVAR(keyCamRotRight) = false;
        GVAR(keyCamRotUpLeft) = false;
        GVAR(keyCamRotUp) = false;
        GVAR(keyCamRotUpRight) = false;
        GVAR(keyCamBankLeft) = false;
        GVAR(keyCamBankRight) = false;
        GVAR(keyFOVup) = false;
        GVAR(keyFOVdown) = false;
        GVAR(keyFocusUp) = false;
        GVAR(keyFocusDown) = false;
        GVAR(keyTimeAccUp) = false;
        GVAR(keyTimeAccDown) = false;
        GVAR(keyCamBankMod) = false;
        GVAR(keyCamRotMore) = false;
        GVAR(keyCamRotLess) = false;

        //define only if doesn't exist (to preserve saved spots from a previous camera)
        if (isNil QGVAR(savedSpots)) then {
            GVAR(savedSpots) = [];
            for "_i" from 0 to 11 do {GVAR(savedSpots) set [_i, []]};
        };

        if (isNil QGVAR(savedUnits)) then {
            GVAR(savedUnits) = [];
            for "_i" from 0 to 9 do {GVAR(savedUnits) set [_i, objNull]};
        };

        _display = findDisplay 46;

        GVAR(ehDraw3D) = addMissionEventhandler ["Draw3D", {['Draw3D', _this] call FUNC(draw3D)}];
        addMissionEventHandler ["Ended", {if (!isNil QGVAR(cam)) then {["Exit"] call FUNC(camera)}}];
        GVAR(ehMouseButtonDown) = _display displayAddEventHandler ["mouseButtonDown", {['MouseButtonDown', _this] call FUNC(camera)}];
        GVAR(ehMouseButtonUp) = _display displayAddEventHandler ["mouseButtonUp", {['MouseButtonUp',_this] call FUNC(camera)}];
        GVAR(ehMouseZChanged) = _display displayAddEventHandler ["mouseZChanged", {['MouseZChanged',_this] call FUNC(camera)}];
        GVAR(ehMouseMoving) = _display displayAddEventHandler ["mouseMoving", {['Mouse',_this] call FUNC(camera)}];
        GVAR(ehMouseHolding)  =_display displayAddEventHandler ["mouseHolding", {['Mouse',_this] call FUNC(camera)}];
        GVAR(ehKeyDown) = _display displayAddEventHandler ["keyDown", {
            _key = _this select 1;
            _ret = false;

            //block grave/tilde key (there is no default tilde keybind we use to override)
            if (_key == 41) then {
                _ret = true
            };

            //escape sequence initiated (CBA can't handle escape)
            if (_key == 1) then {
                if GVAR(noEscape) exitWith {_ret = false};
                //insert excuse for using spawn
                _this spawn {
                    disableSerialization;
                    _display = _this select 0;
                    _message = [localize LSTRING(Exit), localize LSTRING(Module_DisplayName), nil, true, _display] call BIS_fnc_guiMessage;
                    if (_message) then {["Exit"] call FUNC(camera)};
                };
                _ret = true;
            };

            _ret
        }];

        //remove mission layer
        _displayMission = call (uiNamespace getVariable "BIS_fnc_displayMission");
        _control = _displayMission displayCtrl 11400;
        _control ctrlSetFade 1;
        _control ctrlCommit 0;

        //kill layers
        cutText ["", "Plain"];
        _layers = missionNamespace getVariable ["BIS_fnc_rscLayer_list", []];
        for "_i" from 1 to (count _layers - 1) step 2 do {
            (_layers select _i) cutText ["", "Plain"];
        };

        clearRadio;

        //crosshair
        _layer = [QGVAR(crosshair)] call BIS_fnc_rscLayer;
        _layer cutRsc [QGVAR(crosshair), "PLAIN", 2, true];

        //compass
        _layer = [QGVAR(compass)] call BIS_fnc_rscLayer;
        _layer cutRsc [QGVAR(compass), "PLAIN", 2, true];

        //status
        _layer = [QGVAR(status)] call BIS_fnc_rscLayer;
        _layer cutRsc [QGVAR(status), "PLAIN", 2, true];

        //help
        _layer = [QGVAR(help)] call BIS_fnc_rscLayer;
        preloadTitleRsc [QGVAR(help), "PLAIN", 0, true];

        if (["ace_nametags"] call EFUNC(common,isModLoaded)) then {
            GVAR(tags) = [EGVAR(nametags,showPlayerNames), EGVAR(nametags,showNamesForAI)];
            EGVAR(nametags,showPlayerNames) = 0;
            EGVAR(nametags,showNamesForAI) = false;
        };

        if (["ace_interact_menu"] call EFUNC(common,isModLoaded)) then {
            [QGVAR(interactCondition), {false}] call EFUNC(common,addCanInteractWithCondition);
        };

        //add unit check, since if tracking were on it would already be present
        if !GVAR(tracking) then {
            [FUNC(checkUnits), 2] call CBA_fnc_addPerFrameHandler
        };

        //intro
        999999 cutText ["", "BLACK IN", 2];
        2 fadeSound 1;
    };

    //////////////////////////////////////////
    case "Mouse": {
        _mapOn = uiNamespace getVariable QGVAR(map);
        if (!isNull _mapOn) exitWith {};

        _cam = GVAR(cam);
        _dir = GVAR(vector) select 0;
        _pitch = GVAR(vector) select 1;
        _bank = GVAR(vector) select 2;
        _camPos = getPosASL _cam;
        _coef = GVAR(moveScale * (((getPosATL _cam) select 2) / 2)) min 50 max 0.001;

        //temporary functions / TODO: Move to external func?
        _camMove = {
            _inPos = _this;
            if !GVAR(cameraOn) exitWith {};
            if (_inPos select 2 > 20000) then {_inPos set [2, 20000]};
            _obj = GVAR(attach);
            if !(isNull _obj) then {
                if ((GVAR(lock) select 0) < 0) then {
                    _modelPos = _obj worldToModel (ASLtoATL _inPos);
                    _cam attachTo [_obj, _modelPos];
                };
            } else {
                _cam setPosASL _inPos;
            };
        };

        _camMoveKeyboard = {
            _dX = _this select 0;
            _dY = _this select 1;
            _dZ = _this select 2;
            _pos = getPosASL _cam;
            _moveDir = (getDir _cam) + _dX * 90;
            _camPos = [
                (_pos select 0) + ((sin (_moveDir)) * _coef * _dY),
                (_pos select 1) + ((cos (_moveDir)) * _coef * _dY),
                (_pos select 2) + _dZ * _coef / 1.5
            ];
            //for some reason, at visual height = 0, cameras report 10cm higher than they actually are
            _camPos set [2, (_camPos select 2) max (getTerrainHeightASL _camPos + 0.1)];

            _camPos call _camMove;
        };

        _rotMod = if (GVAR(keyCamRotMore) && !GVAR(keyCamRotLess)) then {
            5
        } else {
            if (!GVAR(keyCamRotMore) && GVAR(keyCamRotLess)) then {0.1} else {1};
        };

        _camRotate = {
            if ((GVAR(lock) select 0) > -1) exitWith {};
            _dX = (_this select 0) * GVAR(fov) * _rotMod;
            _dY = (_this select 1) * GVAR(fov) * _rotMod;
            _pitch = ((GVAR(vector) select 1) + _dY) max -90 min 90;
            _bank = GVAR(vector) select 2;
            _dir = _dir + _dX;
            GVAR(vector) = [_dir, _pitch, _bank];
            [_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
        };

        _camBank = {
            if ((GVAR(lock) select 0) > -1) exitWith {};
            _dZ = (_this select 0) * _rotMod;
            _pitch = GVAR(vector) select 1;
            _bank = ((GVAR(vector) select 2) + _dZ) max -181 min 181;
            if (_bank == -181) then {_bank = 180} else {if (_bank == 181) then {_bank = -180}};
            GVAR(vector) = [_dir, _pitch, _bank];
            [_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
        };

        //apply mouse
        if (GVAR(mouseLeft) || GVAR(mouseRight)) then {
            if GVAR(mouseBusy) exitWith {};
            _mX = (_this select 1) * (GVAR(accTime) max 0.05);
            _mY = (_this select 2) * (GVAR(accTime) max 0.05);

            if GVAR(mouseRight) then {

                _dX = _mX;
                _dY = -_mY;

                _camPos = [_camPos, _dY, getDir _cam] call BIS_fnc_relPos;
                _camPos = [_camPos, _dX, getDir _cam + 90] call BIS_fnc_relPos;

                _camPos call _camMove;

            } else {
                if (GVAR(lock) select 0 > -1) exitWith {};
                _dX = _mX / 50 * 180 * GVAR(fov);
                _dY = -_mY / 50 * 180 * GVAR(fov);

                if GVAR(keyCamBankMod) then {
                    _pitch = (_pitch + _dY) max -180 min 180;
                    _bank = (_bank + _dX) max -181 min 181;
                    if (_bank <= -181) then {_bank = 180} else {if (_bank >= 181) then {_bank = -180}};
                } else {
                    _dir = _dir + _dX;
                    _pitch = (_pitch + _dY) max -90 min 90;
                };
                GVAR(vector) = [_dir, _pitch, _bank];
                [_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
            };
        };

        //apply kb
        if GVAR(keyCamMoveForward) then {[0,1,0] call _camMoveKeyboard};
        if GVAR(keyCamMoveBackward) then {[0,-1,0] call _camMoveKeyboard};
        if GVAR(keyCamMoveLeft) then {[-1,1,0] call _camMoveKeyboard};
        if GVAR(keyCamMoveRight) then {[1,1,0] call _camMoveKeyboard};
        if GVAR(keyCamMoveUp) then {[0,0,1] call _camMoveKeyboard};
        if GVAR(keyCamMoveDown) then {[0,0,-1] call _camMoveKeyboard};

        if GVAR(keyCamRotDownLeft) then {[-1,-1,0] call _camRotate};
        if GVAR(keyCamRotDown) then {[+0,-1,0] call _camRotate};
        if GVAR(keyCamRotDownRight) then {[+1,-1,0] call _camRotate};
        if GVAR(keyCamRotLeft) then {[-1,+0,0] call _camRotate};
        if GVAR(keyCamRotRight) then {[+1,+0,0] call _camRotate};
        if GVAR(keyCamRotUpLeft) then {[-1,+1,0] call _camRotate};
        if GVAR(keyCamRotUp) then {[+0,+1,0] call _camRotate};
        if GVAR(keyCamRotUpRight) then {[+1,+1,0] call _camRotate};

        if GVAR(keyCamBankLeft) then {[-1] call _camBank};
        if GVAR(keyCamBankRight) then {[+1] call _camBank};

        if GVAR(keyFOVup) then {
            GVAR(fov) = GVAR(fov) - (GVAR(fov) / 50 * _rotMod) max 0.01;
            _cam camPrepareFOV GVAR(fov);
            _cam camCommitPrepared 0;
        };

        if GVAR(keyFOVdown) then {
            GVAR(fov) = GVAR(fov) + (GVAR(fov) / 50 * _rotMod) min 2;
            _cam camPrepareFOV GVAR(fov);
            _cam camCommitPrepared 0;
        };

        if GVAR(keyFocusDown) then {
            _cur = GVAR(focus) select 0;
            if (_cur < 0) then {_cur = 1};
            _cur = _cur - (_cur / 25) max 0.25;
            GVAR(focus) = [_cur, 1.5];
            _cam camSetFocus GVAR(focus);
            _cam camCommit 0;
        };

        if GVAR(keyFocusUp) then {
            _cur = GVAR(focus) select 0;
            if (_cur < 0) then {_cur = 1};
            _cur = _cur + (_cur / 25) min 5000;
            GVAR(focus) = [_cur, 1.5];
            _cam camSetFocus GVAR(focus);
            _cam camCommit 0;
        };

        if GVAR(keyTimeAccDown) then {
            if (!isMultiplayer) then {
                _cur = GVAR(accTime);
                _cur = _cur - (_cur / 25) max 0;
                GVAR(accTime) = _cur;
                setAccTime GVAR(accTime);
            };
        };

        if GVAR(keyTimeAccUp) then {
            if (!isMultiplayer) then {
                _cur = GVAR(accTime);
                _cur = _cur + (_cur / 25) min 4;
                GVAR(accTime) = _cur;
                setAccTime GVAR(accTime);
            };
        };
    };

    //////////////////////////////////////////
    case "MouseButtonDown": {
        _mapOn = uiNamespace getVariable QGVAR(map);
        if (!isNull _mapOn) exitWith {};

        _button = _this select 1;

        switch (_button) do {
            case 0: {GVAR(mouseLeft) = true};
            case 1: {GVAR(mouseRight) = true};
        };
    };

    //////////////////////////////////////////
    case "MouseButtonUp": {
        _mapOn = uiNamespace getVariable QGVAR(map);
        if (!isNull _mapOn) exitWith {};

        _button = _this select 1;

        switch (_button) do {
            case 0: {GVAR(mouseLeft) = false};
            case 1: {GVAR(mouseRight) = false};
        };
    };

    //////////////////////////////////////////
    case "MouseZChanged": {
        _mapOn = uiNamespace getVariable QGVAR(map);
        if (!isNull _mapOn) exitWith {};

        _diff = _this select 1;
        if (_diff > 0) then {
            GVAR(moveScale) = GVAR(moveScale) + (GVAR(moveScale) / 10) min 1;
        } else {
            GVAR(moveScale) = GVAR(moveScale) - (GVAR(moveScale) / 10) max 0.001;
        };
    };

    //////////////////////////////////////////
    case "CameraSlot": {

        _mode = _this select 0;
        _value = _this select 1;

        _cam = GVAR(cam);
        _camOn = GVAR(cameraOn);
        _unit = GVAR(unit);
        _lock = GVAR(lock) select 0;

        _camPos = [getPos _cam, GVAR(vector), GVAR(fov), GVAR(focus)];

        _camSaveSpot = {
            _num = _this select 0;
            if (!isNull GVAR(attach)) then {
                _vector = _camPos select 1;
                _dir = _vector select 0;
                _vector set [0, _dir - (getDir GVAR(attach))];
                _camPos set [1, _vector];
            };
            GVAR(savedSpots) set [_num, _camPos];
        };

        _camLoadSpot = {
            _num = _this select 0;
            _arr = GVAR(savedSpots) select _num;
            if (count (_arr) > 0) then {
                if (!_camOn) then {
                    ["CameraMode", ["Free"]] call FUNC(camera)
                };
                call _detach;
                _cam setPos (_arr select 0);
                _vector = _arr select 1;
                [_cam, _vector] call BIS_fnc_setObjectRotation;
                _cam camPrepareFOV (_arr select 2);
                _cam camPrepareFocus (_arr select 3);
                _cam camCommitPrepared 0;
                GVAR(vector) = _vector;
            };
        };

        _camSaveUnit = {
            _num = _this select 0;

            if (!isNull _unit) then {
                _alreadySaved = GVAR(savedUnits) find _unit;
                if (_alreadySaved > -1) then {
                    GVAR(savedUnits) set [_alreadySaved, objNull];
                };
                GVAR(savedUnits) set [_num, _unit]
            };
        };

        _camLoadUnit = {
            _num = _this select 0;
            _unit = GVAR(savedUnits) select _num;
            if (!isNull _unit) then {
                if (_lock > -1) then {
                    ["CameraMode", ["Lock"]] call FUNC(camera)
                };
                if (GVAR(unit) == _unit) then {
                    call _detach;
                    if (_camOn) then {
                        ["CameraMode", ["Third"]] call FUNC(camera);
                    } else {
                        ["CameraMode", ["SwitchUnit"]] call FUNC(camera);
                    };
                } else {
                    GVAR(unit) = _unit;
                    if ((GVAR(lock) select 0) > -1) then {["CameraMode", ["Lock"]] call FUNC(camera)};
                    if (!_camOn) then {
                        call _detach;
                        ["CameraMode", ["SwitchUnit"]] call FUNC(camera);
                    };
                };
            };
        };

        _detach = {
            if (!isNull GVAR(attach)) then {
                ["CameraMode", ["Attach"]] call FUNC(camera);
            };
        };

        switch _mode do {
            case "SaveSpot": {
                [_value] call _camSaveSpot
            };

            case "LoadSpot": {
                [_value] call _camLoadSpot
            };

            case "SaveUnit": {
                [_value] call _camSaveUnit
            };

            case "LoadUnit": {
                [_value] call _camLoadUnit
            };
        };
    };

    //////////////////////////////////////////
    case "CameraMode": {

        _mode = _this select 0;

        _cam = GVAR(cam);
        _camOn = GVAR(cameraOn);
        _unit = GVAR(unit);
        _lock = GVAR(lock) select 0;
        _camPos = [getPos _cam, GVAR(vector), GVAR(fov), GVAR(focus)];

        _findTarget = {
            _ret = [];
            _screenPos = screenToWorld [0.5,0.5];
            _camPosASL = getPosASL _cam;
            _camPosReal = getPos _cam;
            _endPosASL = [_screenPos select 0, _screenPos select 1, getTerrainHeightASL _screenPos];
            _endPosReal = if (surfaceIsWater _endPosASL) then {_endPosASL} else {ASLtoATL _endPosASL};
            _objs = lineIntersectsWith [_camPosASL, _endPosASL, objNull, objNull, true];

            if (count _objs > 0) then { //if vehicle/object found
                _obj = _objs select (count _objs - 1);
                _ret = _obj;
            } else { //check for units near endpoint instead
                _units = allUnits;
                if (count _units > 0) then {
                    _nearestUnit = _units select 0;
                    {if (_endPosReal distance _x < _endPosReal distance _nearestUnit) then {_nearestUnit = _x}} forEach _units;
                    _intersect = [_nearestUnit, "FIRE"] intersect [_camPosReal, _endPosReal];
                    if (count (_intersect) > 0) then {
                        _ret = _nearestUnit;
                    } else { //check for units near camera instead
                        _nearestUnit = _units select 0;
                        {if (_cam distance _x < _cam distance _nearestUnit) then {_nearestUnit = _x}} forEach _units;
                        _intersect = [_nearestUnit, "FIRE"] intersect [_camPosReal, _endPosReal];
                        if (count _intersect > 0) then {
                            _ret = _nearestUnit;
                        } else { //if nothing else, point at ground position
                            _ret = _endPosReal;
                        };
                    };
                };
            };
            _ret
        };

        switch (_mode) do {

            case "Free": {
                GVAR(cameraOn) = true;
                GVAR(third) = false;
                detach _cam;
                player switchCamera "Internal";
                _cam cameraEffect ["Internal", "Back"];
                cameraEffectEnableHUD true;
                _dir = getDir _unit;
                _pos = [_unit, -5, _dir] call BIS_fnc_relPos;
                _pos set [2, ((getPos _unit) select 2) + 2];
                _cam setPos _pos;
                GVAR(vector) set [0, _dir];
                [_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
            };

            case "First": {
                if (_unit == player) exitWith {};
                GVAR(cameraOn) = false;
                GVAR(third) = false;
                _cam attachTo [vehicle _unit, [0,0.1,0]];
                _cam cameraEffect ["Terminate", "Back"];
                vehicle _unit switchCamera "Internal";
            };

            case "Third": {
                if (_unit == player) exitWith {};
                GVAR(third) = true;
                GVAR(cameraOn) = false;
                if (!difficultyEnabled "3rdPersonView") then {
                    player switchCamera "Internal";
                    _cam cameraEffect ["Internal", "Back"];
                    cameraEffectEnableHUD true;
                    if (vehicle _unit == _unit) then {
                        _cam attachTo [_unit, [0.1, -2.4, 0.6], "head"];
                    } else {
                        _cam attachTo [vehicle _unit, [0, -7, 1.5]];
                    };
                } else {
                    _cam attachTo [vehicle _unit, [0,0.1,0]];
                    _cam cameraEffect ["Terminate", "Back"];
                    vehicle _unit switchCamera "External";
                };
            };

            case "NewUnit": {

                _increment = _this select 1;
                _units = [];
                {
                    if (alive _x) then {_units pushBack _x};
                } forEach GVAR(units);

                _count = count _units;

                if (_count > 0) then {

                    _index = _units find _unit;
                    _index = _index + _increment;
                    if (_index < 0) then {_index = _count - 1};
                    if (_index > (_count - 1)) then {_index = 0};

                    GVAR(unit) = _units select _index;
                    if (!_camOn) then {["CameraMode", ["SwitchUnit"]] call FUNC(camera)};
                };
            };

            case "SwitchUnit": {
                if !GVAR(third) then {
                    ["CameraMode", ["First"]] call FUNC(camera);
                } else {
                    ["CameraMode", ["Third"]] call FUNC(camera);
                };
            };

            case "Lock": {
                if (_lock < 0) then {
                    _target = call _findTarget;

                    if (typeName _target == "OBJECT") then {
                        GVAR(lock) = [1, _target];
                    } else {
                        if (count _target > 0) then {
                            GVAR(lock) = [1, _target];
                        };
                    };

                    _cam camPrepareTarget (GVAR(lock) select 1);
                    _cam camCommitPrepared 0;
                    call FUNC(crosshair);
                } else {
                    _dir = getDir _cam;
                    _pitchBank = _cam call BIS_fnc_getPitchBank;
                    GVAR(lock) = [-1];
                    _cam cameraEffect ["Terminate", "Back"];
                    camDestroy _cam;
                    _cam = "Camera" camCreate (_camPos select 0);
                    [_cam, _camPos select 1] call BIS_fnc_setObjectRotation;
                    _cam camPrepareFOV (_camPos select 2);
                    _cam camPrepareFocus GVAR(focus);
                    _cam camCommitPrepared 0;
                    _cam cameraEffect ["Internal", "Back"];
                    cameraEffectEnableHUD true;
                    GVAR(cam) = _cam;
                    _obj = GVAR(attach);
                    if !(isNull _obj) then {
                        _modelPos = _obj worldToModel (_camPos select 0);
                        _cam attachTo [_obj, _modelPos];
                        _dir = _dir - getDir _obj;
                    };
                    GVAR(vector) = [_dir, _pitchBank select 0, 0];
                    [_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
                    call FUNC(crosshair);
                };
            };

            case "Attach": {
                _dir = getDir _cam;
                _pitchBank = _cam call BIS_fnc_getPitchBank;
                if (isNull GVAR(attach)) then {
                    _target = call _findTarget;
                    if (typeName _target == "OBJECT") then {
                        if (_target isKindOf "AllVehicles") then {
                            _dir = _dir - getDir _target;
                            _cam attachTo [_target];
                            GVAR(attach) = _target;
                            call FUNC(crosshair);
                        };
                    };
                } else {
                    detach _cam;
                    GVAR(attach) = objNull;
                    call FUNC(crosshair);
                };
                GVAR(vector) = [_dir, _pitchBank select 0, _pitchBank select 1];
                [_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
            };
        };

        call FUNC(crosshair);
    };

    //////////////////////////////////////////
    case "Exit": {

        if (["ace_nametags"] call EFUNC(common,isModLoaded)) then {
            EGVAR(nametags,showPlayerNames) = GVAR(tags) select 0;
            EGVAR(nametags,showNamesForAI) = GVAR(tags) select 1;
            GVAR(tags) = nil;
        };

        if (["ace_hearing"] call EFUNC(common,isModLoaded)) then {
            EGVAR(hearing,disableVolumeUpdate) = false;
        };

        if (["ace_interact_menu"] call EFUNC(common,isModLoaded)) then {
            [QGVAR(interactCondition)] call EFUNC(common,removeCanInteractWithCondition);
        };

        GVAR(cam) cameraEffect ["terminate", "back"];
        camUseNVG false;
        false SetCamUseTi 0;
        camDestroy GVAR(cam);
        clearRadio;

        //camera vars
        GVAR(noEscape) = nil;
        GVAR(cam) = nil;
        GVAR(vector) = nil;
        GVAR(fov) = nil;
        GVAR(vision) = nil;
        GVAR(moveScale) = nil;
        GVAR(cameraOn) = nil;
        GVAR(focus) = nil;
        GVAR(lock) = nil;
        GVAR(attach) = nil;
        GVAR(unit) = nil;
        GVAR(markers) = nil;
        GVAR(accTime) = nil;

        //mouse vars
        GVAR(mouseLeft) = nil;
        GVAR(mouseRight) = nil;
        GVAR(mouseBusy) = nil;

        //kb vars
        GVAR(keyCamMoveForward) = nil;
        GVAR(keyCamMoveBackward) = nil;
        GVAR(keyCamMoveLeft) = nil;
        GVAR(keyCamMoveRight) = nil;
        GVAR(keyCamMoveUp) = nil;
        GVAR(keyCamMoveDown) = nil;
        GVAR(keyCamRotDownLeft) = nil;
        GVAR(keyCamRotDown) = nil;
        GVAR(keyCamRotDownRight) = nil;
        GVAR(keyCamRotLeft) = nil;
        GVAR(keyCamRotRight) = nil;
        GVAR(keyCamRotUpLeft) = nil;
        GVAR(keyCamRotUp) = nil;
        GVAR(keyCamRotUpRight) = nil;
        GVAR(keyCamBankLeft) = nil;
        GVAR(keyCamBankRight) = nil;
        GVAR(keyFOVup) = nil;
        GVAR(keyFOVdown) = nil;
        GVAR(keyFocusUp) = nil;
        GVAR(keyFocusDown) = nil;
        GVAR(keyTimeAccUp) = nil;
        GVAR(keyTimeAccDown) = nil;
        GVAR(keyCamBankMod) = nil;
        GVAR(keyCamRotMore) = nil;
        GVAR(keyCamRotLess) = nil;

        _display = findDisplay 46;

        removeMissionEventHandler ["Draw3D", GVAR(ehDraw3D)];
        _display displayRemoveEventHandler ["keyDown", GVAR(ehKeyDown)];
        _display displayRemoveEventHandler ["mouseButtonDown", GVAR(ehMouseButtonDown)];
        _display displayRemoveEventHandler ["mouseButtonUp", GVAR(ehMouseButtonUp)];
        _display displayRemoveEventHandler ["mouseZChanged", GVAR(ehMouseZChanged)];
        _display displayRemoveEventHandler ["mouseMoving", GVAR(ehMouseMoving)];
        _display displayRemoveEventHandler ["mouseHolding", GVAR(ehMouseHolding)];
        GVAR(ehDraw3D) = nil;
        GVAR(ehMouseButtonDown) = nil;
        GVAR(ehMouseButtonUp) = nil;
        GVAR(ehMouseZChanged) = nil;
        GVAR(ehMouseMoving) = nil;
        GVAR(ehMouseHolding) = nil;

        _layers = missionNamespace getVariable ["BIS_fnc_rscLayer_list", []];

        for "_i" from 1 to (count _layers - 1) step 2 do {
            (_layers select _i) cutText ["", "Plain"];
        };

        if (!isMultiplayer) then {setAccTime 1};
        ACE_player switchCamera "Internal";
    };
};