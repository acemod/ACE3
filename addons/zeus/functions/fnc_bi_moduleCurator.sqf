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
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_bi_moduleCurator
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if (_activated) then {

    //--- Terminate when not created on the server
    if (!isserver && local _logic && isnull (getassignedcuratorunit _logic)) exitwith {
        [format ["%1 is trying to create curator logic ModuleCurator_F",profilename],"bis_fnc_error",false] call bis_fnc_mp;
        deletevehicle _logic;
    };

    //--- Get curator owner
    _ownerVar = _logic getvariable ["owner",""];
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
    _logic setvariable ["owner",nil];

    //--- Server
    if (isserver) then {

        //--- Prepare admin variable
        _adminVar = "";
        if (_isAdmin) then {
            _letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
            _adminVar = "admin_";
            for "_i" from 0 to 9 do {_adminVar = _adminVar + selectRandom _letters};
            _logic setvariable ["adminVar",_adminVar,true];
        };

        //--- Get allowed addons
        _addonsType = _logic getvariable ["Addons",2];
        _addons = [];
        switch _addonsType do {

            //--- All (including unofficial ones)
            case 3: {
                _cfgPatches = configfile >> "cfgpatches";
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
                    _addonsList = _addonsList + (unitaddons typeof _x);
                } foreach (entities "all");
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

            params ["_logic", "_ownerVar", "_ownerUID", "_adminVar"];

            if (_adminVar != "") then {_ownerVar = _adminVar;};

            _forced = _logic getvariable ["forced",0] > 0;
            _name = _logic getvariable ["name",""];
            if (_name == "") then {_name = localize "STR_A3_curator";};

            //--- Wait until mission starts
            waitUntil {time > 0}; // NOTE: DO NOT CHANGE TO CBA_missionTime, IT BREAKS THE MODULE

            //--- Refresh addon list, so it's broadcasted to clients
            _addons = curatoraddons _logic;
            removeAllCuratorAddons _logic;
            _logic addcuratoraddons _addons;

            while {true} do {
                //--- Wait for player to become Zeus
                switch true do {
                    case (_ownerUID > 0): {
                        waituntil {
                            sleep 0.01;
                            {getplayeruid _x == _ownerVar} count playableunits > 0 || isnull _logic
                        };
                    };
                    default {
                        waituntil {isplayer (missionnamespace getvariable [_ownerVar,objnull]) || isnull _logic};
                    };
                };
                if (isnull _logic) exitwith {};

                //--- Assign
                _player = objnull;
                switch true do {
                    case (_ownerUID > 0): {
                        {
                            if (getplayeruid _x == _ownerVar) exitwith {_player = _x;};
                        } foreach playableunits;
                    };
                    default {
                        _player = missionnamespace getvariable [_ownerVar,objnull];
                    };
                };

                waituntil {unassigncurator _logic; isnull (getassignedcuratorunit _logic) || isnull _logic};
                waituntil {_player assignCurator _logic; getassignedcuratorunit _logic == _player || isnull _logic};
                if (isnull _logic) exitwith {};

                //--- Add radio channels
                {
                    _x radiochanneladd [_player];
                } foreach (_logic getvariable ["channels",[]]);

                // Added by ace_zeus to delay ascension message code
                private _msgCode = {
                    params ["_logic","_player"];

                    //--- Sent notification to all assigned players
                    if ((_logic getVariable ["showNotification",true]) && GVAR(zeusAscension)) then {
                        {
                            if (isplayer _x) then {
                                [["CuratorAssign",[_name,name _player]],"bis_fnc_showNotification",_x] call bis_fnc_mp;
                            };
                        } forEach (curatoreditableobjects _logic);
                    };
                };

                // Added by ace_zeus to hide ascension messages
                if !(EGVAR(common,settingsInitFinished)) then {
                    EGVAR(common,runAtSettingsInitialized) pushBack [_msgCode, [_logic,_player]];
                } else {
                    [_logic,_player] call _msgCode;
                };

                [_logic,"curatorUnitAssigned",[_logic,_player]] call bis_fnc_callscriptedeventhandler;

                // Added by ace_zeus
                [QGVAR(zeusUnitAssigned), [_logic,_player]] call CBA_fnc_globalEvent;

                //--- Wait for player to stop being Zeus
                switch true do {
                    case (_ownerUID > 0): {
                        waituntil {
                            sleep 0.01;
                            {getplayeruid _x == _ownerVar} count playableunits == 0 || isnull _logic
                        };
                    };
                    default {
                        waituntil {_player != missionnamespace getvariable [_ownerVar,objnull] || isnull _logic};
                    };
                };
                if (isnull _logic) exitwith {};

                //--- Add radio channels
                {
                    _x radiochannelremove [_player];
                } foreach (_logic getvariable ["channels",[]]);

                //--- Unassign
                waituntil {unassigncurator _logic; isnull (getassignedcuratorunit _logic) || isnull _logic};
                if (isnull _logic) exitwith {};
            };
        };

        // Added by ace_zeus to delay bird code
        private _birdCode = {
            params ["_logic"];

            if (GVAR(zeusBird)) then {
                //--- Create bird
                _birdType = _logic getVariable ["birdType","eagle_f"];
                if (_birdType != "") then {
                    _bird = createvehicle [_birdType,[100,100,100],[],0,"none"];
                    _logic setVariable ["bird",_bird,true];
                };

                //--- Locality changed
                _logic addeventhandler [
                    "local",
                    {
                        _logic = _this select 0;
                        _bird = _logic getVariable ["bird",objnull];
                        _bird setowner owner _logic;
                    }
                ];
            };
        };

        // Added by ace_zeus to hide camera bird
        if !(EGVAR(common,settingsInitFinished)) then {
            EGVAR(common,runAtSettingsInitialized) pushBack [_birdCode, [_logic]];
        } else {
            [_logic] call _birdCode;
        };

        //--- Activated all future addons
        _addons = [];
        {
            if (typeof _x == "ModuleCuratorAddAddons_F") then {
                _paramAddons = call compile ("[" + (_x getvariable ["addons",""]) + "]");
                {
                    if !(_x in _addons) then {_addons set [count _addons,_x];};
                    {
                        if !(_x in _addons) then {_addons set [count _addons,_x];};
                    } foreach (unitaddons _x);
                } foreach _paramAddons;
            };
        } foreach (synchronizedobjects _logic);
        _addons call bis_fnc_activateaddons;
    };

    //--- Player
    if (hasinterface) then {
        waituntil {local player};
        _serverCommand = if (_ownerVar == "#adminLogged") then {"#shutdown"} else {"#kick"};

        //--- Black effect until the interface is open
        _forced = _logic getvariable ["forced",0] > 0;
        if (_forced) then {
            _isCurator = switch true do {
                case (_ownerUID > 0): {
                    getplayeruid player == _ownerVar
                };
                case (_isAdmin): {
                    isserver || servercommandavailable _serverCommand
                };
                default {
                    player == missionnamespace getvariable [_ownerVar,objnull]
                };
            };
            if (_isCurator) then {
                [true,true] spawn bis_fnc_forceCuratorInterface;
                ("RscDisplayCurator" call bis_fnc_rscLayer) cuttext ["","black in",1e10];
            };
        };

        //--- Check if player is server admin
        if (_isAdmin) then {
            _adminVar = _logic getvariable ["adminVar",""];
            _logic setvariable ["adminVar",nil];
            if (isserver) then {
                //--- Host
                missionnamespace setvariable [_adminVar,player];
            } else {
                //--- Client
                [_logic,_adminVar,_serverCommand] spawn {
                    scriptname "BIS_fnc_moduleCurator: Admin check";

                    _logic = _this select 0;
                    _adminVar = _this select 1;
                    _serverCommand = _this select 2;
                    while {true} do {
                        waituntil {sleep 0.1; servercommandavailable _serverCommand};
                        missionnamespace setvariable [_adminVar,player];
                        publicvariable _adminVar;
                        _respawn = player addeventhandler ["respawn",format ["%1 = _this select 0; publicvariable '%1';",_adminVar]];

                        waituntil {sleep 0.1; !servercommandavailable _serverCommand};
                        missionnamespace setvariable [_adminVar,objnull];
                        publicvariable _adminVar;
                        player removeeventhandler ["respawn",_respawn];
                    };
                };
            };
        };

        [_logic] spawn {
            _logic = _this select 0;
            sleep 1;
            waituntil {alive player};

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
                isnil {profilenamespace getvariable "bis_fnc_curatorPinged_done"}
                &&
                {isTutHintsEnabled}
                &&
                {isnull getassignedcuratorlogic player}
                &&
                {player in curatoreditableobjects _logic}
            ) then {
                sleep 0.5;
                [["Curator","Ping"]] call bis_fnc_advHint;
            };
        };

        //--- Add local event handlers
        _logic addeventhandler ["curatorFeedbackMessage",{_this call bis_fnc_showCuratorFeedbackMessage;}];
        _logic addeventhandler ["curatorPinged",{_this call bis_fnc_curatorPinged;}];
        _logic addeventhandler ["curatorObjectPlaced",{_this call bis_fnc_curatorObjectPlaced;}];
        _logic addeventhandler ["curatorObjectEdited",{_this call bis_fnc_curatorObjectEdited;}];
        _logic addeventhandler ["curatorWaypointPlaced",{_this call bis_fnc_curatorWaypointPlaced;}];

        _logic addeventhandler ["curatorObjectDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];
        _logic addeventhandler ["curatorGroupDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];
        _logic addeventhandler ["curatorWaypointDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];
        _logic addeventhandler ["curatorMarkerDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];

        player call bis_fnc_curatorRespawn;
    };
};
