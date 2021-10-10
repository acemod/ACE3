
class RscInGameUI {
    class RscUnitInfo;
    class RscUnitInfoNoHUD {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscUnitInfoSoldier: RscUnitInfo {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscUnitInfo"",'IGUI')] call (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable [ARR_2('ACE_dlgSoldier', _this select 0)]; [ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Soldier')])] call CBA_fnc_localEvent;);
    };

    class RscUnitInfoTank: RscUnitInfo {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscUnitInfo"",'IGUI')] call (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable [ARR_2('ACE_dlgVehicle',     _this select 0)];);
    };

    class RscUnitInfoAirNoWeapon: RscUnitInfo {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscUnitInfo"",'IGUI')] call (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable [ARR_2('ACE_dlgAircraft',    _this select 0)];);
    };

    class RscUnitInfoAir: RscUnitInfoAirNoWeapon {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscUnitInfo"",'IGUI')] call (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable [ARR_2('ACE_dlgAircraft',    _this select 0)];);
    };

    class RscUnitInfo_AH64D_gunner {
        onLoad = QUOTE(uiNamespace setVariable [ARR_2('ACE_dlgAircraft',    _this select 0)]; [ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Aircraft')])]    call CBA_fnc_localEvent;);
    };

    class RscUnitInfoUAV {
        onLoad = QUOTE(uiNamespace setVariable [ARR_2('ACE_dlgUAV',         _this select 0)]; [ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'UAV')])]         call CBA_fnc_localEvent;);
    };

    class RscUnitInfoSubmarine: RscUnitInfo {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscUnitInfo"",'IGUI')] call (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable [ARR_2('ACE_dlgSubmarine',   _this select 0)];);
    };

    class RscUnitInfoShip: RscUnitInfo {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscUnitInfo"",'IGUI')] call (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable [ARR_2('ACE_dlgShip',        _this select 0)];);
    };

    class RscWeaponEmpty {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscWeaponRangeFinder {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscWeaponRangeArtillery {
        onLoad = QUOTE(uiNamespace setVariable [ARR_2('ACE_dlgArtillery',   _this select 0)]; [ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Artillery')])]   call CBA_fnc_localEvent;);
    };

    class RscWeaponRangeArtilleryAuto {
        onLoad = QUOTE(uiNamespace setVariable [ARR_2('ACE_dlgArtillery',   _this select 0)]; [ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Artillery')])]   call CBA_fnc_localEvent;);
    };

    class RscWeaponRangeFinderPAS13 {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscOptics_LaserDesignator {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscWeaponRangeFinderMAAWS {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscWeaponRangeFinderAbramsCom {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscWeaponRangeFinderAbramsGun {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscWeaponRangeFinderStrykerMGSGun {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscOptics_strider_commander {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscOptics_titan {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscOptics_punisher {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscOptics_SDV_periscope {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscUnitInfoParachute: RscUnitInfo {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscUnitInfo"",'IGUI')] call (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable [ARR_2('ACE_dlgParachute', _this select 0)]; [ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Parachute')])] call CBA_fnc_localEvent;);
    };

    class RscUnitVehicle {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscOptics_LaserDesignator_02 {
        onLoad = QUOTE([ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Any')])] call CBA_fnc_localEvent;);
    };

    class RscStaminaBar {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscStaminaBar"",'IGUI')] call (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable [ARR_2(QUOTE(QGVAR(dlgStaminaBar)),_this select 0)]);
    };

    class RscStanceInfo {
        onLoad = QUOTE([ARR_4(""onLoad"",_this,""RscStanceInfo"",'IGUI')] call (uinamespace getvariable 'BIS_fnc_initDisplay'); [ARR_2('ace_infoDisplayChanged', [ARR_2(_this select 0, 'Stance')])] call CBA_fnc_localEvent;);
    };
};
