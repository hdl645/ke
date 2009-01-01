vim:enc=utf8
----------------------------------------------------------------------------------------------------

* 自動尋找游標所在函式的man page

	在該函式名上按K

	可是...以 setsid 來說, man 2 setsid 及 man 8 setsid 都有 manpage. 若只按 K 則只會找到先找到的那一個, 在我的系統上會先找到 man 8 setsid. 那, 要怎麼找 man 2 setsid 呢? 只要將指定 man 的章節數放在 K 之前即可, 如:

	在 setsid 上按 2K 即可

----------------------------------------------------------------------------------------------------

* 自動補變數名/函式名
	
	向前尋找可能變數/函式： Ctrl + P
	向後尋找可能變數/函式： Ctrl + N

----------------------------------------------------------------------------------------------------

* 編譯程式
	
	狀況一：沒有Makefile （所有空格前加上\）
		:set makeprg=gcc\ -O2\ foo.c
		
	狀況二：有Makefile ==> 不需額外命令

	經過上列命令設定後：
		編譯程式       ==> :make
		尋找下一個錯誤 ==> :cn
		尋找上一個錯誤 ==> :cN
		列出錯誤訊息   ==> :cl
		列出所有訊息   ==> :cl!
		列出舊編譯訊息 ==> :cold
		列出新編譯訊息 ==> :cnew
		開啟編譯訊息視窗=> :copen		
		更新編譯訊息視窗=> :cwin	
		關閉編譯訊息視窗=> :cclose

			註：開啟編譯訊息視窗以後可以直接在錯誤訊息上按ENTER，就會直接跳到錯的程式碼了。
			
----------------------------------------------------------------------------------------------------

* 複製某字串

	狀況一: 獨立的單字 (以空白或標點符號分隔開的)
				yw
				2yw (複製二個單字)

	狀況二: 非獨立的單字
				先按 v 再移動游標到結束的地方 (以游標為準), 再按 y

----------------------------------------------------------------------------------------------------

* 視窗操作

	逗號是分隔用，勿輸入。以第一組按鍵為例，先按CTRL及w鍵，放開後按n鍵（大小寫有差）。

	Ctrl + w, n								以水平軸為分界，新開一個視窗
	Ctrl + w, s								以水平軸為分界，分割出一個新視窗，並且開啟剛剛游標所在視窗的檔案
	Ctrl + w, v								以垂直軸為分界，新開一個視窗，並且開啟剛剛游標所在視窗的檔案
	Ctrl + w, f								將游標所指檔案名稱另開在新的水平視窗
	Ctrl + w, x								將水平/垂直視窗，上下/左右對換
	Ctrl + w, R								將視窗都向上移動，最上方的視窗移到最下方 (rotate)
	Ctrl + w, r								將視窗都向下移動，最下方的視窗移到最上方 (rotate)
	Ctrl + w, o								關閉游標所在視窗以外所有視窗 (only one)
	Ctrl + w, c								關閉游標所在視窗，不能關閉最後一個視窗
	Ctrl + w, q								關閉游標所在視窗，若是最後一個視窗則自動離開vim
	Ctrl + w, _								將游標所在視窗列數（高度）放到最大，其它視窗只保留一列/行內容及一列檔名
	Ctrl + w, 數字_						將游標所在視窗高度設為指定列數
	Ctrl + w, |								將游標所在視窗行數（寬度）放到最大，其它視窗只保留一列/行內容及一列檔名
	Ctrl + w, 數字|						將游標所在視窗寬度設為指定行數
	Ctrl + w, =								讓所有視窗等高（目前所在視窗由winheight、winwidth指定）
	Ctrl + w, N-							減少目前視窗高度N列，N可省略，預設為1
	Ctrl + w, N+							增加目前視窗高度N列，N可省略，預設為1
	Ctrl + w, t								切換游標到最上方視窗
	Ctrl + w, b								切換游標到最下方視窗
	Ctrl + w, 上、下、左、右方向鍵	切換游標到上/下/左/右方視窗
	Ctrl + w, k,  j,  h,  l 方向鍵	切換游標到上/下/左/右方視窗（即一般模式以字母鍵移動游標）
	Ctrl + w, K,  J,  H,  L 方向鍵	將游標所在視窗向上/下/左/右視窗（這一組是移動視窗，上一組是移動游標）

	註：所有的CTRL+W開頭按鍵亦可以下列方式操作

		CTRL + w, n === CTRL + w, CTRL + N (變大寫)

----------------------------------------------------------------------------------------------------

* 復原的操作

	復原上一次動作（無限次數）	==> u
	取消上一次復原             ==> CTRL + r	（Windows版的gvim選單中是寫^R，但是我測試時似乎大小寫均可）

----------------------------------------------------------------------------------------------------

* 檔案總管

	本功能是透過plugin達成的，若下列命令沒有作用，請先下:let loaded_explorer = 1載入plugin。

	:Explore	dirname	==> 在目前視窗開啟檔案總管，若dirname有指定則會開啟所指目錄
	:Sexplore dirname ==> 在新視窗開啟檔案總管，若dirname有指定則會開啟所指目錄

	但是，預設值是開一個水平視窗，蠻佔空間的。建議在 ~/.vimrc 加上 let g:explVertical=1。如此一來會開成垂直視窗，比較不佔空間。	

	檔案總管簡易操作:
		o	==> 將游標所在檔案開在新視窗
		O	==> 將游標所在檔案開在呼叫檔案總管前所在視窗

	註：更詳細的資料及設定請:help explore, 或在檔案總管視窗按下 ? 鍵即可看到說明.

----------------------------------------------------------------------------------------------------

* 色彩的切換

	:colo[r] color_name

		color_name 有以下數種
			blue
			darkblue (不錯用，搜尋字串不會看不清)	
			default  (搜尋字串黃底白色，看不清)
			elflord
			evening
			koehler  (這也不錯, 不過C程式內的directive會變成深藍，看不清)
			morning  (白底)
			murphy   (在WINDOWS下程式看起來不錯，但是在LINUX文字模式VIM不好)
			pablo
			peachpuff
			ron
			shine
			torte
			zellner

		:colo[r] 的[r]表示可省略r不打

----------------------------------------------------------------------------------------------------

* 修正RedHat 9.0版的VIM無法使用倒退鍵問題

	執行 :fix[del] 或者在 ~/.vimrc 加上 fix[del] 即可。（[del]表示del可省略）

	其實這個問題是因為Linux會在收到Backspace鍵時送出Ctrl+?，另一個解決方案是在 rc.local 加上一列：

	echo "keycode 14 = BackSpace" | loadkeys

	詳情請:help fixdel
	註: 經過測試, fixdel 後雖然按 backspace 鍵不會出現^?, 但是, backspace 鍵卻會變成 delete 鍵. 另外,第二個 echo keycode 再 pass 給 loadkeys 似乎也沒有解決問題。讓我誤以為解決的是因為我透過putty連線時不管有沒有fixdel，倒退鍵都OK。

----------------------------------------------------------------------------------------------------

* 標記的運用

	做標記：	
		m字母

	游標跳到標記處
		`字母	跳到標記時位置（列與行都一樣）
		'字母	跳到標記那一列第一個字母/數字出現處，如同按`字母再按^

	以往都是用:列號1,列號2再加個命令，現在可以變成：
		先到列號1,按mt
		再到列號2,按mb
		以後使用時就輸入:'t,'b 命令

----------------------------------------------------------------------------------------------------

* 外部命令

	單純執行外部命令
		:!命令

	執行外部命令並將輸出結果插到目前編輯中檔案
		:r !命令

	把列號1到列號2指定資料丟給外部程式處理後再取回來（假設列號1已用mt標記；列號2已用mb標記）
		:'t,'b !sort								't到'b排序
		:'t,'b !awk '{print $3 " " $2 " " $1}'		將第一、二、三行資料反過來放，如下所示：

              aaa bbb ccc           	ccc bbb aaa
              xxx yyy zzz   變成->		zzz yyy xxx
              111 222 333           	333 222 111

	參考資料：http://www.yolinux.com/TUTORIALS/LinuxTutorialAdvanced_vi.html

----------------------------------------------------------------------------------------------------

* 尋找/輸入特殊字元

	原則，先按CTRL+V再按該特殊字元

	例子：將DOS下文字檔轉成UNIX下文字檔
		:1,$ s/{CTRL+V}{CTRL+M}//

----------------------------------------------------------------------------------------------------

* 巨集

    :map letter commands_strung_together
    :map 列出目前所有巨集
    
	範例： :map g n cwNEW_WORD{cntl-v}{esc}i{cntl-v}{CR}
		功能：按下 g 鍵後找出下一個符合條件的字串，換成NEW_WORD並在該字後插入空白列。

        * 使用 Control/Escape/Carriage 必須先按CTRL＋V
        * 請選擇不重要的字母（例如選用 i 就是不是不好的例子。）

----------------------------------------------------------------------------------------------------

* 游標所在編輯列置於視窗中央

	zz

	其它還有很多z開頭命令，請:help zz

----------------------------------------------------------------------------------------------------

* Best VIM TIP's

	http://www.vim.org/tips/tip.php?tip_id=305
	
	Here's a necessarily cryptic list of "MY" Best Vim Tips that I've gleaned
	from http://vim.sf.net/  ;& comp.editors  
	http://groups.google.com/groups?safe=off&group=comp.editors
	
	updated version at http://www.rayninfo.co.uk/vimtips.html
	********************
	# Absolutely essential
	********************
	vim.sf.net         : Visit frequently
	comp.editors    : "VIM" dominated newsgroup
	* # g* g#          : find word under cursor (forwards/backwards)
	%                   : match brackets {}[]()
	matchit.vim      : % now matches tags <tr><td><script> etc
	<C-N> <C-P>   : word completion in insert mode
	<C-X><C-L>    : Line complete SUPER USEFUL
	/<C-R><C-W>   : Pull <cword> onto search/command line
	:set ignorecase # you nearly always want this
	:syntax on    : colour syntax in Perl,HTML,PHP etc
	:h slash<C-D> : type control-D and get a list all help topics containing
	                   slash (plus use TAB for Help completion)
	********************
	# MAKE IT EASY TO UPDATE/RELOAD_vimrc
	:nmap ,s :source $VIM/_vimrc
	:nmap ,v :e $VIM/_vimrc
	********************
	#VISUAL MODE Mappings
	:vmap sb "zdi<b><C-R>z</b><ESC> : wrap <b></b> around VISUALLY selected Text
	:vmap st "zdi<?= <C-R>z ?><ESC>  : wrap <?=   ?> around VISUALLY selected Text
	********************
	# Exploring
	:Ex                             : file explorer note capital Ex
	\be                             : builtin buffer explorer
	:ls                             : list of buffers(eg following)
	:cd ..                          : move to parent directory
	********************
	# Great
	guu                             : lowercase line
	gUU                             : uppercase line
	gf                              : open file name under cursor (SUPER)
	ga                              : display hex,ascii value of character under cursor
	ggVGg?                          : rot13 whole file
	CTRL-A,CTRL-X                   : increment,decerement number under cursor
	                                  win32 users must remap CNTRL-A
	CTRL-R=5*5                      : insert 25 into text
	********************
	# Makes all other tips superfluous
	:h 42                          
	:h holy-grail                  
	:help!                        
	********************
	# Markers & moving about
	'.               : jump to last modification line (SUPER)
	`.               : jump to exact spot in last modification line
	<C-O>            : retrace your movements in file (old)
	<C-I>            : retrace your movements in file (new)
	:ju(mps)
	:help jump-motions
	:history          : list of all your commands
	********************
	# Abbreviations & maps
	:map   <f7>   :'a,'bw! c:/aaa/x
	:map   <f8>   :r c:/aaa/x
	:map   <f9>   :w<CR>:!c:/php/php.exe %<CR>
	:map   <f11>  :.w! c:/aaa/xr<CR>
	:map   <f12>  :r c:/aaa/xr<CR>
	:ab php           : list of abbreviations beginning php
	:map ,            : list of maps beginning ,
	# For use in Maps
	<CR>             : carriage Return for maps
	<ESC>            : Escape
	<LEADER>         : normally \
	<BAR>            : | pipe
	********************
	# List your Registers
	:reg             : display contents of all registers
	"1p....          : retrieve numeric buffers
	********************
	# Useful trick
	"ayy@a            : execute "Vim command" in a text file
	yy@"              : same thing using unnamed register
	********************
	# Get output from other commands
	:r!ls.exe        : reads in output of ls
	!!date           : same thing
	:%!sort -u       : use an external program to filter content
	********************
	# Multiple Files Management
	:wn              : write file and move to next (SUPER)
	:bd              : remove file from buffer list (SUPER)
	:sav php.html    : Save current file as php.html and "move" to php.html
	:sp fred.txt     : open fred.txt into a split
	:e!              : return to unmodified file
	:w c:/aaa/%      : save file elsewhere
	:e #                 : edit alternative file
	:e %
	:rew                : rewwind to first file in ARGS
	:bn                 : next file
	:bp                 : next file
	:brew
	********************
	# Recording (BEST TIP of ALL)
	qq  # record to q
	your commands
	q
	@q to execute
	@@ to Repeat
	# editing a register/recording
	"ap
	<you can now see register contents, edit as required>
	"add
	@a
	********************
	# _vimrc essentials
	:set incsearch : jumps to search word as you type (annoying but excellent)
	:set wildignore=*.o,*.obj,*.bak,*.exe
	:set shiftwidth=3
	********************
	# launching Win IE
	:nmap ,f :update<CR>:silent !start c:\progra~1\intern~1\iexplore.exe file://%:p<CR>
	:nmap ,i :update<CR>: !start c:\progra~1\intern~1\iexplore.exe <cWORD><CR>
	********************
	# FTPing from VIM
	cmap ,r  :Nread ftp://209.51.134.122/public_html/index.html
	cmap ,w  :Nwrite ftp://209.51.134.122/public_html/index.html
	gvim ftp://209.51.134.122/public_html/index.html
	********************
	# appending to registers (use CAPITAL)
	# yank 5 lines into "a" then add a further 5
	"a5yy
	10j
	"A5yy
	********************
	[I     : show lines matching word under cursor <cword>
	********************
	#Conventional Shifting
	:'a,'b>>
	# visual shifting (builtin-repeat)
	:vnoremap < <gv
	:vnoremap > >gv
	********************
	# searching
	/^joe.*fred.*bill/ : normal
	/^[A-J]\+/         : search for lines beginning A-J followed by at leat 1 A-J
	/forum\(\_.\)*pent   search over possible multiple lines
	/fred\_s*joe/i    : any whitespace including newline
	/fred\|joe        : Search for FRED OR JOE
	********************
	#substitution
	:%s/fred/joe/igc            : general substitute command
	:%s/\r//g                   : Delete DOS returns ^M
	:'a,'bg/fred/s/dick/joe/gc  : VERY USEFUL
	:s/\(.*\):\(.*\)/\2 :  \1/  : reverse fields separated by :
	:%s/^.\{-}pdf/new.pdf/  non greedy matching (ie to first pdf)
	:s/fred/<c-r>a/g substitute "fred" with contents of register "a"
	:%s/^\(.*\)\n\1/\1$/  delete duplicate lines
	# non-greedy matching \{-}
	:%s/^.\{-}pdf/new.pdf/
	:help /\{-}
	:s/fred/<c-r>a/g substitute "fred" with contents of register "a"
	# multiple commands
	:%s/\f\+\.gif\>/\r&\r/g | v/\.gif$/d | %s/gif/jpg/
	:%s/suck\|buck/loopy/gc  : ORing
	:s/__date__/\=strftime("%c")/ : insert datestring
	********************
	# global command
	:g/^\s*$/d       :delete all blank lines
	:g!/^dd/d        : delete lines not containing string
	:v/^dd/d         : delete lines not containing string
	:g/fred/,/joe/d  : not line based
	:v/./.,/./-1join : compress empty lines
	:'a,'b g/^Error/ . w >> errors.txt
	:g/cmap\|form/p  : ORing
	********************
	# Paste register *
	:redir @*   : redirect commands to paste
	:redir END
	"*yy        : yank to paste
	"*p         : insert paste buffer
	********************
	# Formatting text
	gq<CR>
	gqap  (a is motion p paragraph (visual mode))
	********************
	# Operate command over multiple files
	:argdo %s/foo/bar/
	:bufdo %s/foo/bar/
	:windo %s/foo/bar/
	********************
	# Command line tricks
	gvim -h
	ls | gvim -   : edit a PIPE!!
	# vg.ksh (shell script)
	# vi all files in directory containing keyword $1 and jump to $1
	gvim.exe -c "/$1"  $(grep -isl "$1" *) &
	********************
	
----------------------------------------------------------------------------------------------------

* 區塊模式

	v		類似穩當死下軟體標記文字時方式
	V		游標經過的列全部都整列標記起來
	Ctrl+v	矩形的標記(v大小寫似乎不分)

----------------------------------------------------------------------------------------------------

* 從別的軟體貼文字過來會一列一列向右縮排

	:set paste 應該就沒問題了.

----------------------------------------------------------------------------------------------------

* tag 的操作

	要先用 ctags 產生 tags 檔案.

	當編輯的檔案相同目錄之下有 tags 檔案, 則 vim 會將該 tags 載入.

	游標移到要尋找的變數/函式/巨集等按下 Ctrl + ] 即可跳到該變數/函式/巨集所在檔案及位置.

	萬一發生有多個 tag 符合我們要尋找的變數/函式/巨, 輸入 :ts 再輸入號碼即可選擇要採用哪一組.

----------------------------------------------------------------------------------------------------

* 得知目前編輯檔案等資訊

	Ctrl + g 或 
	:f

----------------------------------------------------------------------------------------------------

* 把 VIM 當成 less/more 來用

	 在vim 6.0裡面，有一個好用的小工具less.sh。一般使用less或more在看檔案
	時，並不會有syntax highlight的效果利用這個工具，我們可把vim當作一個pager
	來用，如此一來，在看檔案時就會有syntax highlight了。
	1.先確認vim的版本是6.0以上。
	2.檢查是否有less.sh、less.vim這兩個檔案，它會被放在vim的macros目錄中
	。一般來說，會在/usr/share/vim/vim60/macros，不同的distributions可能有不
	同的放法，那就自已找找了，也有可能被放在/usr/share/doc/vim/macros ... 那
	就復制一份到/usr/share/vim/vim60/macros/。
	3.更改使用權限：chmod 755 /usr/share/vim/vim60/macros/less.sh
	4.試用：/usr/share/vim/vim60/macros/less.sh test.c
	... 嘿！出現了...
	按h會有help出現。
	如果不喜歡它的keybinding，改/usr/share/vim/vim60/macros/less.vim。
	5.自已設個alias或link，就可以把這個script當作一般的less來用了。


----------------------------------------------------------------------------------------------------

* auto completion editor

From: tren.bbs@kulu.twbbs.org (我就是在下)
最近突發奇想, 不曉得有沒有提供英文單字tab 自動補全的編輯器, 這樣應該
很方便吧? ~~

	From: rabit.bbs@bbs.sayya.org (愛看故事的小孩)
	vim可以做到, 你可以作以下設定:
	set complete +=k
	set dictionary += ~/.vim/dict/words.txt
	並將你想要補齊的單字列入words.txt, 每個單字以空白隔開.
	此時按下CTRL_P或CTRL_N就可以補齊單字.
	vim的complete功能預設是根據幾個檔案中的單字來作補齊的動作:
	1.目前編輯的檔案
	2.其他正在編輯的檔案
	3.dictionary選項指定的檔案
	如果你想要使用Tab鍵來補齊單字, 可以加入下列func:
	function! CleverTab()
	if strpart( getline(′.′), 0, col(′.′)-1 ) =~ ′^\s*$′
	return "\<Tab>"
	else
	return "\<C-N>"
	endfunction
	inoremap <Tab> <C-R>=CleverTab()<CR>
	如此當你按下Tab鍵時, 若遊標前一個位置若是空白, 則送出的是真正的Tab,
	若有字元則依據complete功能補齊單字.
	ps:
	1.vim的complete功能可以參考其說明檔, :help ins-completion
	2.emacs也有相關功能, 這一期的凌客志(linux jounral國際中文版)有介紹.
	
	From: 佚名
	哇, 超棒的 ^_^
	那有沒有辦法可以做到typo hightlight呢?
	
	From: tren.bbs@bbs.sayya.org (我就是在下)
	如果你的系統有sed+awk+aspell的話, 這裡有一個 tab auto-complete+typo
	highlight的.vimrc:
	http://tren.phys.ntu.edu.tw/~tren/.vimrc
	這是我根據:
	1) rabit.bbs@bbs.sayya.org (愛看故事的小孩)所提供的tab auto-complete
	2) Claudio Fleiner的網頁介紹的typo highlight
	http://www.fleiner.com/vim/spell.html
	所修改綜合而成的. 因為C.F.的版本比較復雜, 且功能鍵為<F6>及類似的組合
	, 不適合telnet+vim使用.
	如果你需要比較復雜或是使用ispell的版本, 可以去2)查詢.
	這個版本的按鍵就只有4個:
	<tab> : 單字自動補全
	<esc>1: 拼字錯誤標示
	<esc>2: 正確拼法提示
	<esc>3: 取消拼字錯誤標示
	還不錯用啦, 如果你也愛偷懶的話 :]


----------------------------------------------------------------------------------------------------

* VIM 小技巧

相信有不少朋友跟我一樣是 vim 的愛好者， vim 功能強大但是坦白說我也只用到一些基本的功能，而這些功能已經足以應付我的需求，轉貼的文章中列出了這些常用的小技巧，相當實用喔...

	文章轉貼自：vim 官方網站
	
	=================================================
	Tip #305: Best of VIM Tips (VIM′s best Features)
	tip karma Rating 715/230, Viewed by 10747
	
	created: August 10, 2002 6:05 complexity: intermediate
	author: zzapper as of Vim: 5.7
	
	Here′s a necessarily cryptic list of "MY" Best Vim Tips that I′ve gleaned
	from http://vim.sf.net/ ;& comp.editors
	http://groups.google.com/groups?safe=off&group=comp.editors
	
	updated version at http://www.rayninfo.co.uk/vimtips.html
	------------------------------------------------------------------------------
	# Absolutely essential
	------------------------------------------------------------------------------
	vim.sf.net : Visit frequently
	comp.editors : "VIM" dominated newsgroup
	* # g* g# : find word under cursor (forwards/backwards)
	% : match brackets {}[]()
	matchit.vim : % now matches tags <tr><td><script> etc
	<C-N> <C-P> : word completion in insert mode
	<C-X><C-L> : Line complete SUPER USEFUL
	/<C-R><C-W> : Pull <cword> onto search/command line
	:set ignorecase # you nearly always want this
	:syntax on : colour syntax in Perl,HTML,PHP etc
	:h slash<C-D> : type control-D and get a list all help topics containing
	slash (plus use TAB for Help completion)
	------------------------------------------------------------------------------
	# MAKE IT EASY TO UPDATE/RELOAD_vimrc
	:nmap ,s :source $VIM/_vimrc
	:nmap ,v :e $VIM/_vimrc
	------------------------------------------------------------------------------
	#VISUAL MODE Mappings
	:vmap sb "zdi<C-R>z<ESC> : wrap around VISUALLY selected Text
	:vmap st "zdi<?= <C-R>z ?><ESC> : wrap <?= ?> around VISUALLY selected Text
	------------------------------------------------------------------------------
	# Exploring
	:Ex : file explorer note capital Ex
	\be : builtin buffer explorer
	:ls : list of buffers(eg following)
	:cd .. : move to parent directory
	------------------------------------------------------------------------------
	# Great
	guu : lowercase line
	gUU : uppercase line
	gf : open file name under cursor (SUPER)
	ga : display hex,ascii value of character under cursor
	ggVGg? : rot13 whole file
	CTRL-A,CTRL-X : increment,decerement number under cursor
	win32 users must remap CNTRL-A
	CTRL-R=5*5 : insert 25 into text
	------------------------------------------------------------------------------
	# Makes all other tips superfluous
	:h 42
	:h holy-grail
	:help!
	------------------------------------------------------------------------------
	# Markers & moving about
	′. : jump to last modification line (SUPER)
	`. : jump to exact spot in last modification line
	<C-O> : retrace your movements in file (old)
	<C-I> : retrace your movements in file (new)
	:ju(mps)
	:help jump-motions
	:history : list of all your commands
	------------------------------------------------------------------------------
	# Abbreviations & maps
	:map <f7> :′a,′bw! c:/aaa/x
	:map <f8> :r c:/aaa/x
	:map <f9> :w<CR>:!c:/php/php.exe %<CR>
	:map <f11> :.w! c:/aaa/xr<CR>
	:map <f12> :r c:/aaa/xr<CR>
	:ab php : list of abbreviations beginning php
	:map , : list of maps beginning ,
	# For use in Maps
	<CR> : carriage Return for maps
	<ESC> : Escape
	<LEADER> : normally \
	: | pipe
	------------------------------------------------------------------------------
	# List your Registers
	:reg : display contents of all registers
	"1p.... : retrieve numeric buffers
	------------------------------------------------------------------------------
	# Useful trick
	"ayy@a : execute "Vim command" in a text file
	yy@" : same thing using unnamed register
	------------------------------------------------------------------------------
	# Get output from other commands
	:r!ls.exe : reads in output of ls
	!!date : same thing
	:%!sort -u : use an external program to filter content
	------------------------------------------------------------------------------
	# Multiple Files Management
	:wn : write file and move to next (SUPER)
	:bd : remove file from buffer list (SUPER)
	:sav php.html : Save current file as php.html and "move" to php.html
	:sp fred.txt : open fred.txt into a split
	:e! : return to unmodified file
	:w c:/aaa/% : save file elsewhere
	:e # : edit alternative file
	:e %
	:rew : rewwind to first file in ARGS
	:bn : next file
	:bp : next file
	:brew
	------------------------------------------------------------------------------
	# Recording (BEST TIP of ALL)
	qq # record to q
	your commands
	q
	@q to execute
	@@ to Repeat
	# editing a register/recording
	"ap
	<you can now see register contents, edit as required>
	"add
	@a
	------------------------------------------------------------------------------
	# _vimrc essentials
	:set incsearch : jumps to search word as you type (annoying but excellent)
	:set wildignore=*.o,*.obj,*.bak,*.exe
	:set shiftwidth=3
	------------------------------------------------------------------------------
	# launching Win IE
	:nmap ,f :update<CR>:silent !start c:\progra~1\intern~1\iexplore.exe file://%:p<CR>
	:nmap ,i :update<CR>: !start c:\progra~1\intern~1\iexplore.exe <cWORD><CR>
	------------------------------------------------------------------------------
	# FTPing from VIM
	cmap ,r :Nread ftp://209.51.134.122/public_html/index.html
	cmap ,w :Nwrite ftp://209.51.134.122/public_html/index.html
	gvim ftp://209.51.134.122/public_html/index.html
	------------------------------------------------------------------------------
	# appending to registers (use CAPITAL)
	# yank 5 lines into "a" then add a further 5
	"a5yy
	10j
	"A5yy
	------------------------------------------------------------------------------
	[I : show lines matching word under cursor <cword>
	------------------------------------------------------------------------------
	#Conventional Shifting
	:′a,′b>>
	# visual shifting (builtin-repeat)
	:vnoremap < <gv
	:vnoremap > >gv
	------------------------------------------------------------------------------
	# searching
	/^joe.*fred.*bill/ : normal
	/^[A-J]\+/ : search for lines beginning A-J followed by at leat 1 A-J
	/forum\(\_.\)*pent search over possible multiple lines
	/fred\_s*joe/i : any whitespace including newline
	/fred\|joe : Search for FRED OR JOE
	------------------------------------------------------------------------------
	#substitution
	:%s/fred/joe/igc : general substitute command
	:%s/\r//g : Delete DOS returns ^M
	:′a,′bg/fred/s/dick/joe/gc : VERY USEFUL
	:s/\(.*\):\(.*\)/\2 : \1/ : reverse fields separated by :
	:%s/^.\{-}pdf/new.pdf/ non greedy matching (ie to first pdf)
	:s/fred/<c-r>a/g substitute "fred" with contents of register "a"
	:%s/^\(.*\)\n\1/\1$/ delete duplicate lines
	# non-greedy matching \{-}
	:%s/^.\{-}pdf/new.pdf/
	:help /\{-}
	:s/fred/<c-r>a/g substitute "fred" with contents of register "a"
	# multiple commands
	:%s/\f\+\.gif\>/\r&\r/g | v/\.gif$/d | %s/gif/jpg/
	:%s/suck\|buck/loopy/gc : ORing
	:s/__date__/\=strftime("%c")/ : insert datestring
	------------------------------------------------------------------------------
	# global command
	:g/^\s*$/d :delete all blank lines
	:g!/^dd/d : delete lines not containing string
	:v/^dd/d : delete lines not containing string
	:g/fred/,/joe/d : not line based
	:v/./.,/./-1join : compress empty lines
	:′a,′b g/^Error/ . w >> errors.txt
	:g/cmap\|form/p : ORing
	------------------------------------------------------------------------------
	# Paste register *
	:redir @* : redirect commands to paste
	:redir END
	"*yy : yank to paste
	"*p : insert paste buffer
	------------------------------------------------------------------------------
	# Formatting text
	gq<CR>
	gqap (a is motion p paragraph (visual mode))
	------------------------------------------------------------------------------
	# Operate command over multiple files
	:argdo %s/foo/bar/
	:bufdo %s/foo/bar/
	:windo %s/foo/bar/
	------------------------------------------------------------------------------
	# Command line tricks
	gvim -h
	ls | gvim - : edit a PIPE!!
	# vg.ksh (shell script)
	# vi all files in directory containing keyword $1 and jump to $1
	gvim.exe -c "/$1" $(grep -isl "$1" *) &
	------------------------------------------------------------------------------
	rate this tip Life Changing Helpful Unfulfilling
	
	<<fold braces and javadoc | Open a web-browser with the URL in the current line >>
	
	Additional Notes
	y_ellzs@tsmc.com.tw, August 11, 2002 7:36
	test
	david@tvis.co.uk, August 14, 2002 13:35
	Just a reminder that this is just my selection,but there′s plenty of other good tips
	in the vim tip collection
	
	# Vim traps
	In regular expressions you must backslash + (match 1 or more)
	/fred\+/ : matches fred/freddy but not free
	----------------------------------------
	# \v or very magic (usually) reduces backslashing
	/codes\(\n\|\s\)*where : normal regexp
	/\vcodes(\n|\s)*where : very magic
	----------------------------------------
	# pulling objects onto command/search line (SUPER)
	CTRL-R CTRL-W Pull word under the cursor into a command line or search
	CTRL-R - : pull small register
	CTRL-R [0-9a-z] : pull named registers
	CTRL-R % : pull file name (also #)
	----------------------------------------
	# manipulating registers
	map <f11> "qyy:let @q=@q."zzz"
	----------------------------------------
	# help
	:h visual<C-D><tab> : obtain list of all visual help topics
	: Then use tab to step thru them
	----------------------------------------
	# where was an option set
	:verbose set history : reveals value of history and where set
	----------------------------------------
	# running file thru an external program (eg php)
	map <f9> :w<CR>:!c:/php/php.exe %<CR>
	----------------------------------------
	david@tvis.co.uk, September 13, 2002 1:45
	# Inserting Carriage Returns
	:%s/nubian/<C-V><C-M>&/g : that′s what you type
	:%s/nubian/<C-Q><C-M>&/g : for Win32
	:%s/nubian/^M&/g : what you′ll see where ^M is ONE character
	----------------------------------------
	# Retrieving last command line command for copy & pasting into text
	<c-r>:
	# Retrieving last Search Command for copy & pasting into text
	<c-r>/
	----------------------------------------
	# doing things over multiple lines \_ means including newline
	/<!--\_p\{-}--> : search for multiple line comments
	/fred\_s*joe/i : any whitespace including newline
	/bugs\(\_.\)*bunny : bugs followed by bunny anywhere in file
	:h \_ : help
	----------------------------------------
	# more completions
	<C-X><C-F> :insert name of a file in current directory
	----------------------------------------
	# help for help
	:h visual<C-D><tab> : obtain list of all visual help topics
	: Then use tab to step thru them
	:h ctrl<C-D> : list help of all control keys
	:h :r : help for :ex command
	:h CTRL-R : normal mode
	:h \r : what′s \r in a regexp
	:h i_CTRL-R : help for say <C-R> in insert mode
	:h c_CTRL-R : help for say <C-R> in command mode
	:h v_CTRL-V : visual mode
	----------------------------------------
	kdr_tech@yahoo.com, November 3, 2002 10:23
	This is an extension to
	# pulling objects onto command/search line
	
	If you use
	/CTRL-R CTRL-A
	it brings the whole word under the cursor including any special characters.
	For Ex:
	
	If you are in a HTML page and the cursor is under a keyword <table>
	
	/CTRL-R CTRL-A brings /<table>
	/CTRL-R CTRL-W brings /table (depending on what the letter under your cursor is ... table or < or >
	
	-Kdr
	zzapper@ntlworld.com, December 23, 2002 11:42
	The Buffer Explorer scripts mentioned above (\be \bs) rely on the 2nd most popular VIM script bufexplorer.vim
	
	available at http://www.vim.org/script.php?script_id=42 updated 05-Nov-2002
	
	This is a must have script.
	
	Have recently started to appreciate taglist.vim (the most popular VIM script) it really comes into it′s own with very long programs containting lots of subroutines/functions as it shows which function/sub you′re in etc etc
	
	http://www.vim.org/script.php?script_id=273 updated 20-dec-02
	
	zzapper


----------------------------------------------------------------------------------------------------

* 編輯utf-8編碼文件技巧

	set enc=utf-8 讓文件存檔時使用utf-8
	set tenc=big5 編輯文件時先自動轉成 big5 再顯示, 避免出現亂碼

----------------------------------------------------------------------------------------------------

* 編輯多文件技巧

	:ls 顯示目前已開啟檔案. 號碼後有 %a 為目前編輯中檔案, # 則是上一個編輯的檔案
	:bn 切換到下一個(號碼+1)檔案
	:bp 切換到上一個(號碼-1)檔案
	:b數字 切換到號碼指定的檔案
	:b# 切換到上一個檔案 (號碼後有#標記的)
	:bd 將目前編輯檔案從buffer中移除

----------------------------------------------------------------------------------------------------

* 開啟標頭標的技巧

	把游標移到標頭檔的檔名（或路徑上），按gf即可開始。

	但是，預設路徑是在/usr/include，因此我們需要設定搜尋路徑

	set path=PATH_TO_FOO,PATH_TO_BAR	設定搜尋路徑

	set path+=PATH_TO_FOO1			加上指定的搜尋路徑

	set path-=PATH_TO_FOO1			移除指定的搜尋路徑

	因此，我在 setup_env.sh 中加上 export K_INCL=include,$K_INCL 注意，是逗號，不是冒號
	然後在 ~/.vimrc 加上 set path=.,$K_INCL

	以後，只要我在要 Trace 的 Kernel Source Tree 最上層開啟檔案，即可有兩個優點：

		1. 支援TAG
		2. 可以直接開啟標頭檔

----------------------------------------------------------------------------------------------------

* 如何刪除某個檔案中所有包含某pattern的列 (部份摘自 http://www.study-area.net/tips/vim/Vim-10.html#metachar)

	一直困擾我很久的如何刪除整個檔案中包含某個pattern的方法, 原來早就在本檔案之中. 只是我一直沒用過.

	介紹一下"全域性指令"

	格式:
		:[range]g/pattern/[cmd]

	範例:

		:g/^$/d 
		
			刪除所有空白列
			
		:g/arm7tdmi/d 
		
			刪除所有包含 arm7tdmi 的列
		
		:g/^[<Space><Tab>]*$/d

			在 vim 或 elvis 裡您可以如此照打，也就是 <Space> 代表空白字元，<Tab> 代表按 Tab 鍵的結果。在原始 vi 則不行，得自行按出特殊字元出來，就是 Ctrl-v Space 及 Ctrl-v Tab。或採更簡單的打法：

		:g/^\s*$/d

			還記得中介中元嗎？好用吧！少打了不少字。:-) 意思就是刪除含 0 或 1 個以上空白字元的行。

			有些書中寫成 :%s/^$//g 可以刪除空白行，這是錯誤的，因為 :s 這個指令只更動一行裡的內容物，但不會做刪除一行的動作。 

----------------------------------------------------------------------------------------------------

* 中介字元 (摘自 http://www.study-area.net/tips/vim/Vim-10.html#metachar)

主要是簡化 regexp 的書寫。

\s  表空白字元，即 <Space> 或 <Tab>。

    * 不含換行字元，這是編輯器的特性使然。在 perl 的 \s 是包含換行字元的。而且 vim 及 elvis 皆不支援 \n 這種換行中介字元。 

    \S  表非空白字元。
    \d  表數目字（digits），即 [0-9]。
    \D  表非數目字，即 [^0-9]。
    \w  表一般字元（word character），包括底線。即 [0-9a-zA-Z_]。
    \W  表非一般字元，即 [^0-9a-zA-Z_]。
    \a  表英文字母（alphabetic character），即 [a-zA-Z]。
    \A  表非英文字母，即 [^a-zA-Z]。
    \l  表小寫字母（lowercase character），即 [a-z]。
    \L  表非小寫字母，即 [^a-z]。
    \u  表大寫字母（uppercase），即 [A-Z]。
    \U  表非大寫字母，即 [^A-Z]。

        * 原始 vi 不支援此種中介字元。
	* 使用中介字元的比對速度將會比使用字元集合 [] 的快。 

----------------------------------------------------------------------------------------------------

* & 替代變數 (摘自 http://www.study-area.net/tips/vim/Vim-10.html#metachar)

代表置換時合於 patern 的字元或字串。

[實例] :%s/\u\d\d\d\d\d\d\d\d\d\>/ID:&/g
這樣全文中的身份證字號前就會加上 ID: 字樣，也就是說 T123456789 會被換成 ID:T123456789。還記得嗎？ \d 就是 [0-9]，\u 代表大寫的英文字母。加個 \> 是防止 T12345678999 也被換掉。當然前面再加個 \< 更保險。ID: 字樣您用中文也行！
另一個好用的例子是電話號碼前加上 TeL:，就請您自行練習了！

[實例] 將檔案 3 至 7 行的資料向右移 2 個空白

  :3,7s/.*/  &/

但這樣連空白行也是會插入空白字元，較高明的做法是：

  :3,7s/.\+/  &/

這樣空白行就不會去動它了！想通了 .* 及 .\+ 的意思了嗎？往前翻一下 . * \+ 的定義。

[實例] 將檔案 3 至 7 行的資料向左移 2 個空白

  :3,7s/^  //

就是刪去行首的二個空白啦！

[實例] 將全文的 Edward 這個單字，前後加上中括號

  :%s/\<Edward\>/[&]/g

[實例] 將全文的 Edward 這個單字，改成大寫的。

  :%s/\<Edward\>/\U&/g

    * ㄟ！\U 不是代表非大寫字母嗎？喔！您搞錯位置了。\U 在 pattern 的位置的時候是指非大寫字母的樣式，即 [^A-Z]，但如果是在置換字串位置的時候是指將其後的字串通通改成大寫。與其相對的是 \L，會將其後的字串改為小寫。詳細請 :h sub-replace-special。 

[實例] 將全文每行最後加上 <BR> 這個 HTML tag。

  :%s/.*/&<BR>/g

怎麼樣，是否已感覺到 regexp 威力無窮了呢？還是您已經快睡著了呢？:-) 不過也請您想想，如果是在沒有 regexp 功能的編輯器裡，範例中的一些動作您會怎麼做呢？一個一個去改？ 

----------------------------------------------------------------------------------------------------

* bufdo

	假設要利用 vim 對 *.txt 做字串代換， 將所有的 old 全部換成 new。

	vim *.txt
	:bufdo %s/old/new/g | w
	:q

	這樣就可以利用vim進行多檔替換了.

	註： 其實並不一定要用 vim 的多檔編輯做這工作。 也可以用 sed, awk, perl 等軟體。


----------------------------------------------------------------------------------------------------

* 寫 C 程式時自動補註解等符號

	setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://

----------------------------------------------------------------------------------------------------

* 搜尋的技巧

	先到 VIM 的 script 下載 grep.vim 及 greputil.vim 並放在 ~/.vim/plugin

	grep.vim 的設定 (~/.vimrc)

		由於我用它來搜尋 Source Tree， 原作者建議設定 F3 呼叫 :Grep， 為了配合我的需求， 改成 :Rgrep 搜尋。
		nnoremap <silent> <F3> :Rgrep<CR>

		預設只尋找 *.c *.C *.h *.H *.cpp
		let Grep_Default_Filelist = '*.[cC] *.[hH] *.cpp'

		忽略 *.bak *~ .#*， 最後一種是 CVS update -C 時產生的備份檔
		let Grep_Skip_Files = '*.bak *~ .#*'

		忽略二進位檔案
		let Grep_Default_Options = '-I'		

		註： 呼叫此外掛的 Grep, Rgrep, Egrep....等命令時， 都會自動抓取游標所在的單字， 並設定為尋找的字串
		註： 尋找的檔案類別以及要尋找的目錄都可以在按 F3 後再修改
		註： 此外掛會在要尋找的關鍵字兩邊自動加上單引號， 不需要再多打。


		若是 MS-Windows 平台，可以到 GNUWin32 http://gnuwin32.sourceforge.net/packages.html 下載下列幾個套件安裝：
		FindUtils, Grep

		並在 ~/.vimrc 內設定 find, grep 的路徑、不要用xargs、使用Cygwin、ShellQuote指定為 " (兩邊用單引號包起來)
		在 PATH 環境變數將 GNUWin32 安裝路徑下的 bin 加入。
		醬子用起來差不多與 Linux 下一樣了。

		註： 若未將 GNUWin32 加到路徑，有時會找不到，原因不明。
		註： 在 Windows 使用 xargs 似乎會有找不情況，還在找原因。
		註： 若未指定 ShellQuote，則無法指定 \ 符號。 如： \<、\>。


	greputil.vim

		按下 F6 相當於輸入 :cnext 跳到下一個搜尋目標/編譯錯誤處。
		按下 F7 相當於輸入 :cprev 跳到上一個搜尋目標/編譯錯誤處。

		按下 Shift + F6 則相當於輸入 :cold 到上次搜尋結果/編譯結果輸出
		按下 Shift + F7 則相當於輸入 :cnew 到下次搜尋結果/編譯結果輸出

		註： Shift + F[67] 在 putty 上可能無法使用。


	配合上述兩個外掛， 以後搜尋文字不用再打一長串命令， 也不會多搜一堆沒必要搜尋的檔案。


----------------------------------------------------------------------------------------------------
