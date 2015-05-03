#pragma once

#include <string>

namespace ace {
    namespace medical {
        namespace injuries {
            class OpenWound
            {
            public:
                OpenWound(unsigned int anID, unsigned int aBodyPart, unsigned int bloodloss);
                ~OpenWound();

                std::string AsString();

                unsigned int classID;
                unsigned int bodyPart;
                unsigned int bloodlossRate;
            };

        }
    }
}
