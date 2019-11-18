# DESCRIPTION:
# mk module to run hicup_filter
#
# USAGE:
# Single target execution: `mk <TARGET>` where TARGET is
# any line printed by the script `bin/targets`
#
# Multiple target execution in tandem `bin/targets | xargs mk`
#
# AUTHOR: HRG
#
# Load configuration file
< config.mk
#
# Run HiCUP filter script
#
results/%.filt.sam:	data/%.pair.sam
	mkdir -p `dirname $target`
	hicup_filter \
		--threads $HF_THREADS_NUMBER \
		--digest $DIGESTED_GENOME_PATH \
		--longest  $LONGEST_NT \
		--shortest $SHORTEST_NT \
		--outdir `dirname $target` \
		$prereq

