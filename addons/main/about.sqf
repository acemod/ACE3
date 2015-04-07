#include "script_component.hpp"
#include "\z\ace\addons\main\script_common.hpp"

if (!isNil "ACE_ABOUT_RUN") exitWith {ACE_ABOUT_RUN = false;};
ACE_ABOUT_RUN = true;

disableSerialization;

PARAMS_2(_menu,_data);

private ["_pcredits", "_pkeynam", "_shift", "_ctrl", "_alt", "_keys", "_key", "_keystrg", "_mod", "_knaml", "_knam", "_k", "_pkeys", "_pary", "_tpages", "_cEvents", "_i", "_cSys", "_tSys", "_aSys", "_tS", "_j", "_c", "_tC", "_keyn", "_fadet", "_page1", "_color", "_bcolor", "_newpages", "_pstart", "_pcount", "_pnext", "_display", "_control", "_pnames", "_pnam", "_page", "_pages", "_run", "_disp", "_next", "_input", "_nesc", "_unset", "_p", "_text", "_curPage", "_time", "_faded"];

_pcredits = [
"",
"<t align='center' color='#CC1100'>Advanced Combat Environment 2</t>",
"<t align='center' color='#566D7E'>http://dev-heaven.net/projects/ace-mod2</t>",
"",
__cr_managers,
"",
__cr_devs,
"",
__cr_testers,
"",
"For a full list of acknowledgements, please visit our Wiki:",
"<t color='#566D7E'>http://ace.dev-heaven.net</t>"
];

_pkeynam = { //local function
    _shift = if (_shift > 0) then {42} else {0};
    _ctrl = if (_ctrl > 0) then {56} else {0};
    _alt = if (_alt > 0) then {29} else {0};
    _keys = [_shift,_ctrl,_alt,_key];
    _keystrg = "^";
    {
        _mod = _x in [42,56,29];
        _knaml = call compile format["format['%2',%1]",(keyName _x),"%1"];
        _knaml = [_knaml, " "] call CBA_fnc_split;
        _knam = "^";
        {_k = _x; if (!_mod || (_k != (localize "STR_ACE_KN_LEFT") && _k != (localize "STR_ACE_KN_RIGHT"))) then {_knam = _knam + " " + _k}} forEach _knaml;
        _knam = [_knam, "^ ", ""] call CBA_fnc_replace;
        _keystrg = _keystrg + "-" + _knam;
    } forEach _keys;
    _keystrg = [_keystrg, "^ ", ""] call CBA_fnc_replace;
    _keystrg = [_keystrg, "^-", ""] call CBA_fnc_replace;
    _keystrg = [_keystrg, "^", "None"] call CBA_fnc_replace;
    _keystrg
};
_pkeys = {
    _pary = [];
    _tpages = [];
    _cEvents = configFile/"CfgSettings"/"CBA"/"events";
    for "_i" from 0 to (count _cEvents) - 1 do {
        _cSys = _cEvents select _i;
        _tSys = configName _cSys;
        if (isNumber ((_cSys select 0)/"key")) then {
            //format system name
            _aSys = [_tSys, "_"] call CBA_fnc_split;
            _tS = "^";
            {if (_x != "ace" && _x != "sys") then {_tS = _tS + " " + _x}} forEach _aSys;
            _tS = [_tS, "^ ", ""] call CBA_fnc_replace;
            _tS = format["<t color='#99cccc'>%1:</t>",_tS];
            PUSH(_pary,_tS);
            for "_j" from 0 to (count _cSys) - 1 do {
                _c = _cSys select _j;
                _tC = configName _c;
                _tC = [_tC, "_", " "] call CBA_fnc_replace;
                //key
                _key = getNumber (_c/"key");
                _shift = getNumber (_c/"shift");
                _ctrl = getNumber (_c/"ctrl");
                _alt = getNumber (_c/"alt");
                _keyn = [_key,_shift,_ctrl,_alt] call _pkeynam;
                _tC = format["    %1: %2",_tC,_keyn];
                PUSH(_pary,_tC);
            };
        };
        if (count _pary > 20) then { //split full page
            PUSH(_tpages,_pary);
            _pary = [];
        };
    };
    if (count _pary > 0) then { //partial page
        PUSH(_tpages,_pary);
        _pary = [];
    };
    _tpages
};

//pages (make sure each will fit within 24 lines, word wrap is on)
switch(_menu) do {
    case "MAIN": { //note: not all scripting commands available on main menu (not compiled yet?)
        _fadet = 13;
        _page1 = _pcredits;
    };
    case "SING": {
        _fadet = 20; //fade time
        _color = [1,1,1,1];
        //_bcolor = [0,0,0,0.3];
        _page1 = _pcredits;
        _newpages = [] call _pkeys;
        _pstart = 2;
        _pcount = count _newpages;
        _pnext = _pstart + _pcount;
    };
    case "MULT": {
        _fadet = 20;
        _color = [1,1,1,1];
        //_bcolor = [0,0,0,0.3];
        _page1 = _pcredits;
        _newpages = [] call _pkeys;
        _pstart = 2;
        _pcount = count _newpages;
        _pnext = _pstart + _pcount;
    };
    default {};
};

//main menu display
if (typeName(_data select 0) == "DISPLAY") then {
    _display = _data select 0;
};

if (typeName(_data select 0) == "CONTROL") then {
    _control = _data select 0;
    _display = ctrlParent _control;
};

//dynamic pages
_pnames = [];
for "_x" from _pstart to _pnext - 1 do {
    _pnam = format ["_page%1",_x];
    PUSH(_pnames,_pnam);
};
private _pnames;
for "_x" from 0 to _pcount - 1 do {
    call compile format ["%1 = %2", _pnames select _x, _newpages select _x];
};

//get num pages
_pages = 0;
_run = true;
while {_run} do {
    INC(_pages);
    if (isNil format ["_page%1", _pages]) exitWith {_pages = _pages - 1; _run = false};
};

if (_pages > 0) then {
    //Dialog
    createDialog "ACE_ABOUT_DLG";
    _disp = uiNamespace getVariable "ACE_ABOUT_DLG";
    _ctrl = _disp displayCtrl 1141371;
    _next = _disp displayCtrl 1141372;

    if (_pages > 1) then {_next ctrlSetText "Next"};

    _ctrl ctrlSetFade 1;
    _ctrl ctrlCommit 0;
    _ctrl ctrlSetFade 0;
    _ctrl ctrlCommit 3;

    ACE_ABOUT_INC = 0;
    _input = { //local function
        _nesc = isNil "ACE_ABOUT_STP";
        if (_pages == 1) then {ACE_ABOUT_INC = 0}; //ignore special control
        _unset = (ACE_ABOUT_INC == 0) && ACE_ABOUT_RUN;
        if (_unset && _nesc) then {false} else {_fadet = _fadet + 5; true};
    };

    //by default cycle
    for "_p" from 1 to _pages do {
        _text = "";
        _page = call compile format["_page%1",_p];
        _curPage = _p;
        {
            _text = _text + _x + "<br />";
            _ctrl ctrlSetStructuredText parseText _text;
            if (call _input) exitWith {_p = _pages};
            if (_x != "") then {uisleep 0.8};
        } forEach _page;
    };

    _run = true;
    while {if (isNil "ACE_ABOUT_STP") then {_run} else {false}} do {
        _ctrl ctrlSetFade 0;
        _ctrl ctrlCommit 0;
        if (!isNil "_color") then {_ctrl ctrlSetTextColor _color};
        if (!isNil "_bcolor") then {_ctrl ctrlSetBackgroundColor _bcolor};

        _curPage = _curPage + ACE_ABOUT_INC;
        if (_curPage > _pages) then {_curPage = 1};
        if (_curPage <= 0) then {_curPage = 1};
        ACE_ABOUT_INC = 0;

        if (!ACE_ABOUT_RUN) then {ACE_ABOUT_RUN = true};

        _text = "";
        _page = call compile format ["_page%1",_curPage];
        {_text = _text + _x + "<br />"} forEach _page;
        _ctrl ctrlSetStructuredText parseText _text;

        _ctrl ctrlSetFade 1;
        _ctrl ctrlCommit _fadet;

        _time = time + _fadet + 2;
        waitUntil{uisleep 1; _run = call _input; _faded = time > _time; (_run || _faded)};
    }; //while RUN
};
ACE_ABOUT_STP = Nil;
ACE_ABOUT_RUN = Nil;
closeDialog 0;