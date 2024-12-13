
process FIND_MOTIFS_GENOME {

    tag "${bed}"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/homer:4.11--pl526hc9558a2_3' :
        'biocontainers/homer:4.11--pl526hc9558a2_3' }"

    input:
    path bed
    path genome
    

    output:
    stdout emit: standardout

    script:
    """
    findMotifsGenome.pl  ${bed} ${genome} ${params.outdir}
    """

}

process FIND_MOTIFS {

    tag "${gene_file}"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/homer:4.11--pl526hc9558a2_3' :
        'biocontainers/homer:4.11--pl526hc9558a2_3' }"

    input:
    path gene_file
    val species_name


    output:
    stdout emit: standardout

    script:
    def args = task.ext.args ?: ''
    """
    findMotifs.pl  ${gene_file} ${species_name} ${params.outdir} $args
    """

}
