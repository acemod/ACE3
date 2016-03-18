class CfgWeapons {
    class ItemCore;
    class ItemMap: ItemCore {
        GVAR(isMap) = 1;
    };
    class ACE_map: ItemMap {
        scope = 0;
        scopeArsenal = 0;
        scopeCurator = 0;
        GVAR(mapID) = 0;
    };
    ACE_MAPS(ACE_map)
};
