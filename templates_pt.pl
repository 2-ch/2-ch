use strict;

BEGIN { require 'wakautils.pl' }



#
# Interface strings
#

use constant S_NAVIGATION => '<a href="http://2-ch.heliohost.org">2-ちゃんねる</a>';
use constant S_RETURN => '■Voltar ao keijiban■';
use constant S_RETURN2 => 'Voltar ao keijiban';
use constant S_ENTIRE => 'Tudo';
use constant S_ENTIRE2 => 'Ler tudo';
use constant S_LAST50 => 'Últimos 50';
use constant S_FIRST100 => '1-100';
use constant S_FIRST1002 => '1-';
use constant S_PREV100 => 'Anteriores 100';
use constant S_NEXT100 => 'Próximos 100';
use constant S_TOP => 'Topo do ita';
use constant S_BOARDLOOK => 'Board look:';
use constant S_MANAGE => 'Manage';
use constant S_REBUILD => 'Rebuild caches';
use constant S_ALLTHREADS => 'Lista de thread está aqui';
use constant S_NEWTHREAD_TITLE => 'Criação de nova thread';
use constant S_NAME => 'Nome:';
use constant S_LINK => 'E-mail:';
use constant S_FORCEDANON => '';
use constant S_CAPTCHA => 'Verificação:';
use constant S_TITLE => 'Título:';
use constant S_NEWTHREAD => 'Criação de nova thread';
use constant S_IMAGE => 'Imagem:';
use constant S_IMAGEDIM => 'Imagem: ';
use constant S_NOTHUMBNAIL => 'Sem<br />thumbnail';
use constant S_REPLY => 'Escrever';
use constant S_LISTEXPL => '';
use constant S_PREVEXPL => '';
use constant S_NEXTEXPL => '';
use constant S_LISTBUTTON => '&#9632;';
use constant S_PREVBUTTON => '&#9650;';
use constant S_NEXTBUTTON => '&#9660;';
use constant S_TRUNC => 'Escrita muito longa. Clique para ver <a href="%s" rel="nofollow">escrita inteira</a> ou <a href="%s">thread inteira</a>.';
use constant S_PERMASAGED => ', sage permanente';
use constant S_POSTERNAME => ':';
use constant S_DELETE => 'Del';
use constant S_USERDELETE => 'Apagado por usuário.';
use constant S_MODDELETE => 'Aboーn';
use constant S_CLOSEDTHREAD => '<div style="background-color:red;color:white;line-height:1em;margin:1px;padding:3px;">■ Não pode mais escrever</div>';
use constant S_SPAMTRAP => 'Deixe estes campos vazios: ';
use constant S_MOBILE => 'Uso Sumaho';

use constant S_MOREOPTS => "";
use constant S_FORMATTING => "Formatação:";
use constant S_SAVE_FORMATTING => "Sempre usar esta formatação";
use constant S_FORMATS => {none=>"None"};
use constant S_DESCRIBE_FORMATS => {
	none=>'Only auto-links URLs and >> references.',
	waka=>'Simple text formatting. See the description <a href="http://wakaba.c3.cx/docs/docs.html#WakabaMark">here</a>.',
	html=>'Allowed tags: <em>'.describe_allowed(ALLOWED_HTML).'</em>.',
	aa=>'Only auto-links URLs and >> references, and sets the font to be suitable for SJIS art.',
};

use constant S_COL_NUM => "Num";
use constant S_COL_TITLE => "Título";
use constant S_COL_POSTS => "Escrita";
use constant S_COL_DATE => "Última escrita";
use constant S_COL_SIZE => "Tamanho de arquivo";
use constant S_LIST_PERMASAGED => 'sage permanente';
use constant S_LIST_CLOSED => '';

use constant S_FRONT => 'Top do ita';								# Title of the front page in page list


#
# Error strings
#

use constant S_BADCAPTCHA => 'Código de verificação foi digitado errado';
use constant S_UNJUST => 'Escrita tem que ser feita por POST request';
use constant S_NOTEXT => 'Sem texto';
use constant S_NOTITLE => 'Subject não existe';
use constant S_NOTALLOWED => 'Não pode escrever.';
use constant S_TOOLONG => '%s é longosugimasu, por %d caracteres';
use constant S_UNUSUAL => 'Resu anormal';
use constant S_SPAM => 'Sua escrita foi detectada como spam';
use constant S_THREADCOLL => 'Alguém escreveu ao mesmo tempo. Tente novamente';
use constant S_NOTHREADERR => 'Esta thread não existe';
use constant S_BADDELPASS => '削除key incorreta.';
use constant S_NOTWRITE => 'Impossivel gravar ao diretório';
use constant S_NOTASK => 'Script error; nenhuma tarefa válida especificada';
use constant S_NOLOG => 'Impossivel escrever em log.txt';
use constant S_TOOBIG => 'Arquivo muito grande';
use constant S_EMPTY => 'Arquivo vazio';
use constant S_BADFORMAT => 'Formato de arquivo não permitido';	
use constant S_DUPE => 'Este arquivo já existe <a href="%s">aqui</a>.';
use constant S_DUPENAME => 'Um arquivo com mesmo nome já existe';	
use constant S_THREADCLOSED => 'Não é possivel escrever nesta thread';							



#
# Templates
#

use constant GLOBAL_HEAD_INCLUDE => q{
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<title><if $title><var $title> - </if><const TITLE></title>
<meta http-equiv="Content-Type" content="text/html;charset=<const CHARSET>" />
<link rel="shortcut icon" href="<const expand_filename(FAVICON)>" />
<if RSS_FILE>
<link rel="alternate" title="RSS feed" href="<const expand_filename(RSS_FILE)>" type="application/rss+xml" />
</if>
<loop $stylesheets>
<link rel="<if !$default>alternate </if>stylesheet" type="text/css" href="<var expand_filename($filename)>" title="<var $title>" />
</loop>
<script type="text/javascript">
var self="<var $self>";
var style_cookie="<const STYLE_COOKIE>";
var markup_descriptions={
<loop $markup_formats><var $id>:<var js_string(S_DESCRIBE_FORMATS-\>{$id})>,</loop>dummy:''
};
</script>
<script type="text/javascript" src="<const expand_filename(JS_FILE)>"></script>
<script type="text/javascript">require_script_version("3.a");</script>
</head>
};



use constant GLOBAL_FOOT_INCLUDE => include(INCLUDE_DIR."footer.html").q{
</body></html>
};



use constant POSTING_FORM_TEMPLATE => compile_template(q{
<if !$thread><tr>
<const S_TITLE>
		<input type="text" name="title" size="46" maxlength="<const MAX_FIELD_LENGTH>" />
		<input type="submit" value="<const S_NEWTHREAD>" />
		<br/>
        <br/>
</tr></if>
<tr>
		<if $thread><input type="submit" value="<const S_REPLY>" /></if>
		<if !FORCED_ANON><const S_NAME></if>
		<if FORCED_ANON><const S_LINK></if>
		<if !FORCED_ANON><input type="text" name="field_a" size="19" maxlength="<const MAX_FIELD_LENGTH>" /> <const S_LINK> </if>
		<if FORCED_ANON><input type="hidden" name="field_a" /></if>
 		<input type="text" name="field_b" size="19" maxlength="<const MAX_FIELD_LENGTH>" />
		<if SPAM_TRAP><div style="display:none"><const S_SPAMTRAP><input type="text" name="name" size="19" autocomplete="off" /><input type="text" name="link" size="19" autocomplete="off" /></div></if>
		<small><a href="javascript:show('options<var $thread>')"><const S_MOREOPTS></a></small>
</tr>
<tr style="display:none;vertical-align:top" id="options<var $thread>">
	<td><const S_FORMATTING></td>
	<td>
		<select name="markup" onchange="select_markup(this)"><loop $markup_formats>
		<option value="<var $id>" <if DEFAULT_MARKUP eq $id>selected="selected"</if>><var S_FORMATS-\>{$id}></option>
		</loop></select>
		<label><input type="checkbox" name="savemarkup" /> <const S_SAVE_FORMATTING></label>
		&nbsp;&nbsp; <input type="button" value="Preview post" onclick="preview_post('<var $formid>','<var $thread>')" />
		<br /><small></small>
		<div id="preview<var $thread>" class="replytext" style="display:none"></div>
	</td>
</tr>
	<td><textarea name="comment" cols="70" rows="5" onfocus="size_field('<var $formid>',15)" onblur="size_field('<var $formid>',5)"></textarea></td>
<if $allowimages><tr>
	<td><const S_IMAGE></td>
	<td><input name="file" size="49" type="file" /></td>
</tr></if>
});



use constant MAIN_PAGE_TEMPLATE => compile_template( GLOBAL_HEAD_INCLUDE.q{
<body class="mainpage">
}.include(INCLUDE_DIR."header.html").q{
<a name="menu"></a>
}.include(INCLUDE_DIR."mid.html").q{
<div id="threadbox" class="outerbox"><div class="innerbox">
<div id="threadlist">
<loop $allthreads><if $num<=THREADS_LISTED>
	<span class="threadlink">
	<a href="<var $self>/<var $thread>/l50" rel="nofollow"><var $num>: 
	<if $num<=THREADS_DISPLAYED></a><a href="#<var $num>"></if>
	<var $title> (<var $postcount>)</a>
	</span>
</if></loop>
</div>
<div id="threadlinks">
<a href="#newthread"><const S_NEWTHREAD_TITLE></a>
<a href="<const expand_filename(HTML_BACKLOG)>"><const S_ALLTHREADS></a>
</div>
</div></div>
<div id="posts">
<loop $threads>
	<a name="<var $num>"></a>
	<if $permasage><div class="sagethread"></if>
	<if !$permasage><div class="thread"></if>
	<h2><a href="<var $self>/<var $thread>/l50" rel="nofollow"><var $title>
	<small>(<var $postcount><if $permasage>, permasaged</if>)</small></a></h2>
	<div class="threadnavigation">
	<a href="#menu" title="<const S_LISTEXPL>"><const S_LISTBUTTON></a>
	<a href="#<var $prevnum>" title="<const S_PREVEXPL>"><const S_PREVBUTTON></a>
	<a href="#<var $nextnum>" title="<const S_NEXTEXPL>"><const S_NEXTBUTTON></a>
	</div>
	<div class="replies">
	<if $omit><div class="firstreply"></if>
	<if !$omit><div class="allreplies"></if>
	<loop $posts>
		<var $abbreviation>
		<if $abbreviated>
			<div class="replyabbrev">
			<var sprintf(S_TRUNC,"$self/$thread/$num","$self/$thread/l50")>
			</div>
		</if>
		<if $omit and $num==1>
		</div><div class="repliesomitted"></div><div class="finalreplies">
		</if>
	</loop>
	</div>
	</div>
	<form id="postform<var $thread>" action="<var $self>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="task" value="post" />
	<input type="hidden" name="thread" value="<var $thread>" />
	<input type="hidden" name="password" value="" />
	<table><tbody>
	<if !$closed><var POSTING_FORM_TEMPLATE-\>(thread=\>$thread,captchaclass=\>"postcaptcha",formid=\>"postform$thread",allowimages=\>ALLOW_IMAGE_REPLIES)></if>
	<tr>
		<td><div class="threadlinks">
		<a href="<var $self>/<var $thread>/"><const S_ENTIRE2></a>
		<a href="<var $self>/<var $thread>/l50" rel="nofollow"><const S_LAST50></a>
		<a href="<var $self>/<var $thread>/-100" rel="nofollow"><const S_FIRST100></a>
		<a href="#menu"><const S_TOP></a>
		</div></td>
	</tr>
	</tbody></table>
	</form>
	<script type="text/javascript">set_new_inputs("postform<var $thread>");</script>
	</div>
</loop>
</div>
<div id="createbox" class="outerbox"><div class="innerbox">
<h2><const S_NEWTHREAD_TITLE></h2>
<form id="threadform" action="<var $self>" method="post" enctype="multipart/form-data">
<input type="hidden" name="task" value="post" />
<input type="hidden" name="password" value="" />
<table><tbody>
<var POSTING_FORM_TEMPLATE-\>(captchaclass=\>"threadcaptcha",formid=\>"threadform",allowimages=\>ALLOW_IMAGE_THREADS)>
</tbody></table>
</form>
</div></div>
<script type="text/javascript">set_new_inputs("threadform");</script>
}.GLOBAL_FOOT_INCLUDE,KEEP_MAINPAGE_NEWLINES);




use constant THREAD_HEAD_TEMPLATE => compile_template( GLOBAL_HEAD_INCLUDE.q{
<body class="threadpage">
}.include(INCLUDE_DIR."header.html").q{
<div id="navigation">
<const S_NAVIGATION>
<a href="../../mobile.pl/<var $thread>/"><const S_MOBILE></a>
<a href="<const expand_filename(HTML_SELF)>"><const S_RETURN></a>
<a href="<var $self>/<var $thread>/"><const S_ENTIRE></a>
<a href="<var $self>/<var $thread>/-100" rel="nofollow"><const S_FIRST1002></a>
<loop [map {+{'start'=\>$_*100+1}} (1..($postcount-1)/100)]>
	<a href="<var $self>/<var $thread>/<var $start>-<var $start+99<$postcount?$start+99:$postcount>" rel="nofollow"><var $start>-</a>
</loop>
<a href="<var $self>/<var $thread>/l50" rel="nofollow"><const S_LAST50></a>
</div>
	<if $closed><tr><td></td><td><big><const S_CLOSEDTHREAD></big></td></tr></if>
<div id="posts">
<if $permasage><div class="sagethread"></if>
<if !$permasage><div class="thread"></if>
<h2><var $title> <small>(<var $postcount><if $permasage><const S_PERMASAGED></if>)</small></h2>
<div class="replies">
<div class="allreplies">
});



use constant THREAD_FOOT_TEMPLATE => compile_template( q{
</div>
</div>
<if AUTOCLOSE_SIZE>
<h4><var int($size/1024)> kb</h4>
</if>
<form id="postform<var $thread>" action="<var $self>" method="post"  enctype="multipart/form-data">
<input type="hidden" name="task" value="post" />
<input type="hidden" name="thread" value="<var $thread>" />
<input type="hidden" name="password" value="" />
<table><tbody>
<if $closed><tr><td></td><td><big><const S_CLOSEDTHREAD></big></td></tr></if>
<tr>
	<td><div class="threadlinks">
	<a href="<const expand_filename(HTML_SELF)>"><const S_RETURN2></a>
	<a href="<var $self>/<var $thread>/"><const S_ENTIRE></a>
	<if $prevpost><a href="<var $self>/<var $thread>/<var $prevpost\>99?$prevpost-99:1>-<var $prevpost>" rel="nofollow"><const S_PREV100></a></if>
	<if $nextpost><a href="<var $self>/<var $thread>/<var $nextpost>-<var $nextpost<$postcount-99?$nextpost+99:$postcount>" rel="nofollow"><const S_NEXT100></a></if>
	<a href="<var $self>/<var $thread>/l50" rel="nofollow"><const S_LAST50></a>
	</div></td>
</tr>
<if !$closed><var POSTING_FORM_TEMPLATE-\>(thread=\>$thread,captchaclass=\>"postcaptcha",formid=\>"postform$thread",allowimages=\>ALLOW_IMAGE_REPLIES)></if>
</tbody></table>
</form>
<script type="text/javascript">set_new_inputs("postform<var $thread>");</script>
</div>
</div>
}.GLOBAL_FOOT_INCLUDE);



use constant REPLY_TEMPLATE => compile_template( q{
<div class="reply">
<h3>
<span class="replynum"><a title="Quote post number in reply" href="javascript:insert('&gt;&gt;<var $num>',<var $thread>)"><var $num></a></span>
<const S_POSTERNAME>
<if $link><span class="postername"><a href="<var $link>" rel="nofollow"><var $name></a></span><span class="postertrip"><a href="<var $link>" rel="nofollow"><if !$capped><var $trip></if><if $capped><var $capped></if></a></span></if>
<if !$link><span class="postername"><var $name></span><span class="postertrip"><if !$capped><var $trip></if><if $capped><var $capped></if></span></if>
: <var $date>
<if $image><span class="filesize">(<const S_IMAGEDIM><em><var $width>x<var $height> <var $ext>, <var int($size/1024)> kb</em>)</span></if>
<span class="deletebutton">
<if ENABLE_DELETION>[<a href="javascript:delete_post(<var $thread>,<var $num><if $image>,true</if>)"><const S_DELETE></a>]</if>
<if !ENABLE_DELETION><span class="manage" style="display:none;">[<a href="javascript:delete_post(<var $thread>,<var $num><if $image>,true</if>)"><const S_DELETE></a>]</span></if>
</span>
</h3>
<if $image>
	<if $thumbnail>
		<a href="<var expand_filename(clean_path($image))>">
		<img src="<var expand_filename($thumbnail)>" width="<var $tn_width>" height="<var $tn_height>" 
		alt="<var clean_string($image)>: <var $width>x<var $height>, <var int($size/1024)> kb"
		title="<var clean_string($image)>: <var $width>x<var $height>, <var int($size/1024)> kb"
		class="thumb" /></a>
	</if><if !$thumbnail>
		<div class="nothumbnail">
		<a href="<var expand_filename(clean_path($image))>"><const S_NOTHUMBNAIL></a>
		</div>
	</if>
</if>
<div class="replytext"><var $comment></div>
</div>
});



use constant DELETED_TEMPLATE => compile_template( q{
<div class="deletedreply">
<h3>
<span class="replynum"><var $num></span>
<if $reason eq 'user'><const S_USERDELETE></if>
<if $reason eq 'mod'><const S_MODDELETE></if>
</h3>
</div>
});



use constant BACKLOG_PAGE_TEMPLATE => compile_template( GLOBAL_HEAD_INCLUDE.q{
<body class="backlogpage">
}.include(INCLUDE_DIR."header.html").q{
<div id="navigation">
<strong><const S_NAVIGATION></strong>
<a href="<const expand_filename(HTML_SELF)>"><const S_RETURN></a>
</div>
<div id="threads">
<h1><const TITLE></h1>
<table id="oldthreadlist">
<thead>
<tr class="head">
<th><const S_COL_NUM></th>
<th><const S_COL_TITLE></th>
<th><const S_COL_POSTS></th>
<th><const S_COL_DATE></th>
<th><const S_COL_SIZE></th>
</tr>
</thead>
<tbody>
<loop $threads>
<tr class="line<var $num&1>">
<td align="right"><var $num>:</td>
<td><a href="<var $self>/<var $thread>/l50" rel="nofollow"><var $title><if $closed or $permasage> <small>(<if $closed><const S_LIST_CLOSED></if><if !$closed and $permasage><const S_LIST_PERMASAGED></if>)</small></if></a></td>
<td align="right"><a href="<var $self>/<var $thread>/"><var $postcount></a></td>
<td><var make_date($lastmod,DATE_STYLE)></td>
<td align="right"><var int($size/1024)> kb</td>
</tr>
</loop>
</tbody></table>
</div>
}.GLOBAL_FOOT_INCLUDE);



use constant RSS_TEMPLATE => compile_template( q{
<?xml version="1.0" encoding="<const CHARSET>"?>
<rss version="2.0">
<channel>
<title><const TITLE></title>
<link><var $absolute_path><const HTML_SELF></link>
<description>Posts on <const TITLE> at <var $ENV{SERVER_NAME}>.</description>
<loop $threads><if $num<=THREADS_DISPLAYED>
	<item>
	<title><var $title> (<var $postcount>)</title>
	<link><var $absolute_self>/<var $thread>/</link>
	<guid><var $absolute_self>/<var $thread>/</guid>
	<comments><var $absolute_self>/<var $thread>/</comments>
	<author><var $author></author>
	<description><![CDATA[
		<var $$posts[0]{abbreviation}=~m!<div class="replytext".(.*?)</div!; $1 >
		<if $abbreviated><p><small>Post too long, full version <a href="<var $absolute_self>/<var $thread>/">here</a>.</small></p>
		</if>
	]]></description>
	</item>
</if></loop>
</channel>
</rss>
});



use constant ERROR_TEMPLATE => compile_template( GLOBAL_HEAD_INCLUDE.q{
<body class="errorpage">
<font size="+1" color="#FF0000"><b>ERROR: <var $error></b></font><a href="<var escamp($ENV{HTTP_REFERER})>"><const S_RETURN></a>
}.GLOBAL_FOOT_INCLUDE);


1;
