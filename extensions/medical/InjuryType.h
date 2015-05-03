#include <string>
#include <vector>

namespace ace {
    namespace medical {
        namespace injuries {
            class DamageType;

            class InjuryType
            {
            public:
                InjuryType(signed int anId, const std::string& aClassname, std::vector<std::string>& allowedSelections, signed int theBloodLoss, signed int thePain, signed int minimumDamage, signed int maximumDamage, std::vector<std::string>& possibleCauses, std::string& aDisplayname);
                ~InjuryType();

                signed int ID;
                std::string className;
                std::vector<std::string> selections;
                signed int bloodLoss;
                signed int pain;
                signed int minDamage;
                signed int maxDamage;
                std::vector<std::string> causes;
                std::string displayName;
            };
        }
    }
}