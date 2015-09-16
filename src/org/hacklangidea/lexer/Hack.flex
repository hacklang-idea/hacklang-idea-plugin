package org.hacklangidea.lexer;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;
import org.hacklangidea.psi.HackTypes;
import com.intellij.psi.TokenType;

%%

%class HackLexer
%implements FlexLexer
%unicode
%function advance
%public
%type IElementType
%eof{  return;
%eof}

%x ST_IN_HTML
%x ST_IN_SCRIPTING
%x ST_AFTER_HASHBANG
%x ST_DOUBLE_QUOTES
%x ST_BACKQUOTE
%x ST_HEREDOC
%x ST_NOWDOC
%x ST_END_HEREDOC
%x ST_LOOKING_FOR_PROPERTY
%x ST_LOOKING_FOR_VARNAME
%x ST_LOOKING_FOR_COLON
%x ST_LOOKING_FOR_FUNC_NAME
%x ST_VAR_OFFSET
%x ST_LT_CHECK
%x ST_COMMENT
%x ST_DOC_COMMENT
%x ST_ONE_LINE_COMMENT
%x ST_IN_PHP_OPEN_TAG

%x ST_XHP_IN_TAG
%x ST_XHP_END_SINGLETON_TAG
%x ST_XHP_END_CLOSE_TAG
%x ST_XHP_CHILD
%x ST_XHP_COMMENT

LNUM=    [0-9]+
DNUM=    ([0-9]*[\.][0-9]+)|([0-9]+[\.][0-9]*)
BNUM=    "0b"[01]+
EXPONENT_DNUM=   (({LNUM}|{DNUM})[eE][+-]?{LNUM})
HNUM=    "0x"[0-9a-fA-F]+
LABEL=   [a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*
WHITESPACE= [ \n\r\t]+
TABS_AND_SPACES= [ \t]*
TOKENS= [;:,.\[\])|\^&+\-*/=%!~$<>?@]
ANY_CHAR= (.|[\n])
NEWLINE= ("\r"|"\n"|"\r\n")
XHPLABEL= {LABEL}([:-]{LABEL})*
COMMENT_REGEX= ("/*"([^\*]|("*"[^/]))*"*/"|("//"|"#")[^\r\n]*{NEWLINE})
WHITESPACE_AND_COMMENTS= ([ \n\r\t]|({COMMENT_REGEX}))+


DOUBLE_QUOTES_LITERAL_DOLLAR= ("$"+([^a-zA-Z_\x7f-\xff$\"\\{]|("\\"{ANY_CHAR})))
BACKQUOTE_LITERAL_DOLLAR=     ("$"+([^a-zA-Z_\x7f-\xff$`\\{]|("\\"{ANY_CHAR})))

DOUBLE_QUOTES_CHARS= ("{"*([^$\"\\{]|("\\"{ANY_CHAR}))|{DOUBLE_QUOTES_LITERAL_DOLLAR})
BACKQUOTE_CHARS=     ("{"*([^$`\\{]|("\\"{ANY_CHAR}))|{BACKQUOTE_LITERAL_DOLLAR})


%state WAITING_VALUE


%%

<ST_IN_SCRIPTING>"exit"                  { return HackTypes.T_EXIT;}
<ST_IN_SCRIPTING>"die"                   { return HackTypes.T_EXIT;}
<ST_IN_SCRIPTING>"const"                 { return HackTypes.T_CONST;}
<ST_IN_SCRIPTING>"return"                {  return HackTypes.T_RETURN; }
<ST_IN_SCRIPTING>"yield"                 {  return HackTypes.T_YIELD; }
<ST_IN_SCRIPTING>"try"                   {  return HackTypes.T_TRY; }
<ST_IN_SCRIPTING>"catch"                 {  return HackTypes.T_CATCH; }
<ST_IN_SCRIPTING>"finally"               {  return HackTypes.T_FINALLY; }
<ST_IN_SCRIPTING>"throw"                 {  return HackTypes.T_THROW; }
<ST_IN_SCRIPTING>"if"                    {  return HackTypes.T_IF; }
<ST_IN_SCRIPTING>"else"{WHITESPACE}*"if" { return HackTypes.T_ELSEIF; }
<ST_IN_SCRIPTING>"endif"                 {  return HackTypes.T_ENDIF; }
<ST_IN_SCRIPTING>"else"                  {  return HackTypes.T_ELSE; }
<ST_IN_SCRIPTING>"while"                 {  return HackTypes.T_WHILE; }
<ST_IN_SCRIPTING>"endwhile"              {  return HackTypes.T_ENDWHILE; }
<ST_IN_SCRIPTING>"do"                    {  return HackTypes.T_DO; }
<ST_IN_SCRIPTING>"for"                   {  return HackTypes.T_FOR; }
<ST_IN_SCRIPTING>"endfor"                {  return HackTypes.T_ENDFOR; }
<ST_IN_SCRIPTING>"foreach"               {  return HackTypes.T_FOREACH; }
<ST_IN_SCRIPTING>"endforeach"            {  return HackTypes.T_ENDFOREACH; }
<ST_IN_SCRIPTING>"declare"               {  return HackTypes.T_DECLARE; }
<ST_IN_SCRIPTING>"enddeclare"            {  return HackTypes.T_ENDDECLARE; }
<ST_IN_SCRIPTING>"instanceof"            {  return HackTypes.T_INSTANCEOF; }
<ST_IN_SCRIPTING>"as"                    {  return HackTypes.T_AS; }
<ST_IN_SCRIPTING>"super"                 {  return HackTypes.T_SUPER; }
<ST_IN_SCRIPTING>"switch"                {  return HackTypes.T_SWITCH; }
<ST_IN_SCRIPTING>"endswitch"             {  return HackTypes.T_ENDSWITCH; }
<ST_IN_SCRIPTING>"case"                  {  return HackTypes.T_CASE; }
<ST_IN_SCRIPTING>"default"               {  return HackTypes.T_DEFAULT; }
<ST_IN_SCRIPTING>"break"                 {  return HackTypes.T_BREAK; }
<ST_IN_SCRIPTING>"continue"              {  return HackTypes.T_CONTINUE; }
<ST_IN_SCRIPTING>"goto"                  {  return HackTypes.T_GOTO; }
<ST_IN_SCRIPTING>"echo"                  {  return HackTypes.T_ECHO; }
<ST_IN_SCRIPTING>"print"                 {  return HackTypes.T_PRINT; }
<ST_IN_SCRIPTING>"class"                 {  return HackTypes.T_CLASS; }
<ST_IN_SCRIPTING>"interface"             {  return HackTypes.T_INTERFACE; }
<ST_IN_SCRIPTING>"trait"                 {  return HackTypes.T_TRAIT; }
<ST_IN_SCRIPTING>"..."                   {  return HackTypes.T_ELLIPSIS; }
<ST_IN_SCRIPTING>"insteadof"             {  return HackTypes.T_INSTEADOF; }
<ST_IN_SCRIPTING>"extends"               {  return HackTypes.T_EXTENDS; }
<ST_IN_SCRIPTING>"implements"            {  return HackTypes.T_IMPLEMENTS; }
//<ST_IN_SCRIPTING>"enum"                { XHP_ONLY_KEYWORD(T_ENUM; }
//<ST_IN_SCRIPTING>"attribute"           { XHP_ONLY_KEYWORD(T_XHP_ATTRIBUTE; }
//<ST_IN_SCRIPTING>"category"            { XHP_ONLY_KEYWORD(T_XHP_CATEGORY; }
//<ST_IN_SCRIPTING>"children"            { XHP_ONLY_KEYWORD(T_XHP_CHILDREN; }
//<ST_IN_SCRIPTING>"required"            { XHP_ONLY_KEYWORD(T_XHP_REQUIRED; }


<ST_IN_SCRIPTING>"function"              {  return HackTypes.T_FUNCTION;}