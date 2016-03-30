# General makefile to get all datasets

# List of datasets, and the folders to download them to
DATASETS = $(shell ls datasets)
FOLDERS = $(patsubst %.txt, %, $(DATASETS))

all: $(FOLDERS)

clean: 
	rm -rf $(FOLDERS)

# make the folders themselves, if not existing, copy the dataset file
# and copy the MakeGet makefile into it
% : datasets/%.txt
	if [ ! -d $@ ]; then mkdir $@; fi
	cp $< $@/matrices.txt
	cp MakeGet $@/Makefile
	cd $@ && make -j4


