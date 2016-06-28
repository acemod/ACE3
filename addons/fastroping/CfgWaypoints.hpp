class CfgWaypoints {
    class ACE {
        displayName = "ACE";
        class Fastrope {
            displayName = CSTRING(Waypoint_Fastrope);
            displayNameDebug = "Fastrope";
            file = QPATHTOF(functions\fnc_deployAIWaypoint.sqf);
            icon = QPATHTOF(UI\Icon_Waypoint.paa);
        };
    };
};
