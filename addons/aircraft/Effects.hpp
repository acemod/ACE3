class ACE_Gau8ShellImpact {
    class LightExp {
        simulation = "light";
        type = "ACE_Gau8ShellExplLght";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
    class Explosion1 {
        simulation = "particles";
        type = "ACE_Gau8ShellExplCldlt";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
    class ExpSpark {
        simulation = "particles";
        type = "ACE_Gau8ShellSprksCldlt";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
    class SmallSmoke1 {
        simulation = "particles";
        type = "ACE_Gau8ShellSmkCldlt";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
    class MedDust1 {
        simulation = "particles";
        type = "ACE_Gau8ShellDstCldlt";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
    class BigDirt1 {
        simulation = "particles";
        type = "ACE_Gau8ShellDrtCldlt";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
};
