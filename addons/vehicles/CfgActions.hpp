class CfgActions {
    class None;
    class Eject: None {
        show = QUOTE(call compile getText (configFile >> 'CfgActions' >> 'Eject' >> 'GVAR(setting)'));
        GVAR(setting) = QUOTE(profileNamespace getVariable [ARR_2('GVAR(showEjectAction)',0)]);
    };
};
