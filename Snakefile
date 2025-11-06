rule exploreBMX:
    "Explore BMX data"
    input:
        "original/BMX_D.csv"
    output: ""
    shell: """
    bash 1_exploreBMX.sh
    """


