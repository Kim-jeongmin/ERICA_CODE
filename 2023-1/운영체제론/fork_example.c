#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
int main()
{
        char szText[256] ;
        char *pSep ;
        char *pText;
 
        strcpy(szText, "name,age,,,,address") ;
 
        pText = szText ;
        pSep = strsep(&pText, ",") ;
        printf("pSep : %s\n", pSep) ;
 
        pSep = strsep(&pText, ",") ;
        printf("pSep : %s\n", pSep) ;
 
        pSep = strsep(&pText, ",") ;
        pSep = strsep(&pText, ",") ;
        pSep = strsep(&pText, ",") ;
 
        pSep = strsep(&pText, ",") ;
        printf("pSep : %s\n", pSep) ;
 
        return 1 ;
}
