/*
 * Author: Bohemia Interactive
 * Module function for initalizing zeus
 * Edited to remove eagle and global ascension message
 * Added "zeusUnitAssigned" event call
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated) then {

    //--- Terminate when not created on the server
    if (!isserver && local _logic && isNill (getassignedcuratorunit _logic)) exitWith {
        [format ["%1 is trying to create curator logic ModuleCurator_F",profilename],"bis_fnc_error",false] call bis_fnc_mp;
        deletevehicle _logic;
    };

    //--- Get curator owner
    _ownerVar = _logic getVariable ["owner",""];
    _ownerUID = parsenumber _ownerVar;
    if (cheatsenabled) then {
        _ownerVarArray = toarray _ownerVar;
        _ownerVarArray resize 3;
        if (tostring _ownerVarArray == "DEV") then {_ownerUID = 1;};
    };
    if (_ownerVar == "" && !ismultiplayer) then {
        ["Curator owner not defined, player used instead in singleplayer."] call bis_fnc_error;
        _ownerVar = player call bis_fnc_objectvar;
    };
    if (_ownerUID > 0 && !ismultiplayer) then {
        _ownerVar = player call bis_fnc_objectvar;
    };
    _isAdmin = _ownerVar == "#adminLogged" || _ownerVar == "#adminVoted";

    //--- Wipe out the variable so clients can't access it
    _logic setVariable ["owner",nil];

    //--- Server
    if (isserver) then {

        //--- Prepare admin variable
        _adminVar = "";
        if (_isAdmin) then {
            _letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
            _adminVar = "admin_";
            for "_i" from 0 to 9 do {_adminVar = _adminVar + (_letters call bis_fnc_selectrandom);};
            _logic setVariable ["adminVar",_adminVar,true];
        };

        //--- Get allowed addons
        _addonsType = _logic getVariable ["Addons",0];
        _addons = [];
        switch _addonsType do {

            //--- All (including unofficial ones)
            case 3: {
                _cfgPatches = configFile >> "cfgpatches";
                for "_i" from 0 to (count _cfgPatches - 1) do {
                    _class = _cfgPatches select _i;
                    if (isclass _class) then {_addons set [count _addons,configname _class];};
                };
                _addons call bis_fnc_activateaddons;
                removeallcuratoraddons _logic;
                _logic addcuratoraddons _addons;
            };

            //--- All active
            case 2: {};

            //--- All mission
            case 1: {
                _addonsList = [];
                {
                    _addonsList = _addonsList + (unitaddons typeOf _x);
                } forEach (entities "all");
                removeallcuratoraddons _logic;
                _logic addcuratoraddons _addonsList;
            };

            //--- None
            case 0: {
                removeallcuratoraddons _logic;
            };
        };

        //--- Handle ownership
        [_logic,_ownerVar,_ownerUID,_adminVar] spawn {
            scriptname "BIS_fnc_moduleCurator: Owner";

            _logic = _this select 0;
            _ownerVar = _this select 1;
            _ownerUID = _this select 2;
            _adminVar = _this select 3;

            if (_adminVar != "") then {_ownerVar = _adminVar;};

            _forced = _logic getVariable ["forced",0] > 0;
            _name = _logic getVariable ["name",""];
            if (_name == "") then {_name = localize "STR_A3_curator";};

            //--- Wait until mission starts
            waitUntil {time > 0}; // NOTE: DO NOT CHANGE TO ACE_TIME, IT BREAKS THE MODULE

            //--- Refresh addon list, so it's broadcasted to clients
            _addons = curatoraddons _logic;
            removeAllCuratorAddons _logic;
            _logic addcuratoraddons _addons;

            while {true} do {
                //--- Wait for player to become Zeus
                switch true do {
                    case (_ownerUID > 0): {
                        waitUntil {
                            sleep 0.01;
                            {getplayeruid _x == _ownerVar} count playableunits > 0 || isNill _logic
                        };
                    };
                    default {
                        waitUntil {isplayer (missionnamespace getVariable [_ownerVar,objNull]) || isNill _logic};
                    };
                };
                if (isNill _logic) exitWith {};

                //--- Assign
                _player = objNull;
                switch true do {
                    case (_ownerUID > 0): {
                        {
                            if (getplayeruid _x == _ownerVar) exitWith {_player = _x;};
                        } forEach playableunits;
                    };
                    default {
                        _player = missionnamespace getVariable [_ownerVar,objNull];
                    };
                };

                waitUntil {unassigncurator _logic; isNill (getassignedcuratorunit _logic) || isNill _logic};
                waitUntil {_player assignCurator _logic; getassignedcuratorunit _logic == _player || isNill _logic};
                if (isNill _logic) exitWith {};

                //--- Add radio channels
                {
                    _x radiochanneladd [_player];
                } forEach (_logic getVariable ["channels",[]]);

                // Added by ace_zeus to delay ascension message at mission start
                [{
                    _logic = _this select 0;
                    _player = _this select 1;

                    //--- Sent notification to all assigned players
                    if ((_logic getVariable ["showNotification",true]) && GVAR(zeusAscension)) then {
                        {
                            if (isplayer _x) then {
                                [["CuratorAssign",[_name,name _player]],"bis_fnc_showNotification",_x] call bis_fnc_mp;
                            };
                        } forEach (curatoreditableobjects _logic);
                    };
                },[_logic,_player]] call EFUNC(common,execNextFrame);

                [_logic,"curatorUnitAssigned",[_logic,_player]] call bis_fnc_callscriptedeventhandler;

                // Added by ace_zeus
                ["zeusUnitAssigned", [_logic,_player]] call EFUNC(common,globalEvent);

                //--- Forced interface
                //if (_forced) then {
                //  [[true,true],"bis_fnc_forceCuratorInterface",_player] call bis_fnc_mp;
                //};

                //--- Wait for player to stop being Zeus
                switch true do {
                    case (_ownerUID > 0): {
                        waitUntil {
                            sleep 0.01;
                            {getplayeruid _x == _ownerVar} count playableunits == 0 || isNill _logic
                        };
                    };
                    default {
                        waitUntil {_player != missionnamespace getVariable [_ownerVar,objNull] || isNill _logic};
                    };
                };
                if (isNill _logic) exitWith {};

                //--- Add radio channels
                {
                    _x radiochannelremove [_player];
                } forEach (_logic getVariable ["channels",[]]);

                //--- Unassign
                waitUntil {unassigncurator _logic; isNill (getassignedcuratorunit _logic) || isNill _logic};
                if (isNill _logic) exitWith {};
            };
        };

        //--- Activated all future addons
        _addons = [];
        {
            if (typeOf _x == "ModuleCuratorAddAddons_F") then {
                _paramAddons = call compile ("[" + (_x getVariable ["addons",""]) + "]");
                {
                    if !(_x in _addons) then {_addons set [count _addons,_x];};
                    {
                        if !(_x in _addons) then {_addons set [count _addons,_x];};
                    } forEach (unitaddons _x);
                } forEach _paramAddons;
            };
        } forEach (synchronizedobjects _logic);
        _addons call bis_fnc_activateaddons;

        // Added by ace_zeus to delay bird code
        [{
            _logic = _this select 0;

            if (GVAR(zeusBird)) then {
                //--- Create bird
                _birdType = _logic getVariable ["birdType","eagle_f"];
                if (_birdType != "") then {
                    _bird = createvehicle [_birdType,[100,100,100],[],0,"none"];
                    _logic setVariable ["bird",_bird,true];
                };

                //--- Locality changed
                _logic addEventHandler [
                    "local",
                    {
                        _logic = _this select 0;
                        _bird = _logic getVariable ["bird",objNull];
                        _bird setowner owner _logic;
                    }
                ];
            };
        },[_logic]] call EFUNC(common,execNextFrame);
    };

    //--- Player
    if (hasInterface) then {
        waitUntil {local player};
        _serverCommand = if (_ownerVar == "#adminLogged") then {"#shutdown"} else {"#kick"};

        //--- Black effect until the interface is open
        _forced = _logic getVariable ["forced",0] > 0;
        if (_forced) then {
            _isCurator = switch true do {
                case (_ownerUID > 0): {
                    getplayeruid player == _ownerVar
                };
                case (_isAdmin): {
                    isserver || servercommandavailable _serverCommand
                };
                default {
                    player == missionnamespace getVariable [_ownerVar,objNull]
                };
            };
            if (_isCurator) then {
                [true,true] spawn bis_fnc_forceCuratorInterface;
                ("RscDisplayCurator" call bis_fnc_rscLayer) cuttext ["","black in",1e10];
            };
        };

        //--- Check if player is server admin
        if (_isAdmin) then {
            _adminVar = _logic getVariable ["adminVar",""];
            _logic setVariable ["adminVar",nil];
            if (isserver) then {
                //--- Host
                missionnamespace setVariable [_adminVar,player];
            } else {
                //--- Client
                [_logic,_adminVar,_serverCommand] spawn {
                    scriptname "BIS_fnc_moduleCurator: Admin check";

                    _logic = _this select 0;
                    _adminVar = _this select 1;
                    _serverCommand = _this select 2;
                    while {true} do {
                        waitUntil {sleep 0.1; servercommandavailable _serverCommand};
                        missionnamespace setVariable [_adminVar,player];
                        publicvariable _adminVar;
                        _respawn = player addEventHandler ["respawn",format ["%1 = _this select 0; publicvariable '%1';",_adminVar]];

                        waitUntil {sleep 0.1; !servercommandavailable _serverCommand};
                        missionnamespace setVariable [_adminVar,objNull];
                        publicvariable _adminVar;
                        player removeeventhandler ["respawn",_respawn];
                    };
                };
            };
        };

        [_logic] spawn {
            _logic = _this select 0;
            sleep 1;
            waitUntil {alive player};

            //--- Show warning when Zeus key is not assigned
            if (count (actionkeys "curatorInterface") == 0) then {
                [
                    format [
                        localize "str_a3_cfgvehicles_modulecurator_f_keyNotAssigned",
                        (["IGUI","WARNING_RGB"] call bis_fnc_displaycolorget) call bis_fnc_colorRGBAtoHTML
                    ]
                ] call bis_fnc_guiMessage;
            };

            //--- Show hint about pinging for players
            if (
                isNil {profilenamespace getVariable "bis_fnc_curatorPinged_done"}
                &&
                {isTutHintsEnabled}
                &&
                {isNill getassignedcuratorlogic player}
                &&
                {player in curatoreditableobjects _logic}
            ) then {
                sleep 0.5;
                [["Curator","Ping"]] call bis_fnc_advHint;
            };
        };

        //--- Add local event handlers
        _logic addEventHandler ["curatorFeedbackMessage",{_this call bis_fnc_showCuratorFeedbackMessage;}];
        _logic addEventHandler ["curatorPinged",{_this call bis_fnc_curatorPinged;}];
        _logic addEventHandler ["curatorObjectPlaced",{_this call bis_fnc_curatorObjectPlaced;}];
        _logic addEventHandler ["curatorObjectEdited",{_this call bis_fnc_curatorObjectEdited;}];
        _logic addEventHandler ["curatorWaypointPlaced",{_this call bis_fnc_curatorWaypointPlaced;}];

        _logic addEventHandler ["curatorObjectDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];
        _logic addEventHandler ["curatorGroupDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];
        _logic addEventHandler ["curatorWaypointDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];
        _logic addEventHandler ["curatorMarkerDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];

        player call bis_fnc_curatorRespawn;
    };
};
