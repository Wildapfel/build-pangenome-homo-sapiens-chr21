# Pangenome-Graphs *homo sapiens* chr21

## Introduction
- An reproducible pangenome-build pipeline using Docker and Snakemake, including illustrations of interesting regions (male, female) found via Bandage in chromosome 21 of 10 chromosomes each
- Regions were inspected using `Badange`
- I found highly structural variant regions but also long conserved regions

## Data
- B-Lymphocyte WGS (male and female)
- The exact IDs can be found in `configs/data.yml`

## Illustrations of Structural Variants in Chromosome 21
| Potassium | Magnesium | 
|:---:|:---:|
| ![Potassium](results/bandage/female/bubbles_01.png) | ![Potassium](results/bandage/female/bubbles_01.png) |
| ![Potassium](results/bandage/female/bubbles_02.png) | ![Potassium](results/bandage/female/bubbles_02.png) |
| ![Potassium](results/bandage/female/bubbles_03.png) | ![Potassium](results/bandage/female/bubbles_03.png) |
| ![Potassium](results/bandage/female/conserved_region_01.png) | ![Potassium](results/bandage/female/conserved_region_01.png) |

*Fig. 1 illustrates the Bandage visualization of 4 regions of female (left) and 4 regions of male samples (right). The first three rows show uncerserved regions throughout the pangenomes, whereas the last row shows a highly conserved region.*

## Pipeline
1. Downloading chr 21 of *homo sapiens* (males and females)
2. Build pangenome graphs onto each subset 

## Run Demo
- Just copies the relevant files into `__demo__` and saves the pipeline output there (mirroring my execution)
- Execute the `run_demo` binary:
```
./run_demo.sh
```
- Open `Bandage` and load a sample
- `file > load graph (.grf) > select male/female .grf > draw graph > node labels:name`

## instructions

- build docker-image first

```bash
podman build --format docker -t pangenome-workflow .
```

- work inside the docker-image

```bash
./docker-container.sh
```

- prepare env and wd

```bash
micromamba activate bioinfo-pangenome
cd mnt
```

- run snakemake (set number of parellel process for yourself)

```bash
snakemake --cores <N>
```

## bandage



## run a demo

- inside the `__demo__` dir
- download: circa 900mb
- building the graphs takes time ... 
- set a number of cores !!!

```
cp Snakefile __demo__
cp -r configs __demo__/configs
cd __demo__
```
```
snakemake --cores <N>
```


*quick note*

- I set a number for multithreading in the minigraph build ...
- Bandage produces different looking grpahs
- `minigraph` also exports bed-like files which can be applied in downstream analysis
- `minigraph --call` outputs a reference to sample validation and takes sometime to compute,
  thats why only included a demo for a single sample
