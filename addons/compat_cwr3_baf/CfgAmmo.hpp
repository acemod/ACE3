class CfgAmmo {
    class MissileBase;

    class cwr3_m_javelin_aa: MissileBase {
        effectsMissile = "missile2"; // Remove vanilla tracking flare, missileguidance adds it's own.
        thrust = 275;       // Give a more realistic thrust and thrustTime
        thrustTime = 3;     // Since we don't need it longer for the vanilla flare.
        timeToLive = 20;

        class ace_missileguidance: ace_missileguidance_type_RBS70 {
            // SACLOS guidance
            enabled = 1;
            lineGainD = 16;
            lineGainP = 30;
            seekerMaxRange = 5500;
            showTrail = 1;
        };
    };

    class cwr3_m_blowpipe_aa: cwr3_m_javelin_aa {
        thrust = 240;
        thrustTime = 3;
        class ace_missileguidance: ace_missileguidance_type_Blowpipe {
            // MCLOS guidance
            enabled = 1;
            showTrail = 1;
        };
    };
};
