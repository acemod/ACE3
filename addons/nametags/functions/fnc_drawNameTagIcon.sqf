#include "script_component.hpp"
/*
 * Author: commy2, esteldunedain
 * Draw the nametag and rank icon.
 *
 * Arguments:
 * 0: Unit (Player) <OBJECT>
 * 1: Target <OBJECT>
 * 2: Alpha <NUMBER>
 * 4: Height offset <NUMBER>
 * 5: Draw name <BOOL>
 * 5: Draw rank <BOOL>
 * 6: Draw soundwave <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, bob, 0.5, height, true, true, true] call ace_nametags_fnc_drawNameTagIcon
 *
 * Public: No
 */

TRACE_1("drawName:", _this);

params ["", "_target", "", "_heightOffset"];

_fnc_parameters = {
    params ["_player", "_target", "_alpha", "_heightOffset", "_drawName", "_drawRank", "_drawSoundwave"];

    //Set Icon:
    private _icon = "";
    private _size = 0;
    if (_drawSoundwave) then {
        _icon = format [QPATHTOF(UI\soundwave%1.paa), floor random 10];
        _size = 1;
    } else {
        if (_drawRank && {rank _target != ""}) then {
            _icon = GVAR(factionRanks) getVariable (_target getVariable [QGVAR(faction), faction _target]);
            if (!isNil "_icon") then {
                _icon = _icon param [ALL_RANKS find rank _target, ""];
            } else {
                _icon = format ["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _target];
            };
            _size = 1;
        };
    };

    //Set Text:
    private _name = if (_drawName) then {
        [_target, true, true] call EFUNC(common,getName)
    } else {
        ""
    };

    //Set Color:
    private _color = [1, 1, 1, _alpha];
    if ((group _target) != (group _player)) then {
        _color = +GVAR(defaultNametagColor); //Make a copy, then multiply both alpha values (allows client to decrease alpha in settings)
    } else {
        _color = +([
            GVAR(nametagColorMain),
            GVAR(nametagColorRed),
            GVAR(nametagColorGreen),
            GVAR(nametagColorBlue),
            GVAR(nametagColorYellow)
        ] select (
            (["MAIN", "RED", "GREEN", "BLUE", "YELLOW"] find ([assignedTeam _target] param [0, "MAIN"])) max 0
        ));
    };
    _color set [3, (_color select 3) * _alpha];

    private _scale = [0.333, 0.5, 0.666, 0.83333, 1] select GVAR(tagSize);

    [
        _icon,
        _color,
        [],
        (_size * _scale),
        (_size * _scale),
        0,
        _name,
        2,
        (0.05 * _scale),
        "RobotoCondensed"
    ]
};

private _parameters = [_this, _fnc_parameters, _target, QGVAR(drawParameters), 0.1] call EFUNC(common,cachedCall);
_parameters set [2, _target modelToWorldVisual ((_target selectionPosition "pilot") vectorAdd [0,0,(_heightOffset + .3)])];


drawIcon3D _parameters;
