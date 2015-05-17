#pragma once

#include <atomic>

#include "shared.hpp"
#include "pbo/search.hpp"
#include "p3d/model.hpp"
#include "singleton.hpp"

namespace ace {
    class model_entry {
    public:
        model_entry() {}
        model_entry(const std::string & p3d_path_, ace::p3d::model_p model_) : p3d_path(p3d_path_), model(model_) {  }
        std::string         p3d_path;
        ace::p3d::model_p   model;
    };

    class model_collection : public singleton<model_collection> {
    public:
        model_collection();
        bool load_model(const std::string & p3d_path, std::string & key_name);
   
        bool init();
        bool reset();

        std::unordered_map<std::string, model_entry> models;

        bool initialized(void) const { return _initialized; }
        bool ready(void) const { return _ready; }
        
    protected:
        bool _load_model(const std::string &, const std::string &);

        std::atomic_bool _ready;
        std::atomic_bool _initialized;

        ace::pbo::search_p _pbo_searcher;
    };
}