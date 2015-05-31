use Mojo::Base -strict;
use Test::More;
use Convos;

{
  my $convos = Convos->new;
  is $convos->config->{name}, 'Nordaaker', 'default name';
  is $convos->config->{swagger_file}, $self->home->rel_file('public/api.json'), 'default swagger_file';
  is $convos->config->{hypnotoad}{listen}[0], 'http://*:8080', 'default listen';
  is $convos->config->{hypnotoad}{pid_file}, undef, 'default pid_file';
}

{
  $ENV{CONVOS_ORGANIZATION_NAME} = 'cool.org';
  $ENV{CONVOS_FRONTEND_PID_FILE} = 'pidfile.pid';
  $ENV{MOJO_LISTEN}              = 'http://*:1234';
  my $convos = Convos->new;
  is $convos->config->{name}, 'cool.org', 'env name';
  is $convos->config->{hypnotoad}{listen}[0], 'http://*:1234', 'env listen';
  is $convos->config->{hypnotoad}{pid_file}, 'pidfile.pid', 'env pid_file';
}

done_testing;
