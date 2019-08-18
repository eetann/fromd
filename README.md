# fromd.vim  
Change to any text from markdown  

*fromd.txt* Change to any text from markdown  

Author: eetann  
License: MIT license  

## CONTENTS  
Intoroduction `fromd-intoroduction`  
Interface     `fromd-interface`  
Commands    `fromd-commands`  
Variables   `fromd-variables`  
Options     `fromd-options`  


## INTORODUCTION  
*fromd* change the text from markdown.  
## INTERFACE  
### COMMANDS  
*:Fromd* :Fromd {key}  
This is the command for change text from markdown.  
You need the name that key defined by `g:grammars`.  

```vim
" Example
:Fromd fsw
```


The argument 'fsw' means free style wiki. You can change the text to free style wiki notation from Markdown notation.  

### VARIABLES  
*g:grammars* g:grammars  
This is dict variable for destination text grammars.  
You can define values using this.  
See `fromd-option` for options.  
Each key is used the command  `:Fromd` argument.  

See below for default.  


```vim
let g:grammars['fsw'] = {
\       'LineBreak': '',
\           'Quote': '""',
\            'List': '*',
\      'Horizontal': '-',
\          'Italic': "''\1''",
\            'Bold': "'''\1'''",
\          'Strong': "'''\1'''",
\   'Strikethrough': '==\1==',
\           'Table': ',',
\         'headers': ['!!!','!!','!','!','!','!']
\}
```



### OPTIONS  
*fromd-option-LineBreak* LineBreak  
This is the option for newline character because Markdown notation need two spaces the end of line as newline character.  
Maybe, almost text notation don't need special newline character, so  you define empty character.  

*fromd-option-Quote* Quote  
This is the option for quote.  
*fromd-option-List* List  
This is the option for list.  
This option make effective when list of the notation that you change from Markdown represent nest using repeating character.  

*fromd-option-Horizontal* Horizontal  
Unimplemented.  

*fromd-option-Italic* Italic  
Unimplemented.  

*fromd-option-Bold* Bold  
Unimplemented.  

*fromd-option-Strong* Strong  
Unimplemented.  

*fromd-option-Strikethrough* Strikethrough  
Unimplemented.  

*fromd-option-Table* Table  
Unimplemented.  

*fromd-option-headers* headers  
This is the option for headers.  
The notation of Markdown define six stages, so you need six stages.  
