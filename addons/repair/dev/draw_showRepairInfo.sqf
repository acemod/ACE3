// PabstMirror
// [] execVM "\z\ace\addons\repair\dev\draw_showRepairInfo.sqf";

#include "\z\ace\addons\repair\script_component.hpp"

addMissionEventHandler ["Draw3D", {
    if !((cursorObject isKindOf "Car") || (cursorObject isKindOf "Tank") || (cursorObject isKindOf "Air")) exitWith {};
    private _config = configFile >> "CfgVehicles" >> (typeOf cursorObject);

    private _hitpointPositions = getArray (_config >> QGVAR(hitpointPositions));
    private _hitpointGroups = getArray (_config >> QGVAR(hitpointGroups));

    (getAllHitPointsDamage cursorObject) params [["_hitPoints", []], ["_hitSelections", []]];
    ([cursorObject] call FUNC(getWheelHitPointsWithSelections)) params ["_wheelHitPoints", "_wheelHitSelections"];

    private _output = [];
    
    {
        private _selection = _x;
        private _hitpoint = _hitPoints select _forEachIndex;

        if ((_selection != "") && {_hitPoint != ""}) then {
            if (((toLower _hitPoint) find "glass") != -1) exitWith {};

            private _info = "";
            private _color = [1,0,0,1];
            if (_selection in _wheelHitSelections) then {
                _info = _info + "[Wheel]";
                _color = [0,1,0,1];
            };
            if (!((getText (_config>> "HitPoints" >> _hitpoint >> "depends")) in ["", "0"])) then {
                _info = _info + format ["[depends: %1]", getText (_config>> "HitPoints" >> _hitpoint >> "depends")];
                _color = [0,0,1,1]
            };

            private _position = cursorObject selectionPosition [_selection, "HitPoints"];
            {
                _x params ["_hit", "_pos"];
                if (_hitpoint == _hit) exitWith {
                    _info = _info + format ["[hitPos: %1]", _pos];
                    if (_pos isEqualType []) exitWith {
                        _position = _pos;
                    };
                    if (_pos isEqualType "") exitWith {
                        _position = cursorObject selectionPosition [_pos, "HitPoints"];
                    };
                };
            } forEach _hitpointPositions;

            private _parentHitpoint = "";
            {
                private _xParent = _x select 0;
                {
                    if (_hitpoint == _x) exitWith {
                        _info = _info + format ["[Parent: %1]", _xParent];
                        _parentHitpoint = _xParent;
                    };
                } forEach (_x select 1);
            } forEach _hitpointGroups;

            if (_parentHitpoint == "") then {
                drawIcon3D ["", _color, (cursorObject modelToWorld _position), 0.5, 0.5, 0, format ["%1 [%2]", _hitpoint, _selection], 0.5, 0.025, "TahomaB"];
            };
            _output pushBack format ["%1: %2[%3] = %4", _forEachIndex, _hitPoint, _selection, cursorObject getHitIndex _forEachIndex];
            _output pushBack format ["- %1 -",_info];
        };
    } forEach _hitSelections;
    hintSilent (_output joinString "\n");
}];
