" Vim syntax file
" Language:	breeze ()
" Maintainer:	Jidong Zhang <545628706@qq.com>
" URL:		http://github.com/jidzhang/vim-breeze-tpl
" Last change:	2016-09-19

echomsg 'breeze-tpl syntax file loaded' 

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'breeze'
endif

" Source HTML syntax
runtime! syntax/jsp.vim
unlet b:current_syntax

" Next syntax items are case-sensitive
syn case match

"syn region jspScriptlet matchgroup=jspTag start=/<%/  keepend end=/%>/ contains=@jspJava
"syn region jspComment			  start=/<%--/	      end=/--%>/
"syn region jspDecl	matchgroup=jspTag start=/<%!/ keepend end=/%>/ contains=@jspJava
"syn region jspExpr	matchgroup=jspTag start=/<%=/ keepend end=/%>/ contains=@jspJava
"syn region jspDirective			  start=/<%@/	      end=/%>/ contains=htmlString,jspDirName,jspDirArg

syn region breezeJsLine			  start=/<!--\$/      end=/-->/me=s-1 contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
syn region breezeJsLine			  start=/\${/	      end=/}/me=s-1   contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
syn region breezeJsBlock		  start=/<!--\$[^}>]*{-->/ keepend end=/<!--\$[^{>]*}-->/ contains=@htmlTag

"syn keyword jspDirName contained include page taglib
"syn keyword jspDirArg contained file uri prefix language extends import session buffer autoFlush
"syn keyword jspDirArg contained isThreadSafe info errorPage contentType isErrorPage
"syn region jspCommand			  start=/<jsp:/ start=/<\/jsp:/ keepend end=/>/ end=/\/>/ contains=htmlString,jspCommandName,jspCommandArg
"syn keyword jspCommandName contained include forward getProperty plugin setProperty useBean param params fallback
"syn keyword jspCommandArg contained id scope class type beanName page flush name value property
"syn keyword jspCommandArg contained code codebase name archive align height
"syn keyword jspCommandArg contained width hspace vspace jreversion nspluginurl iepluginurl

"" Redefine htmlTag so that it can contain jspExpr
"syn clear htmlTag
"syn region htmlTag start=+<[^/%]+ end=+>+ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster,jspExpr,javaScript

"" Define the default highlighting.
"" Only when an item doesn't have highlighting yet
"" java.vim has redefined htmlComment highlighting
"hi def link htmlComment	 Comment
"hi def link htmlCommentPart Comment
"" Be consistent with html highlight settings
"hi def link jspComment	 htmlComment
"hi def link jspTag		 htmlTag
"hi def link jspDirective	 jspTag
"hi def link jspDirName	 htmlTagName
"hi def link jspDirArg	 htmlArg
"hi def link jspCommand	 jspTag
"hi def link jspCommandName  htmlTagName
"hi def link jspCommandArg	 htmlArg

hi def link breezeJsBlock htmlTag

hi def link breezeJsLine Special

if main_syntax == 'breeze'
  unlet main_syntax
endif

let b:current_syntax = "breeze"

" vim: ts=8
