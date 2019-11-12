#!/usr/bin/perl

use warnings;
use Bio::SeqIO;
 
# Bring in the file, or die with a nice
# usage statement if one or both arguments are missing.
my($usage) = "./SOX10_Dimers_pos_bothstrands.pl file "; 
my($file) = shift or die $usage;

my($outname) = $file.".DimerSOX10motifs.bothstrands.txt";

open (OUTPUT, ">>$outname") or die "Could not make output file";

my($inseq) = Bio::SeqIO->new(-file => $file, -format => 'fasta', ); 
while (my($seq) = $inseq->next_seq) {
	my($string) = $seq->seq;
	my($header) = $seq->id;		
	while ($string =~ /(ACAAA|ACAAT|AGAAA|ACAGA|CCAAT|AAAAA|GCAAA|CCAAA|AAAAT|ACCAA|ACAGT|AGAAT|GCAAT|ACGAA|TCAAA|ACCAT|ACTAA|ACACT|ATAAA|ACAAC|ACATA|ACTAT|ACGAT|ACATT|ATAAT|TCAAT|ACACA|ACAAG)(.{5,10})(TTTGT|TGTGT|ATTGT|CTTGT|TTTCT|TCTGT|ATTGG|TTTTT|TTTGC|TTTGG|ATTTT|TTGGT|ACTGT|ATTCT|ATTGC|TTCGT|TTTGA|ATGGT|TTAGT|AGTGT|TTTAT|GTTGT|TATGT|ATAGT|ATCGT|AATGT|ATTAT|ATTGA)/g ) {
		print OUTPUT "$header\t$1\t$2\t$3\t" . pos($string) . "\n";
	}
	while ($string =~ /(TGTTT|TGTTA|TCTTT|TGTCT|GGTTA|TTTTT|CGTTT|GGTTT|TTTTA|TGGTT|TGTCA|TCTTA|CGTTA|TGCTT|AGTTT|TGGTA|TGATT|TGTGA|TATTT|TGTTG|TGTAT|TGATA|TGCTA|TGTAA|TATTA|AGTTA|TGTGT|TGTTC)(.{5,10})(AAACA|ACACA|TAACA|GAACA|AAAGA|AGACA|TAACC|AAAAA|AAACG|AAACC|TAAAA|AACCA|TGACA|TAAGA|TAACG|AAGCA|AAACT|TACCA|AATCA|TCACA|AAATA|CAACA|ATACA|TATCA|TAGCA|TTACA|TAATA|TAACT)/g ) {
		print OUTPUT "$header\t$1\t$2\t$3\t" . pos($string) . "\n";
	}
}

close OUTPUT;

