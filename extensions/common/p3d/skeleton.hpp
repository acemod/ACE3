#pragma once
#pragma once

#include "shared.hpp"


namespace ace {
    namespace p3d {
        class bone {
        public:
            bone() : name(""), parent("") {}
            bone(const std::string & name_, const std::string & parent_)
                : name(name_), parent(parent_) {
            }
            std::string name;
            std::string parent;
            std::vector<std::string> children;
            std::vector<uint32_t> animations;
        };
        typedef std::shared_ptr<bone> bone_p;

        class skeleton {
        public:
            skeleton();
            skeleton(std::istream &, const uint32_t lod_count);
            ~skeleton();

            std::string name;
            bool inherited;
            uint32_t size;
            std::map<std::string, bone_p> root_bones;
            std::vector<bone_p> all_bones;
        };
        typedef std::shared_ptr<skeleton> skeleton_p;
    }
}
