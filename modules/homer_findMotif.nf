
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