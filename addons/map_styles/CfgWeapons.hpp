class CfgWeapons {
    class ItemMap;
    class GVAR(topographic): ItemMap {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(item_topographic);
    };
    class GVAR(satellite): ItemMap {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(item_satellite);
    };
    class GVAR(roadMap): ItemMap {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(item_roadMap);
    };
};
