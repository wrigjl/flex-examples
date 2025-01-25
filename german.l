
%{

// The idea with this scanner is to decompose the inputs into nouns
// and other words. German makes this easier by (usually) capitalizing
// all the nouns in a sentence. Below are some phrases to try...
// they -may- be gibberish in German (I used translate.google.com).

// Es gibt kein Geschaft wie das Showbusiness
// Mein Luftkissenfahrzeug ist voller Aale
// Warum vertrauen Wissenschaftler Atomen nicht?  Weil aus ihnen alles besteht
// Ich habe einem Elefanten in die Hose geschossen.
// nicht mein Zirkus, nicht meine Affen


int nouns = 0;
int otherwords = 0;

#define TOKEN_NOUN	1
#define	TOKEN_OTHER	2
#define	TOKEN_EOF	3
%}

%option noyywrap
%option nounistd
%option never-interactive

%%


[A-Z][a-z]*		{
				nouns++;
				return TOKEN_NOUN;
			}

[a-z][a-z]*		{
				otherwords++;
				return TOKEN_OTHER;
			}

[ \t\n]+		{}

[ \?\.\!]		{}

<<EOF>>			{
				return TOKEN_EOF;
			}
%%


// This is a traditional approach to a lexical scanner where
// yylex() is called repeatedly to obtain the next
// token (return value)/lexeme(yytext variable).

int main() {

	for (;;) {
		int tok = yylex();
		printf("token %d, lexeme %s\n", tok, yytext);
		if (tok == TOKEN_EOF)
			break;
	}

	printf("%d nouns, %d other = %d total words\n",
	    nouns, otherwords, nouns + otherwords);
	return 0;
}
