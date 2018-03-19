/*
 * Author: Bohemia Interactive
 * Module function for remote controlling units as zeus
 * Edited to remove global wind sound
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
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_bi_moduleRemoteControl
 *
 * Public: No
 */
#include "script_component.hpp"

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic && !isnull curatorcamera) then {

    //--- Terminate when remote control is already in progress
    if !(isnull (missionnamespace getvariable ["bis_fnc_moduleRemoteControl_unit",objnull])) exitwith {};

    //--- Get unit under cursor
    _unit = objnull;
    _mouseOver = missionnamespace getvariable ["bis_fnc_curatorObjectPlaced_mouseOver",[""]];
    if ((_mouseOver select 0) == typename objnull) then {_unit = _mouseOver select 1;};
    _unit = effectivecommander _unit;

    //--- Temp owner
    private _tempOwner = _unit getvariable ["bis_fnc_moduleRemoteControl_owner", objnull];

    //--- Check if the unit is suitable
    _error = "";
    if !(side group _unit in [east,west,resistance,civilian]) then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorEmpty";};
    if (isplayer _unit) then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorPlayer";};
    if !(alive _unit) then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorDestroyed";};
    if (isnull _unit) then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorNull";};
    if (!isnull _tempOwner && {_tempOwner in allPlayers}) then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorControl";};
    if (isuavconnected vehicle _unit) then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorControl";};

    if (_error == "") then {
        _unit spawn {
            scriptname "bis_fnc_moduleRemoteControl: Loop";
            _unit = _this;
            _vehicle = vehicle _unit;
            _vehicleRole = str assignedvehiclerole _unit;

            bis_fnc_moduleRemoteControl_unit = _unit;
            _unit setvariable ["bis_fnc_moduleRemoteControl_owner",player,true];

            // Added by ace_zeus to toggle remote control wind sound
            if (GVAR(remoteWind)) then {
                //--- Play wind cue to all players
                [format ["wind%1",ceil random 5],"bis_fnc_playsound"] call bis_fnc_mp;
            };

            _blur = ppeffectcreate ["RadialBlur",144];
            _blur ppeffectenable true;
            _blur ppeffectadjust [0,0,0.3,0.3];
            _blur ppeffectcommit 0;
            _blur ppeffectadjust [0.03,0.03,0.1,0.1];
            _blur ppeffectcommit 1;

            _cam = "camera" camcreate getposatl curatorcamera;
            _cam cameraeffect ["internal","back"];
            _cam campreparetarget (screentoworld [0.5,0.5]);
            _cam camcommitprepared 0;
            _cam campreparetarget _unit;
            _cam campreparefov 0.1;
            _cam camcommitprepared 1;
            sleep 0.75;

            ("bis_fnc_moduleRemoteCurator" call bis_fnc_rscLayer) cuttext ["","black out",0.25];
            sleep 0.25;

            //--- Wait for interface to close
            (finddisplay 312) closedisplay 2;
            waituntil {isnull curatorcamera};

            //--- Switch
            player remotecontrol _unit;
            if (cameraon != _vehicle) then {
                _vehicle switchcamera cameraview;
            };

            ppeffectdestroy _blur;
            _cam cameraeffect ["terminate","back"];
            camdestroy _cam;

            _color = ppeffectcreate ["colorCorrections",1896];
            _color ppeffectenable true;
            _color ppeffectadjust [1,1,0,[0,0,0,1],[1,1,1,1],[0,0,0,0],[0.9,0.0,0,0,0,0.5,1]];
            _color ppeffectcommit 0;

            _curator = getassignedcuratorlogic player;
            [_curator,"curatorObjectRemoteControlled",[_curator,player,_unit,true]] call bis_fnc_callScriptedEventHandler;
            [["Curator","RemoteControl"],nil,nil,nil,nil,nil,nil,true] call bis_fnc_advHint;

            sleep 0.3;
            _color ppeffectadjust [1,1,0,[0,0,0,1],[1,1,1,1],[0,0,0,0],[0.9,0.85,0,0,0,0.5,1]];
            _color ppeffectcommit 0.3;
            ("bis_fnc_moduleRemoteCurator" call bis_fnc_rscLayer) cuttext ["","black in",0.5];

            //--- Back to player
            _vehicle = vehicle _unit;
            _vehicleRole = str assignedvehiclerole _unit;
            _rating = rating player;
            waituntil {
                //--- Refresh when vehicle or vehicle role changes
                if ((vehicle _unit != _vehicle || str assignedvehiclerole _unit != _vehicleRole) && {alive _unit}) then {
                    player remotecontrol _unit;
                    _vehicle = vehicle _unit;
                    _vehicleRole = str assignedvehiclerole _unit;
                };
                if (rating player < _rating) then {
                    player addrating (-rating player + _rating);
                };
                sleep 0.01;
                !isnull curatorcamera
                ||
                {cameraon == vehicle player}
                ||
                {!alive _unit} //--- Also isnull check, objNull is not alive
                ||
                {!alive player}
                ||
                {isnull getassignedcuratorlogic player}
            };

            player addrating (-rating player + _rating);
            objnull remotecontrol _unit;
            _unit setvariable ["bis_fnc_moduleRemoteControl_owner",nil,true];

            if (alive player) then {
                //--- Death screen
                if (
                    isnull curatorcamera
                    &&
                    {cameraon != vehicle player}
                    &&
                    {!isnull _unit}
                    &&
                    {!isnull getassignedcuratorlogic player}
                    //&&
                    //{(_unit getvariable ["bis_fnc_moduleRemoteControl_owner",objnull] == player)}
                ) then {
                    sleep 2;
                    ("bis_fnc_moduleRemoteCurator" call bis_fnc_rscLayer) cuttext ["","black out",1];
                    sleep 1;
                };
                if !(isnull _unit) then {
                    _unitPos = getposatl _unit;
                    _camPos = [_unitPos,10,direction _unit + 180] call bis_fnc_relpos;
                    _camPos set [2,(_unitPos select 2) + (getterrainheightasl _unitPos) - (getterrainheightasl _camPos) + 10];
                    //[_camPos,_unit] call bis_fnc_setcuratorcamera;
                    (getassignedcuratorlogic player) setvariable ["bis_fnc_modulecuratorsetcamera_params",[_camPos,_unit]];
                };

                sleep 0.1; //--- Engine needs a delay in case controlled unit was deleted
                ("bis_fnc_moduleRemoteCurator" call bis_fnc_rscLayer) cuttext ["","black in",1e10];
                opencuratorinterface;
                ppeffectdestroy _color;

                waituntil {!isnull curatorcamera};
            } else {
                ppeffectdestroy _color;
            };
            player switchcamera cameraview;
            bis_fnc_moduleRemoteControl_unit = nil;
            ("bis_fnc_moduleRemoteCurator" call bis_fnc_rscLayer) cuttext ["","black in",1];
            [_curator,"curatorObjectRemoteControlled",[_curator,player,_unit,false]] call bis_fnc_callScriptedEventHandler;
            sleep 0.01;
        };
    } else {
        [objnull,_error] call bis_fnc_showCuratorFeedbackMessage;
    };
    deletevehicle _logic;
};
