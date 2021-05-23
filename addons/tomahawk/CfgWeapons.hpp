class CfgWeapons {
    class weapon_VLS_01;
    class GVAR(c): weapon_VLS_01 {
        displayName = CSTRING(c);
        magazines[] = { QGVAR(c) };
    };
    class GVAR(d): weapon_VLS_01 {
        displayName = CSTRING(d);
        magazines[] = { QGVAR(d) };
    };
};

