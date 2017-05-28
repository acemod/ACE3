#include "script_component.hpp"

PARAMS_1(_vehicle);

_typeOfVehicle = (typeOf _vehicle);

_config = configFile >> "CfgVehicles" >> _typeOfVehicle;
_modelGround = ((boundingBoxReal _vehicle) select 0) select 2;

_cargoIndexes = [];
_proxyOrder = getArray (_config >> "getInProxyOrder");
_cargoProxyIndexes = getArray (_config >> "cargoProxyIndexes");
_cargoIsCoDriver = getArray (_config >> "cargoIsCoDriver");
_transportSoldier = getNumber (_config >> "transportSoldier");
_realCargoCount = if (isArray (_config >> "getInProxyOrder")) then {count _proxyOrder} else {_transportSoldier};
_memoryPointsGetInCargo = if (isArray (_config >> "memoryPointsGetInCargo")) then {getArray (_config >> "memoryPointsGetInCargo")} else {[getText (_config >> "memoryPointsGetInCargo")]};

_placedPositions = [];
_fncGetNicePosition = {
    PARAMS_1(_memName);
    _entryPos = _vehicle selectionPosition _memPointGetin;
    EXPLODE_3_PVT(_entryPos,_xPos,_yPos,_zPos);

    //If pos on the ass-end of the vehicle, shift in
    if ((_yPos > 1) && {abs(_xPos) < 0.25}) then {
        _yPos = (_yPos - 1) max 0;
    } else {

        if (_xPos > 0) then {
            _xPos = _xPos min 1;
        } else {
            _xPos = _xPos max -1;
        };
    };
    _zPos = _zPos + 1.2;
    _newPos = [_xPos, _yPos, _zPos];
    _keepCheckingForCollisions = true;
    while {_keepCheckingForCollisions} do {
        _keepCheckingForCollisions = false;
        {
            if ((vectorMagnitude (_x vectorDiff _newPos)) < 0.1) exitWith {
                systemChat format ["Clossiong %1 - %2", _x, _newPos];
                _keepCheckingForCollisions = true;
                _zPos = _zPos + 0.1;
                _newPos = [_xPos, _yPos, _zPos];
            };
        } forEach _placedPositions;
    };
    _placedPositions pushBack _newPos;

    _newPos
};



//Add Driver Action:
if (isText (_config >> "memoryPointsGetInDriver")) then {
    _memPointGetin = getText (_config >> "memoryPointsGetInDriver");
    _getInParams = ["driver", _memPointGetin, [-1]];
    _actionName = format ["getInDriver"];
    _displayName = "";
    _icon = "";
    if (_typeOfVehicle isKindOf "Air") then {
        _displayName =  "Get In Pilot";
        _icon = "\A3\ui_f\data\igui\cfg\actions\getinpilot_ca.paa";
    } else {
        _displayName = localize "STR_ACE_GetIn_Driver";
        _icon = "\A3\ui_f\data\igui\cfg\actions\getindriver_ca.paa";
    };
    _entryPos = [_memPointGetin] call _fncGetNicePosition;
    _action = [_actionName, _displayName, _icon, {_this call FUNC(doGetIn)}, {_this call FUNC(canGetIn)}, {}, _getInParams, _entryPos, 6] call EFUNC(interact_menu,createAction);
    _path = [_typeOfVehicle, 0, [], _action] call EFUNC(interact_menu,addActionToClass);
};

//Add Turret Actions (including FFV):
{
    _turretPath = _x;
    _turretConfig = [_config, _turretPath] call EFUNC(common,getTurretConfigPath);
    if (isText (_turretConfig >> "memoryPointsGetInGunner")) then {
        _memPointGetin = getText (_turretConfig >> "memoryPointsGetInGunner");
        _isCargoProxy = ((getText (_turretConfig >> "proxyType")) == "CPCargo") && {isNumber (_turretConfig >> "proxyIndex")};
        _getInParams = ["turret", _memPointGetin, _x];

        _displayName = "";
        _icon = "";

        if (_isCargoProxy) then {
            _proxyCargoIndex = getNumber (_turretConfig >> "proxyIndex");
            _cargoIndex = _proxyOrder find _proxyCargoIndex;
            _cargoIndexes pushBack _cargoIndex;
            // _getInParams = ["cargo", _memPointGetin, [_cargoIndex]];

            _displayName = format [(localize "STR_ACE_GetIn_FFV"), getText (_turretConfig >> "gunnerName")];
            _icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryweapon_ca.paa";
        } else {
            _displayName = format [(localize "STR_ACE_GetIn_GetIn"), getText (_turretConfig >> "gunnerName")];
            _icon = "\A3\ui_f\data\igui\cfg\actions\getingunner_ca.paa";
        };

        _actionName = format ["getInTurret_%1", _turretPath];
        _entryPos = [_memPointGetin] call _fncGetNicePosition;

        _action = [_actionName, _displayName, _icon, {_this call FUNC(doGetIn)}, {_this call FUNC(canGetIn)}, {}, _getInParams, _entryPos, 6] call EFUNC(interact_menu,createAction);
        _path = [_typeOfVehicle, 0, [], _action] call EFUNC(interact_menu,addActionToClass);
    };
} forEach (allTurrets [_vehicle, true]);


_cargoPosToShow = [];
for "_index" from 0 to (_realCargoCount - 1) do {
    if (!(_index in _cargoIndexes)) then {
        _cargoPosToShow pushBack _index;
    };
};

//Scan though all cargo pos, and condense the ones that share the same mem point
_cargoMempoints = [];
_cargoMempointsIndexes = [];
_cargoMempointsIsCoDriver = [];

{
    _memPoint = "";
    _isCoDriver = ((_x < (count _cargoIsCoDriver)) && {(_cargoIsCoDriver select _x) == 1});
    if (_isCoDriver) then {
        _memPoint = getText (_config >> "memoryPointsGetInCoDriver")
    } else {
        if (_x < (count _memoryPointsGetInCargo)) then {
            _memPoint = _memoryPointsGetInCargo select _x;
        } else {
            _memPoint = _memoryPointsGetInCargo select ((count _memoryPointsGetInCargo) - 1);
        };
    };
    _index = _cargoMempoints find _memPoint;
    if (_index == -1) then {
        _cargoMempoints pushBack _memPoint;
        _cargoMempointsIndexes pushBack [_x];
        _cargoMempointsIsCoDriver pushBack _isCoDriver;
    } else {
        (_cargoMempointsIndexes select _index) pushBack _x;
    };

} forEach _cargoPosToShow;

//Add Cargo Actions:
{
    _memPointGetin = _x;
    _indexes = _cargoMempointsIndexes select _forEachIndex;
    _isCoDriver = _cargoMempointsIsCoDriver select _forEachIndex;

    _displayName = "";
    _icon = "\A3\ui_f\data\igui\cfg\actions\getincargo_ca.paa";

    _getInParams = ["cargo", _memPointGetin, _indexes];
    _actionName = format ["getInCargo_%1", _memPointGetin];
    _displayName = if (_isCoDriver) then {"Get In Front Seat"} else {"Ride In Back"};
    _entryPos = [_memPointGetin] call _fncGetNicePosition;

    _action = [_actionName, _displayName, _icon, {_this call FUNC(doGetIn)}, {_this call FUNC(canGetIn)}, {}, _getInParams, _entryPos, 6] call EFUNC(interact_menu,createAction);
    _path = [_typeOfVehicle, 0, [], _action] call EFUNC(interact_menu,addActionToClass);
} forEach _cargoMempoints;



// memoryPointsGetInDriver = "pos driver";
// memoryPointsGetInDriverDir = "pos driver dir";
// memoryPointsGetInCargo = "pos cargo";
// memoryPointsGetInCargoDir = "pos cargo dir";
// memoryPointsGetInCoDriver = "pos codriver";
// memoryPointsGetInCoDriverDir = "pos codriver dir";
// memoryPointsGetInDriverPrecise = "pos driver";
// memoryPointsGetInCargoPrecise[] = {"pos cargo"};
// memoryPointsGetInGunner

// cargoIsCoDriver
// getInProxyOrder[] = {10,11,1,2,3,4};


// getInRadius = 3.5;
// _memPointsGetInArray = if (isArray (_config >> "memoryPointsGetInDriver")) then {
// getArray (_config >> "memoryPointsGetInDriver")
// } else {
// [getText (_config >> "memoryPointsGetInDriver")]
// };
// {
// _memPointGetin = _x;
// _entryPos = _vehicle selectionPosition _memPointGetin;
// _entryPos set [2, (_modelGround + 1.3)]; //Roughly eye level
// _action = ["Get In Driver", "Get In Driver", "", {_this call FUNC(canGetIn)}, {_this call FUNC(doGetIn)}, {}, ["driver", _memPointGetin], _entryPos, 5] call EFUNC(interact_menu,createAction);
// _path = [(typeOf _vehicle), 0, [], _action] call EFUNC(interact_menu,addActionToClass);

// } forEach _memPointsGetInArray;

// cargoIsCoDriver[] = {0};
// memoryPointsGetInCoDriver = "pos codriver";
// B_Heli_Light_01_F
// transportSoldier = 2;
// memoryPointsGetInCoDriver = "pos codriver";
// memoryPointsGetInCargo[] = {"pos Cargo L","pos Cargo R","pos Cargo R","pos Cargo L","pos Cargo L","pos Cargo R"};


// 6 turrets
// gunnerName = "Passenger (Left Bench 2)";
// memoryPointsGetInGunner = "pos cargo LR";
//mainTurret: playerPosition = 0; primaryGunner = 1;

// allTurrets