BIN = bin
RELEASE = release
SRC = addons

$(BIN)/ace_%.pbo: $(SRC)/%
	@mkdir -p $(BIN)
	@echo "  PBO  $@"
	@armake build -f $< $@

all: $(patsubst $(SRC)/%, $(BIN)/ace_%.pbo, $(wildcard $(SRC)/*))

clean:
	rm -rf $(BIN) $(RELEASE) extensions/build/*

extensions: $(wildcard extensions/*/*)
	cd extensions/build && cmake .. && make
	find ./extensions/build/ \( -name "*.so" -o -name "*.dll" \) -exec cp {} ./ \;

extensions-win64: $(wildcard extensions/*/*)
	cd extensions/build && CXX=$(eval $(which g++-w64-mingw-i686)) cmake .. && make

release: all
	@mkdir $(RELEASE) 2> /dev/null || rm -rf $(RELEASE)/*
	@mkdir -p $(RELEASE)/@ace/addons
	@cp $(BIN)/* $(RELEASE)/@ace/addons/
	@cp *.dll $(RELEASE)/@ace/
	@cp *.cpp $(RELEASE)/@ace/
	@cp logo_ace3_ca.paa README.md LICENSE $(RELEASE)/@ace/
	@cp docs/* $(RELEASE)/@ace/
	@echo "  ZIP  $(RELEASE)/@ace.zip"
	@cd $(RELEASE); zip -r @ace.zip @ace &> /dev/null; cd ..
