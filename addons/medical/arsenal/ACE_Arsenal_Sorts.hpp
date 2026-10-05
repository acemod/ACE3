class EGVAR(arsenal,sorts) {
    class sortBase;
    class ACE_protectionBallistic: sortBase {
        condition = QUOTE(!(missionNamespace getVariable [ARR_2(QQEGVAR(medical,enabled),false)])); // Hide if medical is enabled
    };
    class ACE_protectionExplosive: ACE_protectionBallistic {
        condition = QUOTE(!(missionNamespace getVariable [ARR_2(QQEGVAR(medical,enabled),false)])); // Hide if medical is enabled
    };
    class GVAR(armor): ACE_protectionBallistic {
        displayName = CSTRING(sortByArmorText);
        condition = QUOTE(missionNamespace getVariable [ARR_2(QQEGVAR(medical,enabled),false)]); // Show if medical is enabled
        statement = QUOTE(call FUNC(sortStatement_armor));
    };
};
