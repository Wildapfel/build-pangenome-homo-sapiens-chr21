CONTAINER_TOOL=$1 
N_CORES=$2 

# copy relevant files into __demo__ and change directory in subshell
cp Snakefile __demo__
cp Dockerfile __demo__
cp -r configs __demo__
cp -r envs __demo__
cd __demo__

# build the container
if [[ $CONTAINER_TOOL == "podman" ]] ; then
    $CONTAINER_TOOL build --format docker -t pangenome-workflow .;
elif [[ $CONTAINER_TOOL == "docker" ]] ; then 
    $CONTAINER_TOOL build -t pangenome-workflow .;
fi

# execute pipeline
if [[ $CONTAINER_TOOL == "podman" ]] ; then
    podman run \
        -v $(pwd):/mnt:z \
        -w /mnt \
        localhost/pangenome-workflow:latest \
        micromamba run -n bioinfo-pangenome snakemake demo --cores $N_CORES;
elif [[ $CONTAINER_TOOL == "docker" ]] ; then
    echo docker execution not implemented yet.;
fi