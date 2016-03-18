class CfgWaypoints {
    class ACE {
        displayName = "ACE";
        class Fastrope {
            displayName = CSTRING(Waypoint_Fastrope);
            displayNameDebug = "Fastrope";
            file = QUOTE(PATHTOF(functions\fnc_deployAIWaypoint.sqf));
            icon = QUOTE(PATHTOF(UI\Icon_Waypoint.paa));
        };
    };
};
