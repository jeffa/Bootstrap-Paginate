package Bootstrap::Paginate;
use Dancer ':syntax';
use Data::Page;

our $VERSION = '0.1';

get '/' => sub {
    my %vars = ();

    template index => \%vars;
};

get '/results' => sub {

    my $per  = param( 'per' ) || 10;
    my $curr = param( 'curr' ) || 1;

    my @results = ( 
        map {{ foo => $_, bar => $_, baz => $_, qux => $_ }} 
        map { sprintf '%04d', $_ }
        1 .. 9999
    );

    my $pager = Data::Page->new();
    $pager->total_entries( scalar @results );
    $pager->entries_per_page( $per );
    $pager->current_page( $curr );

    template results => {
        results => [ $pager->splice( \@results ) ],
        pager   => $pager,
        per     => $per,
        curr    => $curr,
        range   => [ $pager->current_page .. $pager->current_page + 5 ],        
    };
};

true;
