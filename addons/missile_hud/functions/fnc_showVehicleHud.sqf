#include "..\script_component.hpp"
/*
 * Author: PabstMirror, tcvm
 * Shows the missile info hud when data is available to be shown.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call ace_missile_hud_fnc_showVehicleHud
 *
 * Public: No
 */

params ["_player"];
TRACE_1("showHud",_player);

if !(alive _player) exitWith {TRACE_1("Disabled - Not Alive",_player);};

private _vehicle = vehicle _player;
private _turretPath = _vehicle unitTurret _player;
private _weapon = [_player, _vehicle, _turretPath] call FUNC(getCurrentWeapon);
private _enabled = -1 != GVAR(generators) findIf { [_player, _vehicle, _weapon] call (_x select 0) };

if ((!_enabled) && (GVAR(pfID) < 0)) exitWith {TRACE_2("Disabled - No Change",_enabled,GVAR(pfID));};

TRACE_2("Cleaning up old pfeh and display",_enabled,GVAR(pfID));
[GVAR(pfID)] call CBA_fnc_removePerFrameHandler;
if (!isNull (uiNamespace getVariable [QGVAR(display), displayNull])) then {
    ([QGVAR(infoDisplay)] call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
};
GVAR(pfID) = -1;

if (!_enabled) exitWith {TRACE_2("Disabled - Now Off",_enabled,GVAR(pfID));};

TRACE_2("Enabled - Adding PFEH",_enabled,GVAR(pfID));

private _adjustDown = [_player, _vehicle, _turretPath] call FUNC(shouldAdjustHud);

TRACE_4("",_adjustDown,_player,_vehicle,_turretPath);

private _generators = GVAR(generators) select { [_player, _vehicle] call (_x select 0) };
_generators = _generators apply {
    _x params ["", "_setup", "_generator"];
    [_generator, [_player, _vehicle] call _setup]
};

TRACE_2("Running - Some generators are valid",count _generators,count GVAR(generators));

private _linePosition = [
    getNumber (GVAR(config_line) >> "x"),
    getNumber (GVAR(config_line) >> "y") + GVAR(lineHeight)
];

GVAR(pfID) = [{
    params ["_args", "_pfID"];
    _args params ["_generators", "_adjustDown", "_player", "_vehicle", "_weapon", "_basePosition"];

    // Restart display if null (not just at start, this will happen periodicly)
    if (isNull (uiNamespace getVariable [QGVAR(display), displayNull])) then {
        TRACE_1("creating display",_this);
        ([QGVAR(infoDisplay)] call BIS_fnc_rscLayer) cutRsc [QGVAR(infoDisplay), "PLAIN", 1, false];
        if (_adjustDown) then {
            _basePosition set [1, (_basePosition select 1) + GVAR(lineHeight)];
            _args set [5, _basePosition];
        };
    };
    private _display = uiNamespace getVariable [QGVAR(display), displayNull];
    if (isNull _display) exitWith {
        TRACE_1("Aborting - Display is null, somehow?",_display);
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };
    private _lines = _display getVariable [QGVAR(lines), []];
    {
        ctrlDelete _x;
    } forEach _lines;

    private _elements = [];
    {
        _x params ["_generator", "_params"];
        private _group = [_player, _vehicle, _weapon, _params] call _generator;

        if (isNil "_group") then { TRACE_1("Skipping - generator returned null group",_generator); continue; };
        if !(_group isEqualType []) then { TRACE_1("Skipping - generator did not return array",_group); continue; };
        if (_group isEqualTo []) then { TRACE_1("Skipping - generator did not return any elements",_group); continue; };
        if ((_group select 0) isEqualType "") then {
            if !([_group] call FUNC(isElementValid)) then { TRACE_1("Skipping - Some element is not valid",_group); continue; };
            _elements pushBack [_group];
        } else {
            if (-1 != _group findIf { !([_x] call FUNC(isElementValid)) }) then { TRACE_1("Skipping - Some element is not valid",_group); continue; };
            _elements pushBack _group;
        };
    } forEach _generators;

    _lines = [];
    private _linePosition = +_basePosition;
    {
        // Create new line
        private _line = _display ctrlCreate [GVAR(config_line), -1];
        _line ctrlShow true;
        _line ctrlSetPosition _linePosition;
        _line ctrlCommit 0;

        private _drawPosition = [0, 0];
        private _nonOverflowIndex = 0;
        {
            private _control = [_display, _line, _x] call FUNC(createCtrlFromElement);
            private _width = ctrlTextWidth _control;
            _width = ceil (_width / GVAR(itemWidth)) * GVAR(itemWidth);

            // If we overflow, create a new line for next element
            // If we are the first element being added, add us to the row. Otherwise, dont
            if (_forEachIndex != _nonOverflowIndex && (_drawPosition select 0) + _width > GVAR(lineWidth)) then {
                ctrlDelete _control;

                _linePosition = _linePosition vectorAdd [0, GVAR(lineHeight)];
                _lines pushBack _line;

                _line = _display ctrlCreate [GVAR(config_line), -1];
                _line ctrlShow true;
                _line ctrlSetPosition _linePosition;
                _line ctrlCommit 0;

                _control = [_display, _line, _x] call FUNC(createCtrlFromElement);
                _width = ctrlTextWidth _control;
                _nonOverflowIndex = _forEachIndex + 1;

                _drawPosition = [0, 0];
            };
            _control ctrlSetPosition _drawPosition;
            _control ctrlSetPositionW _width;
            _control ctrlShow true;
            _control ctrlCommit 0;
            _drawPosition = _drawPosition vectorAdd [_width, 0];
        } forEach _x;
        _lines pushBack _line;

        _linePosition = _linePosition vectorAdd [0, GVAR(lineHeight)];
    } forEach _elements;

    _display setVariable [QGVAR(lines), _lines];
}, (HUD_UPDATE_RATE), [_generators, _adjustDown, _player, _vehicle, _weapon, _linePosition]] call CBA_fnc_addPerFrameHandler;
