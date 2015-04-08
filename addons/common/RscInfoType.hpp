
class RscInGameUI {
    class RscUnitInfo;
    class RscUnitInfoSoldier: RscUnitInfo {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscUnitInfo"",'IGUI')] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; uiNamespace setVariable [ARR_2('ACE_dlgSoldier',   _this select 0)]; [ARR_2('infoDisplayChanged', [ARR_2(_this select 0, 'Soldier')])]   call FUNC(localEvent););
    };
    class RscUnitInfoTank: RscUnitInfo {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscUnitInfo"",'IGUI')] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; uiNamespace setVariable [ARR_2('ACE_dlgVehicle',   _this select 0)]; [ARR_2('infoDisplayChanged', [ARR_2(_this select 0, 'Vehicle')])]   call FUNC(localEvent););
    };
    class RscUnitInfoAir: RscUnitInfo {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscUnitInfo"",'IGUI')] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; uiNamespace setVariable [ARR_2('ACE_dlgAircraft',  _this select 0)]; [ARR_2('infoDisplayChanged', [ARR_2(_this select 0, 'Aircraft')])]  call FUNC(localEvent););
    };
    class RscUnitInfoSubmarine: RscUnitInfo {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscUnitInfo"",'IGUI')] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; uiNamespace setVariable [ARR_2('ACE_dlgSubmarine', _this select 0)]; [ARR_2('infoDisplayChanged', [ARR_2(_this select 0, 'Submarine')])] call FUNC(localEvent););
    };
    class RscUnitInfoShip: RscUnitInfo {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscUnitInfo"",'IGUI')] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; uiNamespace setVariable [ARR_2('ACE_dlgShip',      _this select 0)]; [ARR_2('infoDisplayChanged', [ARR_2(_this select 0, 'Ship')])]      call FUNC(localEvent););
    };
    class RscUnitInfoParachute: RscUnitInfo {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscUnitInfo"",'IGUI')] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; uiNamespace setVariable [ARR_2('ACE_dlgParachute', _this select 0)]; [ARR_2('infoDisplayChanged', [ARR_2(_this select 0, 'Parachute')])] call FUNC(localEvent););
    };
};

class RscDisplayInventory {
    onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscDisplayInventory"",'IGUI')] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; [ARR_2('inventoryDisplayLoaded', _this)] call FUNC(localEvent););
};

class RscDisplayChannel {
    onLoad = QUOTE(_this call FUNC(onLoadRscDisplayChannel));
};

// map
class RscDisplayMainMap {
    onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscDiary"",'GUI')] call    (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable [ARR_2('ACE_dlgMap', _this select 0)]; [ARR_2('mapDisplayLoaded', [ARR_2(_this select 0, 'Ingame')])] call FUNC(localEvent););
};

class RscDisplayGetReady: RscDisplayMainMap {
    onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscDiary"",'GUI')] call    (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable [ARR_2('ACE_dlgMap', _this select 0)]; [ARR_2('mapDisplayLoaded', [ARR_2(_this select 0, 'Briefing')])] call FUNC(localEvent););
};

class RscDisplayServerGetReady: RscDisplayGetReady {
    onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscDiary"",'GUI')] call    (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable [ARR_2('ACE_dlgMap', _this select 0)]; [ARR_2('mapDisplayLoaded', [ARR_2(_this select 0, 'ServerBriefing')])] call FUNC(localEvent););
};


class RscDisplayClientGetReady: RscDisplayGetReady {
    onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscDiary"",'GUI')] call    (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable [ARR_2('ACE_dlgMap', _this select 0)]; [ARR_2('mapDisplayLoaded', [ARR_2(_this select 0, 'ClientBriefing')])] call FUNC(localEvent););
};
