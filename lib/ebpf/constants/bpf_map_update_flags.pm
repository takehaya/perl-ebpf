package ebpf::constants::bpf_map_update_flags;

use strict;
use warnings;
use Exporter 'import';

our $VERSION = $ebpf::VERSION;

my %constants = (
    'BPF_ANY'    => 0,  # create new element or update existing
    'BPF_NOEXIST'=> 1,  # create new element if it didn't exist
    'BPF_EXIST'  => 2,  # update existing element
    'BPF_F_LOCK' => 4,  # spin_lock-ed map_lookup/map_update
);

our @EXPORT_OK = keys %constants;
our %EXPORT_TAGS = (all => \@EXPORT_OK);

for my $name (@EXPORT_OK) {
    no strict 'refs';
    *{$name} = sub () { $constants{$name} };
}

1;
