class CfgVehicles {
    class Car_F;
    class LSV_02_base_F: Car_F {
        class Turrets;
    };
    class LSV_02_AT_base_F: LSV_02_base_F {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class O_LSV_02_AT_F: LSV_02_AT_base_F {};
    class GVAR(mock_lsv_Malyutka): O_LSV_02_AT_F {
        scope = 1;
        displayName = "[ACE] Test Malyutka LSV";
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = { QGVAR(mock_w_Malyutka) };
                magazines[] = { QGVAR(mock_m_Malyutka), QGVAR(mock_m_Malyutka), QGVAR(mock_m_Malyutka), QGVAR(mock_m_Malyutka), QGVAR(mock_m_Malyutka), QGVAR(mock_m_Malyutka), QGVAR(mock_m_Malyutka), QGVAR(mock_m_Malyutka) };
            };
        };
    };
};
