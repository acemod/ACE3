class CfgSounds {
    class ACE_Sound_Click;
    class ACE_Scopes_Click_1: ACE_Sound_Click {
        sound[] = {QPATHTOF(sounds\ACE_scopes_click.wav),3, 2, 200};
    };
    class ACE_Scopes_Click_2: ACE_Scopes_Click_1 {
        sound[] = {QPATHTOF(sounds\ACE_scopes_click.wav), 3.3, 1.8, 200};
    };
    class ACE_Scopes_Click_3: ACE_Scopes_Click_1 {
        sound[] = {QPATHTOF(sounds\ACE_scopes_click.wav), 2.8, 2.3, 200};
    };
};
