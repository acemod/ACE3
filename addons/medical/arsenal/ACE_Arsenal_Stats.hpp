class EGVAR(arsenal,stats) {
    class statBase;
    class ACE_ballisticProtection: statBase {
        condition = QUOTE(!(missionNamespace getVariable [ARR_2(QQEGVAR(medical,enabled),false)])); // Hide if medical is enabled
    };
    class ACE_explosiveResistance: statBase {
        condition = QUOTE(!(missionNamespace getVariable [ARR_2(QQEGVAR(medical,enabled),false)])); // Hide if medical is enabled
    };
    class GVAR(armor): ACE_ballisticProtection {
        displayName = "$STR_UI_ABAR";
        condition = QUOTE(missionNamespace getVariable [ARR_2(QQEGVAR(medical,enabled),false)]); // Show if medical is enabled
        showBar = 1;
        barStatement = QUOTE((_this select 1) call FUNC(statBarStatement_armor));
        showText = 1;
        textStatement = QUOTE((_this select 1) call FUNC(statTextStatement_armor));
    };
};
