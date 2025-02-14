class MissileLauncher;
class GVAR(mock_w_Malyutka): MissileLauncher {
    displayName = "Test Malyutka";
    GVAR(hasMCLOSControl) = 1;
    magazineReloadTime=1;
    magazines[] = { QGVAR(mock_m_Malyutka) };
};
