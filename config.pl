# Configuração do sistema
use constant BBSCGI => '2021/01/18';		# Dia da ultima atualização
use constant ADMIN_PASS => '';			# Senha de administrador
use constant SECRET => '';				# Segredo criptografico. Mude para algo aleatório e longo.
use constant CAPPED_TRIPS => ('');	# Hash do trip de administrador, Para levantar thread quando trancadas, e afins. Formato é '!trip'=>'cap', 'cap' é o que exibe ao invés da trip. Isso pode conter HTML, mas tem que ser XHTML valido!

# Visual da página
use constant TITLE => '＠2-ch掲示板';	# Nome do ita
use constant SHOWTITLETXT => 1;				# Mostrar titulo (1: sim  0: não)
use constant THREADS_DISPLAYED => 10;			# Numero de sure na pagina principal
use constant THREADS_LISTED => 40;				# Number of threads in the thread list
use constant REPLIES_PER_THREAD => 10;			# Resu exibidas
use constant S_ANONAME => '名無しさん＠お腹いっぱい。';			# Define o nome caso nada foi inserido no campo de nome
use constant DEFAULT_STYLE => 'Pseud0ch';		# Nome do estilo de CSS padrão
use constant FAVICON => 'kareha.ico';			# Caminho para a favicon do ita.

# Limitações
#use constant ALLOW_TEXT_THREADS => 1;			# Permitir criação de thread de texto
#use constant ALLOW_TEXT_REPLIES => 1;			# Permitir criação de resposta de texto
#use constant AUTOCLOSE_POSTS => 1000;			# Número máximo de resu antes da thread cair do dat. 0 para desativar.
use constant AUTOCLOSE_DAYS => 10;				# Máximo de dias antes da thread cair do dat. 0 para desativar
#use constant AUTOCLOSE_SIZE => 0;				# Tamanho maximo do arquivo HTML de uma thread em kilobytes para cair do dat. 0 para desativar.
#use constant MAX_RES => 1000000000;			# Total de age em uma thread
#use constant MAX_THREADS => 0;					# Número maximo de sure - defina como 0 para desativar
#use constant MAX_POSTS => 0;					# Número maximo de escrita - defina como 0 para desativar
#use constant MAX_MEGABYTES => 0;				# Tamanho maximo para usar para todas as imagens em megabytes - defina como 0 para desativar.
#use constant MAX_FIELD_LENGTH => 100;			# Numero maximo de caracteres de titulo, nome, e e-mail
#use constant MAX_COMMENT_LENGTH => 8192;		# Numero maximo de caracteres no conteudo
use constant MAX_LINES_SHOWN => 999999999999999999999999;			# Numero maximo de caracteres exibidos na pagina principal
#use constant ALLOW_ADMIN_EDIT => 0;			# Permitir editar arquivos do include e spam.txt pelo admin.pl.
                                    			# Aviso! Isso é um risco de segurança, uma vez que templates do include podem executar code!

# Escrita com imagem
#use constant ALLOW_IMAGE_THREADS => 0;			# Permitir thread de imagem
#use constant ALLOW_IMAGE_REPLIES => 0;			# Permitir resu de imagem
#use constant IMAGE_REPLIES_PER_THREAD => 0;	# Numero de limite de resu de imagem exibidas, defina como 0 para sem limite.
#use constant MAX_KB => 1000;					# Tamanho de upload maximo em KB
#use constant MAX_W => 200;						# Imagens que excedem esta largura terão thumbnail
#use constant MAX_H => 200;						# Imagens que excedem esta altura terão thumbnail
#use constant THUMBNAIL_SMALL => 1;				# Usar thumbnail em imagens pequenas (1: sim, 0: não)
#use constant THUMBNAIL_QUALITY => 70;			# Qualidade de JPEG da thumbnail
#use constant ALLOW_UNKNOWN => 0;				# Permitir formatos de arquivo desconhecidos (1: yes, 0: no)
#use constant MUNGE_UNKNOWN => '.unknown';		# Munge unknown file type extensions with this. If you remove this, make sure your web server is locked down properly.
#use constant FORBIDDEN_EXTENSIONS => ('php','php3','php4','phtml','shtml','cgi','pl','pm','py','r','exe','dll','scr','pif','asp','cfm','jsp','vbs'); # extensoes de arquivo proibidas
#use constant STUPID_THUMBNAILING => 0;			# Ignorar code de thumbnail e usar HTML para redimensionar imagem. ESTUPIDO, gasta banda larga. (1: ativar, 0: desativar)
#use constant MAX_IMAGE_WIDTH => 16384;			# Largura maxima de imagem
#use constant MAX_IMAGE_HEIGHT => 16384;		# Altura maxima de imagem
#use constant MAX_IMAGE_PIXELS => 50000000;		# Largura*altura maxima de imagem
#use constant CONVERT_COMMAND => 'convert';		# Local do comando de converter do ImageMagick (normalmente 'convert', mas as vezes um caminho inteiro e necessario)

# Captcha
#use constant ENABLE_CAPTCHA => 0;				# Permitir codigos de verificação (0: desativo, 1: ativo)
#use constant CAPTCHA_HEIGHT => 18;				# Altura da imagem de captcha
#use constant CAPTCHA_SCRIBBLE => 0.2;			# Fator de rabisco
#use constant CAPTCHA_SCALING => 0.15;			# Fator de escala randomizada
#use constant CAPTCHA_ROTATION => 0.3;			# Fator de rotação randomizada
#use constant CAPTCHA_SPACING => 2.5;			# Espaçamento entre letras

# Ajustes
#use constant CHARSET => 'utf-8';				# Define o conjunto de caracteres, normalmente "utf-8" ou "shift_jis". Lembre-se de definir no Apache para usar o mesmo conjunto de caracteres para arquivos html! (AddCharset shift_jis html)
#use constant PROXY_CHECK => ();				# Ports para escanear proxy - NÃO IMPLEMENTADO.
#use constant TRIM_METHOD => 1;					# Quais threads deixar para trás (0: mais antigas - tipo futaba 1: menos ativas - mais para tras)
#use constant REQUIRE_THREAD_TITLE => 1;		# Exigir título para thread (0: no, 1: yes)
#use constant DATE_STYLE => '2ch';				# Formato de data ('2ch', 'futaba', 'localtime, 'http')
use constant DISPLAY_ID => 'thread, day';	# Exibição de ID (0 or '': don't display,
												#  'day', 'thread', 'board' em qualquer combinação: ID muda diariamente, por thread ou ita,
												#  'mask': exibir endereço IP mascarado (IPs similares parecem similares, mas ainda são criptografados)
												#  'sage': não exibir ID quando sage for digitado no campo de e-mail, 'link': não exibir ID quando o usuario preenche o campo de e-mail,
												#  'ip': exibir IP do usuario, 'host': exibir host do usuario)
use constant EMAIL_ID => '???';				# Substitui o ID com essa string quando o ID nao esta exibido (DISPLAY_ID contem 'sage' or 'link').
#use constant SILLY_ANONYMOUS => '';			# Nomes aleatorios (mesma sintaxe do DISPLAY_ID)
#use constant FORCED_ANON => 0;					# Forçar escrita sem nome (0: no, 1: yes)
use constant TRIPKEY => ' ◆';					# Simbolo exibido antes de trip
#use constant ALTERNATE_REDIRECT => 0;			# Usar metodo de redirecionamento alternativo (Javascript/meta-refresh instead of HTTP forwards.)
#use constant APPROX_LINE_LENGTH => 150;		# Comprimento de linha aproximado usado por code de abreviação de resu para adivinhar o comprimento de uma resu.
use constant COOKIE_PATH => 'current';			# Argumento de caminho para cookies ('root': cookies aplicam a todo ita, 'current': cookies aplicam apenas a este ita, 'parent': cookies aplicam a todo ita no diretorio parente) - Não aplica ao cookie de stylesheet!
#use constant STYLE_COOKIE => 'karehastyle';	# Nome do cookie para estilo CSS
use constant ENABLE_DELETION => 0;				# Permitir usuários apagar suas escritas (0: no, 1: yes)
#use constant PAGE_GENERATION => 'single';		# Metodo de geração de pagina ('single': just one page, 'paged': split into several pages like futaba, 'monthly': separate pages for each month)
#use constant DELETE_FIRST => 'single';			# O que fazer quando a primeira escrita é apagada ('keep': manter a thread, 'single': apagar a thread caso tiver apenas uma escrita, 'remove': apagar a thread inteira)
#use constant MARKUP_FORMATS => ('none','waka','html','aa'); # Lista de formatos markup suportados, como uma lista Perl. Suportado: 'none', 'waka', 'html', 'aa'.
use constant DEFAULT_MARKUP => 'none';			# Formato padrão de markup, of the above.
#use constant FUDGE_BLOCKQUOTES => 0;			# Modificar formatação para stylesheets antigos
#use constant USE_XHTML => 1;					# Send pages as application/xhtml+xml to browsers that support this (0:no, 1:yes)
use constant KEEP_MAINPAGE_NEWLINES => 1;		# Não remover espaço em branco da página principal (needed for Google ads to work, 0:no, 1:yes)
use constant SPAM_TRAP => 0;					# Enable the spam trap (empty, hidden form fields that spam bots usually fill out) (0:no, 1:yes)

# Caminhos e arquivos internos
#use constant RES_DIR => 'res/';				# Diretório de cache de resu (precisa ser gravável pela script)
#use constant CSS_DIR => 'css/';				# Diretório de stylesheet CSS
#use constant IMG_DIR => 'src/';				# Diretório de imagem (precisa ser gravável pela script)
#use constant THUMB_DIR => 'thumb/';			# Diretório de thumbnail (precisa ser gravável pela script)
#use constant INCLUDE_DIR => 'include/';		# Diretório de arquivos include
#use constant LOG_FILE => 'log.txt';			# Arquivo de log (armazena key de apagamento e endereços IP criptografados)
#use constant PAGE_EXT => '.html';				# Extensão usada para paginas de ita
#use constant HTML_SELF => 'index.html';		# Nome do arquivo HTML principal
#use constant HTML_BACKLOG => 'subback.html';	# Nome da lista de threads
#use constant RSS_FILE => 'index.rss';			# Arquivo de RSS. Defina como '' para desativar suporte RSS.
#use constant JS_FILE => 'kareha.js';			# Local do arquivo js
#use constant SPAM_FILES => ('spam.txt');		# Arquivos de definição de spam, como uma lista Perl.

# Opções de script de admin
#use constant ADMIN_SHOWN_LINES => 5;				# Número de linhas de escrita a script de administrador exibe.
#use constant ADMIN_SHOWN_POSTS => 10;				# Número de escrita por thread a script de administrador exibe.
#use constant ADMIN_MASK_IPS => 0;					# Esconder parte dos endereços IP na script de administrador (0: não, 1: sim)
#use constant ADMIN_EDITABLE_FILES => (SPAM_FILES); # Uma lista perl de todos os arquivos que podem ser editados pela script de administrador.
#use constant ADMIN_BAN_FILE => '.htaccess';		# Nome do arquivo para gravar bans
#use constant ADMIN_BAN_TEMPLATE => "\n# Banido <var scalar localtime> (<var \$reason>)\nDeny from <var \$ip>\n";

# Icones para tipos de arquivo - extensões de arquivo especificadas aqui não serão renomeadas, e terão icones
# (exceto os formatos de imagem embutidos). Estes icones de exemplo podem ser encontrados no diretório extras/.
#use constant FILETYPES => (
#   # Arquivos de áudio
#	mp3 => 'icons/audio-mp3.png',
#	ogg => 'icons/audio-ogg.png',
#	aac => 'icons/audio-aac.png',
#	m4a => 'icons/audio-aac.png',
#	mpc => 'icons/audio-mpc.png',
#	mpp => 'icons/audio-mpp.png',
#	mod => 'icons/audio-mod.png',
#	it => 'icons/audio-it.png',
#	xm => 'icons/audio-xm.png',
#	fla => 'icons/audio-flac.png',
#	flac => 'icons/audio-flac.png',
#	sid => 'icons/audio-sid.png',
#	mo3 => 'icons/audio-mo3.png',
#	spc => 'icons/audio-spc.png',
#	nsf => 'icons/audio-nsf.png',
#	# Arquivos compactados
#	zip => 'icons/archive-zip.png',
#	rar => 'icons/archive-rar.png',
#	lzh => 'icons/archive-lzh.png',
#	lha => 'icons/archive-lzh.png',
#	gz => 'icons/archive-gz.png',
#	bz2 => 'icons/archive-bz2.png',
#	'7z' => 'icons/archive-7z.png',
#	# Outros arquivos
#	swf => 'icons/flash.png',
#	torrent => 'icons/torrent.png',
#	# Para impedir Wakaba de renomear arquivos de imagem, coloque os nomes aqui assim:
#	gif => '.',
#	jpg => '.',
#	png => '.',
#);

# HTML tag e attribute permitida.
#use constant ALLOWED_HTML => (
#	'a'=>{args=>{'href'=>'url'},forced=>{'rel'=>'nofollow'}},
#	'b'=>{},'i'=>{},'u'=>{},'sub'=>{},'sup'=>{},
#	'em'=>{},'strong'=>{},
#	'ul'=>{},'ol'=>{},'li'=>{},'dl'=>{},'dt'=>{},'dd'=>{},
#	'p'=>{},'br'=>{empty=>1},'blockquote'=>{},
#);

1;
