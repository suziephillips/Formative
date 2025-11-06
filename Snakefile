rule all:
    input:
       "logs/1_exploreBMX.log"

rule exploreBMX:
    "Explore BMX data"
    input:
        "data/original/BMX_D.csv"
    output:
        "logs/1_exploreBMX.log"
    shell: """
    cd code
    mkdir logs
    bash 1_exploreBMX.sh > ../logs/1_exploreBMX.log
    """


