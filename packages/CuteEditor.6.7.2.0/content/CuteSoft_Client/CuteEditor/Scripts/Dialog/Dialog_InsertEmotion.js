var OxOcd95=[""," ","=\x22","\x22","src","^[a-z]*:[/][/][^/]*","Edit","\x3CIMG border=\x220\x22 align=\x22absmiddle\x22 src=\x22","\x22 src_cetemp=\x22","\x22\x3E","ImageTable","IMG","length","className","dialogButton","onmouseover","CuteEditor_ColorPicker_ButtonOver(this)","onclick","insert(this)"];var editor=Window_GetDialogArguments(window);function attr(name,Ox4f){if(!Ox4f||Ox4f==OxOcd95[0]){return OxOcd95[0];} ;return OxOcd95[1]+name+OxOcd95[2]+Ox4f+OxOcd95[3];} ;function insert(img){if(img){var src=img[OxOcd95[4]];src=src.replace( new RegExp(OxOcd95[5],OxOcd95[0]),OxOcd95[0]);var Ox2d=OxOcd95[0];if(editor.GetActiveTab()==OxOcd95[6]){Ox2d=OxOcd95[7]+src+OxOcd95[8]+src+OxOcd95[9];} else {Ox2d=OxOcd95[7]+src+OxOcd95[9];} ;editor.PasteHTML(Ox2d);Window_CloseDialog(window);} ;} ;function do_Close(){Window_CloseDialog(window);} ;var ImageTable=Window_GetElement(window,OxOcd95[10],true);var images=ImageTable.getElementsByTagName(OxOcd95[11]);var len=images[OxOcd95[12]];for(var i=0;i<len;i++){var img=images[i];img[OxOcd95[13]]=OxOcd95[14];img[OxOcd95[15]]= new Function(OxOcd95[16]);img[OxOcd95[17]]= new Function(OxOcd95[18]);} ;