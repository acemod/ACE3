#pragma once

#include <string>

namespace ace {
    namespace medical {
        namespace injuries {
            class OpenWound
            {
            public:
                OpenWound(int anID, int aClassID, int aBodyPartId, double aPercentage, double aBl, double painAmount);
                ~OpenWound();

                std::string AsString();

                int woundID;
                int classID;
                int percentage;
                double bodyPart;
                double bloodlossRate;
                double pain;
            };

        }
    }
}
