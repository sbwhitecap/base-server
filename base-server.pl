#!/usr/bin/env perl
use FindBin;
use local::lib "$FindBin::Bin/local";
use Mojolicious::Lite;

post '/' => sub {
    my $c = shift;
    my $password = $c->param('password');

    if (eval("'hello' eq '$password'")) {
        $c->redirect_to('/success');
    } else {
        $c->redirect_to('/failed');
    }
    #$c->render(template => 'debug', out => $password);
};

get '/' => sub {
  my $c = shift;
  $c->render(template => 'index');
};

get '/success' => sub {
    my $c = shift;
    $c->render(template => 'success');
};

get '/failed' => sub {
    my $c = shift;
    $c->render(template => 'failed');
};

app->start;

__DATA__

@@ index.html.ep
% layout 'default';
% title 'ログイン';
<h1>ログインしてください</h1>
<form action="/" method="post">
    <div>
        ユーザID: <input type="text" name="user_id">
    </div>
    <div>
        パスワード: <input type="password" name="password">
    </div>
    <input type="submit">
</form>

@@ debug.html.ep
% layout 'default';
% title 'デバッグ';
<%= $out =>

@@ success.html.ep
% layout 'default';
% title 'ログイン成功';
<h1>基地システムへようこそ</h1>

@@ failed.html.ep
% layout 'default';
% title 'ログイン失敗';
<h1>もう一度試してみてください</h1> <br>
<a href="/">戻る</a>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
