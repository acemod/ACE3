/*
    Author:
    voiper, derived in part from BIS_fnc_camera by Karel Moricky

    Description:
    Spectator camera and UI.

    Arguments:
    0: Mode: "Init" is the only mission relevant one <String>
    1: <Array> (optional):
        0: Whether player can escape from camera (false for MP spectator; true for SP photography) <Bool>

    Example:
    ["Init", [false]] call ace_spectator_fnc_camera;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

disableSerialization;
_mode = _this select 0;
_this = _this select 1;

switch _mode do {

    case "Init": {

        GVAR(noEscape) = if (count _this > 0) then {_this select 0} else {false};

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
        _cam = "camera" camCreate _camPos;
        _cam setDir _camDir;
        _cam cameraEffect ["internal", "back"];
        _cam camSetFocus [-1, -1];
        _cam camCommit 0;
        showCinemaBorder false;
        cameraEffectEnableHUD true;
        setViewDistance 3000;

        //variables
        GVAR(cam) = _cam;
        GVAR(LMB) = false;
        GVAR(RMB) = false;
        GVAR(vector) = [_camDir, 0, 0];
        GVAR(fov) = 0.7;
        GVAR(vision) = 0;
        GVAR(moveScale) = 0.1;
        GVAR(cameraOn) = true;
        GVAR(focus) = [-1, -1];
        GVAR(lock) = [-1];
        GVAR(attach) = objNull;
        GVAR(unit) = objNull;
        GVAR(mouseBusy) = false;
        GVAR(markers) = 3;
        GVAR(accTime) = 1;
        GVAR(third) = false;

        //define only if doesn't exist (to preserve saved spots from a previous camera)
        if (isNil QGVAR(savedSpots)) then {
            GVAR(savedSpots) = [];
            for "_i" from 0 to 11 do {GVAR(savedSpots) set [_i, []]};
        };

        if (isNil QGVAR(savedUnits)) then {
            GVAR(savedUnits) = [];
            for "_i" from 0 to 9 do {GVAR(savedUnits) set [_i, objNull]};
        };

        GVAR(keys) = [];
        _DIKcodes = true call BIS_fnc_keyCode;
        _DIKlast = _DIKcodes select (count _DIKcodes - 1);
        for "_i" from 0 to (_DIKlast - 1) do {
            GVAR(keys) set [_i, false];
        };

        _display = findDisplay 46;

        GVAR(ehDraw3D) = addMissionEventhandler ["Draw3D", {['Draw3D', _this] call FUNC(draw3D)}];
        addMissionEventHandler ["Ended", {if (!isNil QGVAR(cam)) then {["Exit"] call FUNC(camera)}}];
        GVAR(ehKeyDown) = _display displayAddEventHandler ["keyDown", {['KeyDown', _this] call FUNC(camera)}];
        GVAR(ehKeyUp) = _display displayAddEventHandler ["keyUp", {['KeyUp', _this] call FUNC(camera)}];
        GVAR(ehMouseButtonDown) = _display displayAddEventHandler ["mouseButtonDown", {['MouseButtonDown', _this] call FUNC(camera)}];
        GVAR(ehMouseButtonUp) = _display displayAddEventHandler ["mouseButtonUp", {['MouseButtonUp',_this] call FUNC(camera)}];
        GVAR(ehMouseZChanged) = _display displayAddEventHandler ["mouseZChanged", {['MouseZChanged',_this] call FUNC(camera)}];
        GVAR(ehMouseMoving) = _display displayAddEventHandler ["mouseMoving", {['Mouse',_this] call FUNC(camera)}];
        GVAR(ehMouseHolding)  =_display displayAddEventHandler ["mouseHolding", {['Mouse',_this] call FUNC(camera)}];

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

        if (isClass (configFile >> "CfgPatches" >> "ace_nametags")) then {
            GVAR(tags) = [EGVAR(nametags,showPlayerNames), EGVAR(nametags,showNamesForAI)];
            EGVAR(nametags,showPlayerNames) = 0;
            EGVAR(nametags,showNamesForAI) = false;
        };

        if (isClass (configFile >> "CfgPatches" >> "ace_interact_menu")) then {
            [QGVAR(interactCondition), {false}] call EFUNC(common,addCanInteractWithCondition);
        };

        //add unit check, since if tracking were on it would already be present
        if !GVAR(tracking) then {
            [FUNC(checkUnits), 2] call CBA_fnc_addPerFrameHandler
        };

        [FUNC(cameraIntro), 1] call CBA_fnc_addPerFrameHandler;
    };

    //////////////////////////////////////////
    case "Mouse": {
        _mapOn = uiNamespace getVariable QGVAR(map);
        if (!isNull _mapOn) exitWith {};

        _keys = GVAR(keys);
        _cam = GVAR(cam);
        _dir = GVAR(vector) select 0;
        _pitch = GVAR(vector) select 1;
        _bank = GVAR(vector) select 2;
        _camPos = getPosASL _cam;
        _coef = (GVAR(moveScale) * (((getPosATL _cam) select 2) / 2)) min 50 max 0.001;

        _move = {
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

        if (GVAR(LMB) || GVAR(RMB)) then {
            if GVAR(mouseBusy) exitWith {};
            _mX = (_this select 1) * (GVAR(accTime) max 0.05);
            _mY = (_this select 2) * (GVAR(accTime) max 0.05);

            if GVAR(RMB) then {

                _dX = _mX;
                _dY = -_mY;

                _camPos = [_camPos, _dY, getDir _cam] call BIS_fnc_relPos;
                _camPos = [_camPos, _dX, getDir _cam + 90] call BIS_fnc_relPos;

                _camPos call _move;

            } else {
                if (GVAR(lock) select 0 > -1) exitWith {};
                _dX = _mX / 50 * 180 * GVAR(fov);
                _dY = -_mY / 50 * 180 * GVAR(fov);

                if (_keys select DIK_LSHIFT) then {
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

        _camMove = {
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

            _camPos call _move;
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

        _numPad0 = _keys select DIK_NUMPAD0;
        _numPadDel = _keys select DIK_DECIMAL;
        _rotMod = if (_numPad0 && !_numPadDel) then {
            5
        } else {
            if (!_numPad0 && _numPadDel) then {0.1} else {1};
        };

        if (_keys select DIK_W) then {[0,1,0] call _camMove};
        if (_keys select DIK_S) then {[0,-1,0] call _camMove};
        if (_keys select DIK_A) then {[-1,1,0] call _camMove};
        if (_keys select DIK_D) then {[1,1,0] call _camMove};

        if (_keys select DIK_Q) then {[0,0,1] call _camMove};
        if (_keys select DIK_Z) then {[0,0,-1] call _camMove};

        if (_keys select DIK_NUMPAD1) then {[-1,-1,0] call _camRotate};
        if (_keys select DIK_NUMPAD2) then {[+0,-1,0] call _camRotate};
        if (_keys select DIK_NUMPAD3) then {[+1,-1,0] call _camRotate};
        if (_keys select DIK_NUMPAD4) then {[-1,+0,0] call _camRotate};
        if (_keys select DIK_NUMPAD6) then {[+1,+0,0] call _camRotate};
        if (_keys select DIK_NUMPAD7) then {[-1,+1,0] call _camRotate};
        if (_keys select DIK_NUMPAD8) then {[+0,+1,0] call _camRotate};
        if (_keys select DIK_NUMPAD9) then {[+1,+1,0] call _camRotate};
        if (_keys select DIK_DIVIDE) then {[-1] call _camBank};
        if (_keys select DIK_MULTIPLY) then {[+1] call _camBank};

        if (_keys select DIK_ADD) then {
            GVAR(fov) = GVAR(fov) - (GVAR(fov) / 50 * _rotMod) max 0.01;
            _cam camPrepareFOV GVAR(fov);
            _cam camCommitPrepared 0;
        };
        if (_keys select DIK_SUBTRACT) then {
            GVAR(fov) = GVAR(fov) + (GVAR(fov) / 50 * _rotMod) min 2;
            _cam camPrepareFOV GVAR(fov);
            _cam camCommitPrepared 0;
        };

        if (_keys select DIK_NUMPADENTER) then {
            GVAR(fov) = 0.7;
            _cam camPrepareFOV GVAR(fov);
            _cam camCommitPrepared 0;
        };

        if (_keys select DIK_MINUS) then {
            _cur = GVAR(focus) select 0;
            if (_cur < 0) then {_cur = 1};
            _cur = _cur - (_cur / 25) max 0.25;
            GVAR(focus) = [_cur, 1.5];
            _cam camSetFocus GVAR(focus);
            _cam camCommit 0;
        };

        if (_keys select DIK_EQUALS) then {
            _cur = GVAR(focus) select 0;
            if (_cur < 0) then {_cur = 1};
            _cur = _cur + (_cur / 25) min 5000;
            GVAR(focus) = [_cur, 1.5];
            _cam camSetFocus GVAR(focus);
            _cam camCommit 0;
        };

        if (_keys select DIK_LBRACKET)then {
            if (!isMultiplayer) then {
                _cur = GVAR(accTime);
                _cur = _cur - (_cur / 25) max 0;
                GVAR(accTime) = _cur;
                setAccTime GVAR(accTime);
            };
        };

        if (_keys select DIK_RBRACKET)then {
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
        _mX = _this select 2;
        _mY = _this select 3;
        _shift = _this select 4;
        _ctrl = _this select 5;
        _alt = _this select 6;

        switch (_button) do {
            case 0: {GVAR(LMB) = true};
            case 1: {GVAR(RMB) = true};
        };
    };

    //////////////////////////////////////////
    case "MouseButtonUp": {
        _mapOn = uiNamespace getVariable QGVAR(map);
        if (!isNull _mapOn) exitWith {};

        _button = _this select 1;
        switch (_button) do {
            case 0: {GVAR(LMB) = false};
            case 1: {GVAR(RMB) = false};
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
    case "KeyDown": {
        _key = _this select 1;
        _shift = _this select 2;
        _ctrl = _this select 3;
        _alt = _this select 4;
        _return = false;

        GVAR(keys) set [_key, true];

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
                    ["Camera", ["Free"]] call FUNC(camera)
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
                    ["Camera", ["Lock"]] call FUNC(camera)
                };
                if (GVAR(unit) == _unit) then {
                    call _detach;
                    if (_camOn) then {
                        ["Camera", ["Third"]] call FUNC(camera);
                    } else {
                        ["Camera", ["SwitchUnit"]] call FUNC(camera);
                    };
                } else {
                    GVAR(unit) = _unit;
                    if ((GVAR(lock) select 0) > -1) then {["Camera", ["Lock"]] call FUNC(camera)};
                    if (!_camOn) then {
                        call _detach;
                        ["Camera", ["SwitchUnit"]] call FUNC(camera);
                    };
                };
            };
        };

        _detach = {
            if (!isNull GVAR(attach)) then {
                ["Camera", ["Attach"]] call FUNC(camera);
            };
        };

        switch (_key) do {

            case (DIK_F1): {if (_ctrl) then {[0] call _camSaveSpot} else {[0] call _camLoadSpot}; _return = true};
            case (DIK_F2): {if (_ctrl) then {[1] call _camSaveSpot} else {[1] call _camLoadSpot}; _return = true};
            case (DIK_F3): {if (_ctrl) then {[2] call _camSaveSpot} else {[2] call _camLoadSpot}; _return = true};
            case (DIK_F4): {if (_ctrl) then {[3] call _camSaveSpot} else {[3] call _camLoadSpot}; _return = true};
            case (DIK_F5): {if (_ctrl) then {[4] call _camSaveSpot} else {[4] call _camLoadSpot}; _return = true};
            case (DIK_F6): {if (_ctrl) then {[5] call _camSaveSpot} else {[5] call _camLoadSpot}; _return = true};
            case (DIK_F7): {if (_ctrl) then {[6] call _camSaveSpot} else {[6] call _camLoadSpot}; _return = true};
            case (DIK_F8): {if (_ctrl) then {[7] call _camSaveSpot} else {[7] call _camLoadSpot}; _return = true};
            case (DIK_F9): {if (_ctrl) then {[8] call _camSaveSpot} else {[8] call _camLoadSpot}; _return = true};
            case (DIK_F10): {if (_ctrl) then {[9] call _camSaveSpot} else {[9] call _camLoadSpot}; _return = true};
            case (DIK_F11): {if (_ctrl) then {[10] call _camSaveSpot} else {[10] call _camLoadSpot}; _return = true};
            case (DIK_F12): {if (_ctrl) then {[11] call _camSaveSpot} else {[11] call _camLoadSpot}; _return = true};

            case (DIK_1): {if (_ctrl) then {[0] call _camSaveUnit} else {[0] call _camLoadUnit}; _return = true};
            case (DIK_2): {if (_ctrl) then {[1] call _camSaveUnit} else {[1] call _camLoadUnit}; _return = true};
            case (DIK_3): {if (_ctrl) then {[2] call _camSaveUnit} else {[2] call _camLoadUnit}; _return = true};
            case (DIK_4): {if (_ctrl) then {[3] call _camSaveUnit} else {[3] call _camLoadUnit}; _return = true};
            case (DIK_5): {if (_ctrl) then {[4] call _camSaveUnit} else {[4] call _camLoadUnit}; _return = true};
            case (DIK_6): {if (_ctrl) then {[5] call _camSaveUnit} else {[5] call _camLoadUnit}; _return = true};
            case (DIK_7): {if (_ctrl) then {[6] call _camSaveUnit} else {[6] call _camLoadUnit}; _return = true};
            case (DIK_8): {if (_ctrl) then {[7] call _camSaveUnit} else {[7] call _camLoadUnit}; _return = true};
            case (DIK_9): {if (_ctrl) then {[8] call _camSaveUnit} else {[8] call _camLoadUnit}; _return = true};
            case (DIK_0): {if (_ctrl) then {[9] call _camSaveUnit} else {[9] call _camLoadUnit}; _return = true};

            case (DIK_NUMPAD5): {
                _dir = getDir _cam;
                if (!isNull GVAR(attach)) then {_dir = _dir - getDir GVAR(attach)};
                GVAR(vector) =  [_dir, 0, 0];
                [_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
                GVAR(fov) = 0.7;
                _cam camPrepareFOV GVAR(fov);
                _cam camCommitPrepared 0;
            };

            case (DIK_NUMPADENTER): {_return = true};

            case (DIK_NUMPAD0): {_return = true};

            case (DIK_DECIMAL): {_return = true};

            case (DIK_BACKSPACE): {
                GVAR(focus) = if (!_shift) then {
                    [-1, 1];
                } else {
                    [-1, -1];
                };
                _cam camPrepareFocus GVAR(focus);
                _cam camCommitPrepared 0;
                _return = true;
            };

            case (DIK_BACKSLASH): {
                if (!isMultiplayer) then {
                    GVAR(accTime) = 1;
                    setAccTime GVAR(accTime);
                };
            };

            case (DIK_GRAVE): {_return = true};

            case (DIK_SPACE): {
                if (!_camOn) exitWith {};
                if (_ctrl) then {
                    ["Camera", ["Attach"]] call FUNC(camera);
                } else {
                    ["Camera", ["Lock"]] call FUNC(camera);
                };
            };

            case (DIK_LEFT): {
                ["Camera", ["NewUnit", -1]] call FUNC(camera)
            };

            case (DIK_RIGHT): {
                ["Camera", ["NewUnit", 1]] call FUNC(camera)
            };

            case (DIK_UP): {
                if (isNull GVAR(unit)) exitWith {};
                if (_lock > -1) then {["Camera", ["Lock"]] call FUNC(camera)};
                call _detach;
                if (_camOn) then {
                    ["Camera", ["Third"]] call FUNC(camera);
                } else {
                    if GVAR(third) then {
                        ["Camera", ["First"]] call FUNC(camera);
                    };
                };
            };

            case (DIK_DOWN): {
                if (isNull GVAR(unit)) exitWith {};
                if (_lock > -1) then {["Camera", ["Lock"]] call FUNC(camera)};
                call _detach;
                if (!_camOn) then {
                    if !GVAR(third) then {
                        ["Camera", ["Third"]] call FUNC(camera);
                    } else {
                        ["Camera", ["Free"]] call FUNC(camera);
                    };
                };
            };

            case (DIK_T): {
                GVAR(markers) = GVAR(markers) + 1;
                if (GVAR(markers) > 3) then {GVAR(markers) = 0};
                if (GVAR(markers) == 0) then {clearRadio};
            };

            case (DIK_U): {
                _map = uiNameSpace getVariable [QGVAR(map), findDisplay 12202];
                if (!isNull _map) exitWith {};

                _overlay = uiNamespace getVariable [QGVAR(overlay), findDisplay 12200];
                if (isNull _overlay) then {
                    createDialog QGVAR(overlay);
                } else {
                    closeDialog 0;
                };
            };

            case (DIK_X): {
                _layer = [QGVAR(crosshair)] call BIS_fnc_rscLayer;
                _xhair = uiNamespace getVariable QGVAR(crosshair);
                if (isNull _xhair) then {
                    _layer cutRsc [QGVAR(crosshair), "PLAIN", 0, true];
                    call FUNC(crosshair);
                } else {
                    _layer cutText ["", "PLAIN"];
                };
            };

            case (DIK_C): {
                _layer = [QGVAR(compass)] call BIS_fnc_rscLayer;
                if (isNull (uiNamespace getVariable QGVAR(compass))) then {
                    _layer cutRsc [QGVAR(compass), "PLAIN", 0, true];
                } else {
                    _layer cutText ["", "PLAIN"];
                };

                _layer = [QGVAR(status)] call BIS_fnc_rscLayer;
                if (isNull (uiNamespace getVariable QGVAR(status))) then {
                    _layer cutRsc [QGVAR(status), "PLAIN", 0, true];
                } else {
                    _layer cutText ["", "PLAIN"];
                };
            };

            case (DIK_G): {
                _vd = uiNamespace getVariable [QGVAR(vd), findDisplay 12201];
                if (isNull _vd) then {
                    createDialog QGVAR(vd);
                } else {
                    closeDialog 0;
                }
            };

            case (DIK_H): {
                _layer = [QGVAR(help)] call BIS_fnc_rscLayer;
                if (isNull (uiNamespace getVariable QGVAR(help))) then {
                    _layer cutRsc [QGVAR(help), "PLAIN", 0, true];
                } else {
                    _layer cutText ["", "PLAIN"];
                };
            };

            case (DIK_M): {
                _map = uiNameSpace getVariable [QGVAR(map), findDisplay 12202];
                if (isNull _map) then {
                    createDialog QGVAR(map);
                } else {
                    closeDialog 0;
                };
            };

            case (DIK_N): {
                GVAR(vision) = GVAR(vision) + 1;
                if (GVAR(vision) > 4) then {GVAR(vision) = 0};
                switch GVAR(vision) do {
                    case 0: {
                        camUseNVG false;
                        false SetCamUseTi 0;
                    };
                    case 1: {
                        camUseNVG true;
                        false SetCamUseTi 0;
                    };
                    case 2: {
                        camUseNVG false;
                        true SetCamUseTi 0;
                    };
                    case 3: {
                        camUseNVG false;
                        true SetCamUseTi 1;
                    };

                    case 4: {
                        camUseNVG false;
                        true SetCamUseTi 4;
                    };
                };
            };

            case (DIK_ESCAPE): {
                if !GVAR(noEscape) then {
                    _return = true;
                    _this spawn {
                        disableSerialization;
                        _display = _this select 0;
                        _message = ["Do you want to exit spectator?", "ACE Spectator", nil, true, _display] call BIS_fnc_guiMessage;
                        if (_message) then {["Exit"] call FUNC(camera)};
                    };
                };
            };
            default {};
        };

        _return
    };

    //////////////////////////////////////////
    case "KeyUp": {
        GVAR(keys) set [_this select 1, false];
    };

    //////////////////////////////////////////
    case "Camera": {

        _mode = _this select 0;

        _cam = GVAR(cam);
        _camOn = GVAR(cameraOn);
        _unit = GVAR(unit);
        _lock = GVAR(lock) select 0;

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
                    if (!_camOn) then {["Camera", ["SwitchUnit"]] call FUNC(camera)};
                };
            };

            case "SwitchUnit": {
                if !GVAR(third) then {
                    ["Camera", ["First"]] call FUNC(camera);
                } else {
                    ["Camera", ["Third"]] call FUNC(camera);
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
                    _cam = "camera" camCreate (_camPos select 0);
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
    case "Help": {

        _dialog = _this;

_c1Action = parseText "<t align='left'>
<t underline='true'>Camera:</t><br />
<br />
Move<br />
Pitch, Yaw<br />
Roll<br />
Slide<br />
Speed Multiplier<br />
Camera Mode<br />
Track Pos or Object<br />
Lock to Object<br />
Save Pos<br />
Recall Pos<br />
Optic Mode<br />
Focus<br />
Autofocus<br />
Disable Focus<br />
Pitch and Yaw<br />
Roll<br />
Pitch/Roll Reset<br />
Zoom<br />
Reset Zoom<br />
Pitch/Yaw/Roll/Zoom Fast<br />
Pitch/Yaw/Roll/Zoom Slow<br />
</t>
";

_c1Control = parseText "<t align='left'>
<br />
<br />
W, A, S, D<br />
LMB + Mouse<br />
Shift + LMB + Mouse<br />
RMB + Mouse<br />
MouseWheel Up, Down<br />
Arrow Up, Down<br />
Space<br />
Ctrl + Space<br />
Ctrl + F1...F12<br />
F1...F12<br />
N<br />
Keyboard - and +<br />
Backspace<br />
Shift + Backspace<br />
Numpad 1...9<br />
Numpad / and *<br />
Numpad 5<br />
Numpad - and +<br />
Numpad Enter<br />
Numpad 0<br />
Numpad Decimal<br />
</t>
";

_c2Action = parseText "<t align='left'>
<t underline='true'>Units:</t><br />
<br />
Cycle Unit<br />
Save Unit<br />
Recall Unit<br />
Unit List<br />
<br />
<t underline='true'>Display:</t><br />
<br />
Toggle Crosshair<br />
Toggle Status Bar<br />
View Distance Dialog<br />
Cycle Marker Mode<br />
Toggle Help<br />
</t>
";

_c2Control = parseText "<t align='left'>
<br />
<br />
Arrow Left, Right<br />
Ctrl + 1...10<br />
1...10<br />
U<br />
<br />
<br />
<br />
X<br />
C<br />
G<br />
T<br />
H<br />
</t>
";

if (!isMultiplayer) then {

_add1 = parseText "<t align='left'>
<br />
<t underline='true'>Time:</t><br />
<br />
Faster, Slower<br />
Reset
</t>
";

_add2 = parseText "<t align='left'>
<br />
<br />
<br />
[ and ]<br />
\<br />
</t>
";

    _c2Action = composeText [_c2Action, _add1];
    _c2Control = composeText [_c2Control, _add2];
};

        (_dialog displayCtrl 1) ctrlSetStructuredText _c1Action;
        (_dialog displayCtrl 2) ctrlSetStructuredText _c1Control;
        (_dialog displayCtrl 3) ctrlSetStructuredText _c2Action;
        (_dialog displayCtrl 4) ctrlSetStructuredText _c2Control;
    };

    //////////////////////////////////////////
    case "Exit": {

        if (isClass (configFile >> "CfgPatches" >> "ace_nametags")) then {
            EGVAR(nametags,showPlayerNames) = GVAR(tags) select 0;
            EGVAR(nametags,showNamesForAI) = GVAR(tags) select 1;
            GVAR(tags) = nil;
        };

        if (isClass (configFile >> "CfgPatches" >> "ace_hearing")) then {
            EGVAR(hearing,disableVolumeUpdate) = false;
        };

        if (isClass (configFile >> "CfgPatches" >> "ace_interact_menu")) then {
            [QGVAR(interactCondition)] call EFUNC(common,removeCanInteractWithCondition);
        };

        GVAR(cam) cameraEffect ["terminate", "back"];
        camUseNVG false;
        false SetCamUseTi 0;
        camDestroy GVAR(cam);
        clearRadio;

        GVAR(noEscape) = nil;
        GVAR(cam) = nil;
        GVAR(LMB) = nil;
        GVAR(RMB) = nil;
        GVAR(vector) = nil;
        GVAR(fov) = nil;
        GVAR(vision) = nil;
        GVAR(moveScale) = nil;
        GVAR(cameraOn) = nil;
        GVAR(focus) = nil;
        GVAR(lock) = nil;
        GVAR(attach) = nil;
        GVAR(unit) = nil;
        GVAR(mouseBusy) = nil;
        GVAR(markers) = nil;
        GVAR(keys) = nil;
        GVAR(accTime) = nil;

        _display = findDisplay 46;

        removeMissionEventHandler ["Draw3D", GVAR(ehDraw3D)];
        _display displayRemoveEventHandler ["keyDown", GVAR(ehKeyDown)];
        _display displayRemoveEventHandler ["keyUp", GVAR(ehKeyUp)];
        _display displayRemoveEventHandler ["mouseButtonDown", GVAR(ehMouseButtonDown)];
        _display displayRemoveEventHandler ["mouseButtonUp", GVAR(ehMouseButtonUp)];
        _display displayRemoveEventHandler ["mouseZChanged", GVAR(ehMouseZChanged)];
        _display displayRemoveEventHandler ["mouseMoving", GVAR(ehMouseMoving)];
        _display displayRemoveEventHandler ["mouseHolding", GVAR(ehMouseHolding)];
        GVAR(ehDraw3D) = nil;
        GVAR(ehKeyDown) = nil;
        GVAR(ehKeyUp) = nil;
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
