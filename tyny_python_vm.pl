#!/usr/bin/env perl
use strict;
use warnings;

my @AST = ();

while (my $line = <>){
    if ($line =~ /(\d+)\s*([A-Z_]+)\s*(\d)?\s*/){
        my $instruction_str = [$2];
        
        if ($'){
            if ($line =~ /\('?(.*?)'?\)/){
                push @$instruction_str, $1;
            }
        }
        push @AST, $instruction_str;
    }
}

my @stack = ();
my %stack_hash = ();

for my $line (@AST){
    my $instruction = shift @$line;
    if ($instruction =~ /LOAD/){
        if ($instruction =~ /FAST/){
           my $str = 9;
           push @stack, $str; 
           next;
       } 
       push @stack, shift @$line; 
       next;
    }

    if ($instruction =~ /ADD/){
        my $left = shift @stack;
        my $right = shift @stack;
        my $sum = $left + $right;
        push @stack, $sum;
        next;
    }

    if ($instruction =~ /STORE/){
        $stack_hash{shift @$line} = pop @stack;
        next;
    }

    if ($instruction =~ /CALL/){
        my $function = shift @stack;
        my $arg = shift @stack;

        if ($function eq 'print'){
            print "$arg\n";
        }
        next;
    }
}
