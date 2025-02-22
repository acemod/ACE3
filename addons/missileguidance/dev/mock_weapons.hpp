class MissileLauncher;
class GVAR(mock_w_Malyutka): MissileLauncher {
    displayName = "Test Malyutka";
    magazineReloadTime=1;
    magazines[] = { QGVAR(mock_m_Malyutka) };
};
