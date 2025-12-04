#include "..\script_component.hpp"
/*
 * Author: commy2, esteldunedain, Drift_91
 * Draw the nametag and rank icon.
 *
 * Arguments:
 * 0: Unit (Player) <OBJECT>
 * 1: Target <OBJECT>
 * 2: Alpha <NUMBER>
 * 3: Height offset <NUMBER>
 * 4: Draw name <BOOL>
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

TRACE_1("drawName:",_this);

params ["", "_target", "", "_heightOffset"];

private _fnc_parameters = {
    params ["_player", "_target", "_alpha", "_heightOffset", "_drawName", "_drawRank", "_drawSoundwave"];

    //Set Icon:
    private _targetIcon = _target getVariable QGVAR(rankIcon);

    private _icon = switch true do {
        case _drawSoundwave: {
            format [QPATHTOF(UI\soundwave%1.paa), floor random 10]
        };

        case !_drawRank: {""};
        case !isNil "_targetIcon": {_targetIcon};
        case (rank _target == ""): {""};

        default {
            private _targetFaction = _target getVariable [QGVAR(faction), faction _target];
            private _customRankIcons = GVAR(factionRanks) get _targetFaction;

            if (isNil "_customRankIcons") then {
                // default rank icons
                format ["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _target] // return
            } else {
                _customRankIcons param [ALL_RANKS find rank _target, ""] // return
            };
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
        _scale,
        _scale,
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
