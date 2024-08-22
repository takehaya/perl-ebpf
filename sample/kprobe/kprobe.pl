#!/usr/bin/env perl

use strict;
use warnings;
use lib '../../lib';  # lib ディレクトリへの相対パスを追加
use lib '../../blib/arch/auto/ebpf/c_bpf_loader';
use ebpf::loader;
use Data::Dumper;

my $file = "kprobe.o";
my $loader = ebpf::loader->new($file);
my $data = $loader->load();
print Dumper($data);

$loader->attach_bpf("kprobe/sys_execve");

# いろいろな出力方法があるっぽい
# print Dumper($data);
# print "magic: $data->{magic}, $data->{class}\n";
# while (my ($key, $value) = each %$data) {
#     print "$key: $value\n";
# }