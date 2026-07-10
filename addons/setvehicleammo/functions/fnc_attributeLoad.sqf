#include "..\script_component.hpp"

params ["_control", "_loadoutValue"];
TRACE_2("params",_control,_loadoutValue);

GVAR(turretMagsArray) = [];
GVAR(defaultLoad) = [];
GVAR(deltaLoad) = [];
GVAR(selectedTurretPath) = [];
GVAR(selectedTreePath) = [];
GVAR(selectedMagazine) = "";


//Parse string into a delta loadout array:
if (_loadoutValue isEqualTo true) then {_loadoutValue = ""}; //why?
if (_loadoutValue != "") then {
    _loadoutValue = call compile _loadoutValue;
    if (_loadoutValue isEqualType []) then {
        GVAR(deltaLoad) = _loadoutValue;
    };
};

private _entity = (get3DENSelected "object") select 0;
TRACE_2("",_entity,typeOf _entity);

private _enableLBChangedEH = {
    params ["_control", "_selection"];
    TRACE_2("lbChanged eh",_control,_selection);
    if (_selection == 0) then {
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 101) ctrlEnable false;
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 101) ctrlSetFade 0.5;
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 101) ctrlCommit 0;
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlEnable false;
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlSetFade 0.5;
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlCommit 0;
    } else {
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 101) ctrlEnable true;
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 101) ctrlSetFade 0;
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 101) ctrlCommit 0;
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlEnable true;
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlSetFade 0;
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlCommit 0;
    };
};
(_control controlsGroupCtrl 100) ctrlAddEventHandler ["ToolBoxSelChanged", _enableLBChangedEH];

if (GVAR(deltaLoad) isEqualTo []) then {
    (_control controlsGroupCtrl 100) lbSetCurSel 0;
    ((ctrlParentControlsGroup _control) controlsGroupCtrl 101) ctrlEnable false;
    ((ctrlParentControlsGroup _control) controlsGroupCtrl 101) ctrlSetFade 0.5;
    ((ctrlParentControlsGroup _control) controlsGroupCtrl 101) ctrlCommit 0;
    ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlEnable false;
    ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlSetFade 0.5;
    ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlCommit 0;

} else {
    (_control controlsGroupCtrl 100) lbSetCurSel 1;
};

private _treeSelChangedEH = {
    params ["_control", "_newPath"];
    TRACE_2("lbChanged eh",_control,_newPath);

    private _mag = GVAR(turretMagsArray);
    private _path = [];
    {
        _mag = _mag select _x;
        if (_forEachIndex == 0) then {
            _path = _mag select 0;
            _mag = _mag select 1;
        };
    } forEach _newPath;
    TRACE_1("",_mag);

    if (_mag isEqualType "") then {
        GVAR(selectedTurretPath) = _path;
        GVAR(selectedMagazine) = _mag;
        GVAR(selectedTreePath) = _newPath;
        private _magCount = 0;
        {
            _x params ["_xPath", "_xMag", "_xCount"];
            if ((_xPath isEqualTo GVAR(selectedTurretPath)) && {_xMag == GVAR(selectedMagazine)}) exitWith {
                _magCount = _xCount;
            };
        } forEach GVAR(defaultLoad);
        {
            _x params ["_xPath", "_xMag", "_xCount"];
            if ((_xPath isEqualTo GVAR(selectedTurretPath)) && {_xMag == GVAR(selectedMagazine)}) exitWith {
                _magCount = _magCount + _xCount;
            };
        } forEach GVAR(deltaLoad);

        ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) sliderSetRange [0, 10];
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) sliderSetPosition _magCount;

        ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlEnable true;
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlSetFade 0;
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlCommit 0;
    } else {
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlEnable false;
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlSetFade 1;
        ((ctrlParentControlsGroup _control) controlsGroupCtrl 102) ctrlCommit 0;
    };
};
(_control controlsGroupCtrl 101) ctrlAddEventHandler ["TreeSelChanged", _treeSelChangedEH];

private _sliderChangedEH = {
    params ["_control", "_sliderValue"];
    TRACE_2("lbChanged eh",_control,_sliderValue);

    _sliderValue = (round (_sliderValue * 10)) / 10;

    private _defaultCount = 0;
    {
        _x params ["_xPath", "_xMag", "_xCount"];
        if ((_xPath isEqualTo GVAR(selectedTurretPath)) && {_xMag == GVAR(selectedMagazine)}) exitWith {
            _defaultCount = _xCount;
        };
    } forEach GVAR(defaultLoad);

    private _delta = _sliderValue - _defaultCount;
    private _found = false;
    {
        _x params ["_xPath", "_xMag", "_xCount"];
        if ((_xPath isEqualTo GVAR(selectedTurretPath)) && {_xMag == GVAR(selectedMagazine)}) exitWith {
            _found = true;
            _x set [2, _delta];
        };
    } forEach GVAR(deltaLoad);
    if (!_found) then {
        GVAR(deltaLoad) pushBack [GVAR(selectedTurretPath), GVAR(selectedMagazine), _delta];
    };

    TRACE_3("",_delta,GVAR(selectedMagazine),GVAR(selectedTreePath));

    private _rounds = round (_sliderValue * getNumber (configFile >> "CfgMagazines" >> GVAR(selectedMagazine) >> "count"));
    private _text = format ["%1 [%2x = %3rnds]", GVAR(selectedMagazine), _sliderValue, _rounds];
    ((ctrlParentControlsGroup _control) controlsGroupCtrl 101) tvSetText [GVAR(selectedTreePath), _text];
};
(_control controlsGroupCtrl 102) ctrlAddEventHandler ["SliderPosChanged", _sliderChangedEH];


private _config = configFile >> "CfgVehicles" >> (typeOf _entity);
private _turrets = allTurrets _entity;
TRACE_1("",_turrets);


private _addWeaponSystem = {
    params ["_config", "_path", "_name"];
    private _weapons = getArray (_config >> "weapons");
    private _magazines = getArray (_config >> "magazines");
    TRACE_3("",_weapons,_magazines,_config);
    if (_weapons isEqualTo []) exitWith {};

    {
        private _magToAdd = _x;
        private _found = false;
        {
            _x params ["_xPath", "_xMag", "_xCount"];
            if ((_xPath isEqualTo _path) && {_xMag == _magToAdd}) exitWith {
                _found = true;
                _x set [2, (_xCount + 1)];
            };
        } forEach GVAR(defaultLoad);
        if (!_found) then {
            GVAR(defaultLoad) pushBack [_path, _magToAdd, 1];
        };
    } forEach _magazines;

    private _tvIndexTurret = (_control controlsGroupCtrl 101) tvAdd [ [], _name];
    (_control controlsGroupCtrl 101) tvExpand [_tvIndexTurret];

    private _index = GVAR(turretMagsArray) pushBack [_path, []];

    {
        private _weapon = _x;
        private _muzzles = getArray (configFile >> "CfgWeapons" >> _weapon >> "muzzles");
        private _weaponMagazines = compatibleMagazines _weapon;

        ((GVAR(turretMagsArray) select _index) select 1) pushBack _weaponMagazines;

        {
            if (_x != "this") then {
                _weaponMagazines append (getArray (configFile >> "CfgWeapons" >> _weapon >> _x >> "magazines"));
            };
            false
        } count _muzzles;

        private _tvIndexWeapon = (_control controlsGroupCtrl 101) tvAdd [[_tvIndexTurret], _x];
        (_control controlsGroupCtrl 101) tvExpand [_tvIndexTurret, _tvIndexWeapon];
        {
            private _magToAdd = _x;
            private _magCount = 0;
            {
                _x params ["_xPath", "_xMag", "_xCount"];
                if ((_xPath isEqualTo _path) && {_xMag == _magToAdd}) exitWith {
                    _magCount = _xCount;
                };
            } forEach GVAR(defaultLoad);
            {
                _x params ["_xPath", "_xMag", "_xCount"];
                if ((_xPath isEqualTo _path) && {_xMag == _magToAdd}) exitWith {
                    _magCount = _magCount + _xCount;
                };
            } forEach GVAR(deltaLoad);

            private _rounds = round (_magCount * getNumber (configFile >> "CfgMagazines" >> _magToAdd >> "count"));
            private _text = format ["%1 [%2x = %3rnds]", _magToAdd, _magCount, _rounds];
            (_control controlsGroupCtrl 101) tvAdd [[_tvIndexTurret, _tvIndexWeapon], _text];
        } forEach _weaponMagazines;
    } forEach _weapons;
};

[_config, [-1], "Pilot"] call _addWeaponSystem;

{
    private _turretConfig = [_config, _x] call ace_common_fnc_getTurretConfigPath;
    TRACE_2("",_x,_turretConfig);
    [_turretConfig, _x, (format ["Turret %1", _x])] call _addWeaponSystem;
} forEach _turrets;
