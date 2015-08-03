/*
 * Author: Bohemia Interactive (Karel Moricky)
 * Part of the BI respawn framework
 * Shows death screen for respawn type "None"
 * Edited to support ace_spectator integration
 *
 * Arguments:
 * 0: Corpse <OBJECT>
 * 1: Killer <OBJECT>
 * 2: Respawn Type <NUMBER>
 * 3: Respawn Delay <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */
private ["_soundvolume","_musicvolume"];

#define BI_CONTROL (_display displayctrl _n)

#include "script_component.hpp"

disableserialization;
_player = _this select 0;
_killer = _this select 1;
if (isnull _killer) then {_killer = _player};

_musicvolume = musicvolume;
_soundvolume = soundvolume; //MUF-TODO: check if this is done before sound is faded in fn_feedbackMain.fsm

_start = isnil "bis_fnc_respawnNone_start";
if (_start) then {
    bis_fnc_respawnNone_start = [daytime,time / 3600];

    //3.5 fadesound 0; //MUF-commented

    sleep 2;
    if (alive player) exitwith {};
    cutText ["","BLACK OUT",1];
    sleep 1.5;
        BIS_fnc_feedback_allowPP = false; //MUF-switch health PP off
    //(["HealthPP_black"] call bis_fnc_rscLayer) cutText ["","BLACK IN",1];//MUF-black in (remove black screen that was launched in FSM PP)

    if (ismultiplayer) then {
        if (GVAR(onDeath)) then {
            private ["_vision","_pos"];
            _vision = [-2,-1] select (sunOrMoon < 1);
            _pos = (getPosATL _player) vectorAdd [0,0,5];

            [2,_killer,_vision,_pos,getDir _player] call FUNC(setCameraAttributes);
            [_player] call FUNC(setSpectator);
        } else {
            (finddisplay 46) createdisplay "RscDisplayMissionEnd";
        };
    } else {enableenddialog};
};
if (alive player) exitwith {
    [player,false] call FUNC(setSpectator);
    cuttext ["","plain"];
}; //--- Terminate when player manages to switch do different unit already

if (GVAR(onDeath)) exitWith {};

waituntil {!isnull (finddisplay 58)};
_display = finddisplay 58;

//--- Black fade in
_n = 1060;
BI_CONTROL ctrlsetfade 1;
if (_start) then {

    //--- Play ambient radio
    setacctime 1;
    0 fademusic 0;
    4 fademusic 0.8;
    playmusic format ['RadioAmbient%1',ceil random 1/*30*/];
    _musicEH = addMusicEventHandler ["MusicStop",{[] spawn {playmusic format ['RadioAmbient%1',ceil random 1/*30*/];};}];
    uinamespace setvariable ["bis_fnc_respawnNone_musicEH",_musicEH];
    _display displayaddeventhandler ["unload","removeMusicEventHandler ['MusicStop',uinamespace getvariable ['bis_fnc_respawnNone_musicEH',-1]];"];

    BI_CONTROL ctrlcommit 4;
} else {
    BI_CONTROL ctrlcommit 0;
};
cuttext ["","plain"];

//--- HUD
_n = 5800;
BI_CONTROL ctrlsettext gettext (configfile >> "cfgingameui" >> "cursor" >> "select");
BI_CONTROL ctrlsetposition [-10,-10,safezoneH * 0.07 * 3/4,safezoneH * 0.07];
BI_CONTROL ctrlsettextcolor [1,1,1,1];
BI_CONTROL ctrlcommit 0;

//--- SITREP (ToDO: Localize)
_sitrep = "SITREP||";
if (name _player != "Error: No unit") then {
    _sitrep = _sitrep + "KIA: %4. %5|";
};
_sitrep = _sitrep + "TOD: %2 [%3]|LOC: %6 \ %7";
if (_killer != _player) then {
    _sitrep = _sitrep + "||ENY: %8";
    if (currentweapon _killer != "") then {
        _sitrep = _sitrep + "|ENW: %9</t>"
    };
};
_sitrep = format [
    _sitrep,
    1 * safezoneH,
    [bis_fnc_respawnNone_start select 0,"HH:MM:SS"] call bis_fnc_timetostring,
    [bis_fnc_respawnNone_start select 1,"HH:MM:SS"] call bis_fnc_timetostring,
    toupper localize format ["STR_SHORT_%1",rank _player],
    toupper name _player,
    mapGridPosition _player,
    toupper worldname,
    toupper ((configfile >> "cfgvehicles" >> typeof _killer) call bis_fnc_displayname),
    toupper ((configfile >> "cfgweapons" >> currentweapon _killer) call bis_fnc_displayname)

];

_n = 11000;
_bcgPos = ctrlposition BI_CONTROL;
_n = 5858;
//BI_CONTROL ctrlsetposition [_bcgPos select 0,safezoneY + ((_bcgPos select 0) - safezoneX) * 4/3,safezoneW - 2 * (_bcgPos select 2),safezoneH / 2];
BI_CONTROL ctrlsetposition [(((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX),
             ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY),
             safezoneW - 2 * (_bcgPos select 2),
             safezoneH / 2];
BI_CONTROL ctrlcommit 0;
[BI_CONTROL,_sitrep] spawn {
    scriptname "bis_fnc_respawnNone: SITREP";
    disableserialization;
    _control = _this select 0;
    _sitrepArray = toarray (_this select 1);
    {_sitrepArray set [_foreachindex,tostring [_x]]} foreach _sitrepArray;
    _sitrep = "";
    //_sitrepFormat = "<t align='left' font='EtelkaMonospacePro' shadow='1' size='" + str safezoneH + "'>%1</t>";
    _sitrepFormat = "<t align='left' font='EtelkaMonospacePro' shadow='1'>%1</t>";

    sleep 1;
    for "_i" from 0 to (count _sitrepArray - 1) do {
        _letter = _sitrepArray select _i;
        _delay = if (_letter == "|") then {_letter = "<br />"; 1} else {0.01};
        _sitrep = _sitrep + _letter;
        _control ctrlsetstructuredtext parsetext format [_sitrepFormat,_sitrep + "_"];
        //playsound ["IncomingChallenge",true];
        sleep _delay;
        if (isnull _control) exitwith {};
    };
    _control ctrlsetstructuredtext parsetext format [_sitrepFormat,_sitrep];
};


//--- Create UAV camera
_camera = "camera" camcreate position player;
_camera cameraeffect ["internal","back"];
_camera campreparefov 0.4;
_camera campreparetarget _killer;
showcinemaborder false;

//--- Set PP effects
_saturation = 0.0 + random 0.3;
_ppColor = ppEffectCreate ["ColorCorrections", 1999];
_ppColor ppEffectEnable true;
_ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1 - _saturation, 1 - _saturation, 1 - _saturation, _saturation], [1, 0.25, 0, 1.0]];
_ppColor ppEffectCommit 0;

_ppGrain = ppEffectCreate ["filmGrain", 2012];
_ppGrain ppEffectEnable true;
_ppGrain ppEffectAdjust [random 0.2, 1, 1, 0, 1];
_ppGrain ppEffectCommit 0;

//--- Camera update executed every frame
bis_fnc_respawnNone_player = _player;
bis_fnc_respawnNone_killer = _killer;
bis_fnc_respawnNone_camera = _camera;
bis_fnc_respawnNone_loop = {
    scriptname "bis_fnc_respawnNone: camera";
    _display = _this select 0;
    _player = bis_fnc_respawnNone_player;
    _killer = bis_fnc_respawnNone_killer;
    _camera = bis_fnc_respawnNone_camera;

    _sin = 20 * sin (time * 7);
    _killerPos = [
        (visiblepositionasl _killer select 0),
        (visiblepositionasl _killer select 1) + (_sin),
        (visiblepositionasl _killer select 2) + (_sin)
    ];

    _dirToKiller = if (_killer == _player) then {
        direction _player;
    } else {
        ([_player,_killerPos] call bis_fnc_dirto) + _sin;
    };
    _pos = [
        visiblepositionasl _player,
        -20,
        _dirToKiller
    ] call bis_fnc_relpos;
    _pos set [2,((_pos select 2) + 7) max (getterrainheightasl _pos + 7)];

    //--- Pitch
    _heightCamera = getterrainheightasl _pos;
    _heightKiller = getterrainheightasl _killerPos;
    _height = _heightCamera - _heightKiller;
    _dis = _killerPos distance _pos;
    _angle = (asin (_height/_dis));

    _camera setdir _dirtokiller;
    [_camera,-_angle,_sin] call bis_fnc_setpitchbank;
    _camera setposasl _pos;

    //--- HUD
    _n = 5800;
    _hudPos = (worldtoscreen position _player);
    if (count _hudPos > 0) then {
        _hudPosW = ctrlposition BI_CONTROL select 2;
        _hudPosH = ctrlposition BI_CONTROL select 3;
        _hudPos = [
            (_hudPos select 0) - _hudPosW / 2,
            (_hudPos select 1) - _hudPosH / 2,
            _hudPosW,
            _hudPosH
        ];
        BI_CONTROL ctrlsetposition _hudPos;
        BI_CONTROL ctrlcommit 0;
    };
};

bis_fnc_respawnNone_keydown = {
    _key = _this select 1;

    if (_key in (actionkeys 'nightvision') || _key < 0) then {
        bis_fnc_respawnNone_vision = bis_fnc_respawnNone_vision + 1;
        _vision = bis_fnc_respawnNone_vision % 4;
        switch (_vision) do {
            case 0: {
                camusenvg false;
                call compile 'false SetCamUseTi 0';
            };
            case 1: {
                camusenvg true;
                call compile 'false SetCamUseTi 0';
            };
            case 2: {
                camusenvg false;
                call compile 'true SetCamUseTi 0';
            };
            case 3: {
                camusenvg false;
                call compile 'true SetCamUseTi 1';
            };
        };
    };
};
//bis_fnc_respawnNone_vision = (1 + floor random 3) % 4; //--- Random vision (not NVG)
bis_fnc_respawnNone_vision = -1;
if (sunormoon < 1) then {bis_fnc_respawnNone_vision = 0;};
[-1,-1] call bis_fnc_respawnNone_keydown;

_display displayaddeventhandler ["mousemoving","_this call bis_fnc_respawnNone_loop"];
_display displayaddeventhandler ["mouseholding","_this call bis_fnc_respawnNone_loop"];
_display displayaddeventhandler ["keydown","_this call bis_fnc_respawnNone_keydown"];


//--- Team Switch display opened
waituntil {isnull _display};
_displayTeamSwitch = finddisplay 632;

//--- Team Switch display closed - cleanup and restart the view
waituntil {isnull _displayTeamSwitch};

_camera cameraeffect ["terminate","back"];
camdestroy _camera;

bis_fnc_respawnNone_player = nil;
bis_fnc_respawnNone_killer = nil;
bis_fnc_respawnNone_camera = nil;
bis_fnc_respawnNone_loop = nil;

ppeffectdestroy _ppColor;
ppeffectdestroy _ppGrain;

if (!alive player) exitwith {_this call bis_fnc_respawnNone;};


//--- Resurrection!
BIS_fnc_feedback_allowPP = true;
0 fadesound _soundvolume;
0 fademusic _musicvolume;
playmusic "";
bis_fnc_respawnNone_start = nil;
