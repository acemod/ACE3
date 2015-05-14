#pragma once

#include <string>

namespace ace {
    namespace medical {
        namespace injuries {
            class OpenWound
            {
            public:
                OpenWound(double anID, double aBodyPart, double bloodloss);
                ~OpenWound();

                std::string AsString();

                double classID;
                double bodyPart;
                double bloodlossRate;
            };

        }
    }
}
