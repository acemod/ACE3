#include "shared.hpp"
#include "p3d\parser.hpp"
#include "simulation\object.hpp"

INITIALIZE_EASYLOGGINGPP

int main(int argc, char **argv) {
    ace::p3d::parser _parser;
    
    el::Configurations log_conf;
    log_conf.setGlobally(el::ConfigurationType::Filename, "logs/p3d_parser.log");

#ifdef _DEBUG
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "[%datetime] - %level - {%loc}t:%thread- %msg");
    //%d%M%Y-%H:%m:%s.%g            
#else
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "%datetime-{%level}- %msg");
#endif

    if (argc < 2) {
        printf("Usage: %s [file.p3d]", argv[0]);
        return -1;
    }
    ace::p3d::model_p _model = _parser.load(argv[1]);

    ace::simulation::object _object(_model);


	std::map<std::string, float> test_phases;
	test_phases["box3_translate"] = -10.0f;
	std::vector<std::string> test_lods;
	test_lods.push_back("GEO");
	_object.animate(test_phases, test_lods);
    /*printf("lod 0 face 0: %f %f %f\n\n", _object.lods[0]->faces[0]->vertices[0]->x(),
        _object.lods[0]->faces[0]->vertices[1]->y(),
        _object.lods[0]->selections[0]->faces[0]->vertices[0]->z());*/
    //printf("lod 0 vertex 100 selection 0: %s", _object.lods[0]->vertices[100]->selections[0]->name.c_str());
    getchar();

    return 0;
} 