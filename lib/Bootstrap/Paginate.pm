package Bootstrap::Paginate;
use Dancer ':syntax';

our $VERSION = '0.1';

get '/' => sub {
    my %vars = ();

    template index => \%vars;
};

get '/results' => sub {
    my %vars = ();

    $vars{results} = [
        { qw( foo a bar a baz a qux a ) },
        { qw( foo b bar b baz b qux b ) },
        { qw( foo c bar c baz c qux c ) },
        { qw( foo d bar d baz d qux d ) },
    ];

    template results => \%vars;
};

true;
