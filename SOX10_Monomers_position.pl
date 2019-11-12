#!/usr/bin/perl

use warnings;
use Bio::SeqIO;
 
# Bring in the file, or die with a nice
# usage statement if one or both arguments are missing.
my($usage) = "./SOX10_Monomers_pos.pl file "; 
my($file) = shift or die $usage;

my($outname) = $file.".MonomerSOX10motifs.txt";

open (OUTPUT, ">>$outname") or die "Could not make output file";

my($inseq) = Bio::SeqIO->new(-file => $file, -format => 'fasta', ); 
while (my($seq) = $inseq->next_seq) {
	my($string) = $seq->seq;
	my($header) = $seq->id;		
	while ($string =~ /(ACAAA|ACAAT|AGAAA|ACAGA|CCAAT|AAAAA|GCAAA|CCAAA|AAAAT|ACCAA|ACAGT|AGAAT|GCAAT|ACGAA|TCAAA|ACCAT|ACTAA|ACACT|ATAAA|ACAAC|ACATA|ACTAT|ACGAT|ACATT|ATAAT|TCAAT|ACACA|ACAAG|TTTGT|TGTGT|ATTGT|CTTGT|TTTCT|TCTGT|ATTGG|TTTTT|TTTGC|TTTGG|ATTTT|TTGGT|ACTGT|ATTCT|ATTGC|TTCGT|TTTGA|ATGGT|TTAGT|AGTGT|TTTAT|GTTGT|TATGT|ATAGT|ATCGT|AATGT|ATTAT|ATTGA)/g ) {
		print OUTPUT "$header\t$1\t" . pos($string) . "\n";
	}
}

close OUTPUT;