class MissileLauncher;
class GVAR(mock_w_Malyutka): MissileLauncher {
    displayName = "Test Malyutka";
    magazineReloadTime=1;
    magazines[] = { QGVAR(mock_m_Malyutka) };
};

class launch_RPG7_F;
class GVAR(mock_w_Blowpipe): launch_RPG7_F {
    displayName = "Test Blowpipe";
    canLock = 0;
    magazineWell[] = {};
    magazines[] = {QGVAR(mock_m_blowpipe)};
};
