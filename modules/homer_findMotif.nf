
process FIND_MOTIFS_GENOME {

    tag "${bed}"
    //container "docker.io/mathysgrapotte/stimulus-py:latest"

    input:
    path bed
    val genome
    

    output:
    stdout emit: standardout

    script:
    """
    echo ${bed} ${genome}
    # findMotifsGenome.pl <peak/BED file> <genome> <output directory> -size # [options]
    """

}