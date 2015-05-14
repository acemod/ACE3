#include <string>
#include <vector>

namespace ace {
    namespace medical {
        namespace injuries {
            class DamageType;

            class InjuryType
            {
            public:
				InjuryType(signed int anId, const std::string& aClassname, std::vector<std::string>& allowedSelections, double theBloodLoss, double thePain, double minimumDamage, double maximumDamage, std::vector<std::string>& possibleCauses, std::string& aDisplayname);
                ~InjuryType();

                signed int ID;
                std::string className;
                std::vector<std::string> selections;
                double bloodLoss;
                double pain;
                double minDamage;
                double maxDamage;
                std::vector<std::string> causes;
                std::string displayName;
            };
        }
    }
}