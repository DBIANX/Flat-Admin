var OxO95b6=["inp_name","inp_access","inp_id","inp_index","inp_size","inp_Multiple","inp_Disabled","inp_item_text","inp_item_value","btnInsertItem","btnUpdateItem","btnDeleteItem","btnMoveUpItem","btnMoveDownItem","list_options","list_options2","inp_item_forecolor","inp_item_forecolor_Preview","inp_item_backcolor_Preview","text","value","color","style","backgroundColor","selectedIndex","options","Please select an item first","length","ondblclick","onclick","OPTION","document","id","cssText","Name","name","size","checked","disabled","multiple","tabIndex","","accessKey"];var inp_name=Window_GetElement(window,OxO95b6[0],true);var inp_access=Window_GetElement(window,OxO95b6[1],true);var inp_id=Window_GetElement(window,OxO95b6[2],true);var inp_index=Window_GetElement(window,OxO95b6[3],true);var inp_size=Window_GetElement(window,OxO95b6[4],true);var inp_Multiple=Window_GetElement(window,OxO95b6[5],true);var inp_Disabled=Window_GetElement(window,OxO95b6[6],true);var inp_item_text=Window_GetElement(window,OxO95b6[7],true);var inp_item_value=Window_GetElement(window,OxO95b6[8],true);var btnInsertItem=Window_GetElement(window,OxO95b6[9],true);var btnUpdateItem=Window_GetElement(window,OxO95b6[10],true);var btnDeleteItem=Window_GetElement(window,OxO95b6[11],true);var btnMoveUpItem=Window_GetElement(window,OxO95b6[12],true);var btnMoveDownItem=Window_GetElement(window,OxO95b6[13],true);var list_options=Window_GetElement(window,OxO95b6[14],true);var list_options2=Window_GetElement(window,OxO95b6[15],true);var inp_item_forecolor=Window_GetElement(window,OxO95b6[16],true);var inp_item_forecolor=Window_GetElement(window,OxO95b6[16],true);var inp_item_forecolor_Preview=Window_GetElement(window,OxO95b6[17],true);var inp_item_backcolor_Preview=Window_GetElement(window,OxO95b6[18],true);function SetOption(Ox1a6){Ox1a6[OxO95b6[19]]=inp_item_text[OxO95b6[20]];Ox1a6[OxO95b6[20]]=inp_item_value[OxO95b6[20]];Ox1a6[OxO95b6[22]][OxO95b6[21]]=inp_item_forecolor[OxO95b6[20]];Ox1a6[OxO95b6[22]][OxO95b6[23]]=inp_item_backcolor[OxO95b6[20]];} ;function SetOption2(Ox1a6){Ox1a6[OxO95b6[19]]=inp_item_value[OxO95b6[20]];Ox1a6[OxO95b6[20]]=inp_item_text[OxO95b6[20]];Ox1a6[OxO95b6[22]][OxO95b6[21]]=inp_item_forecolor[OxO95b6[20]];Ox1a6[OxO95b6[22]][OxO95b6[23]]=inp_item_backcolor[OxO95b6[20]];} ;function Select(Ox1a6){var Ox5a1=Ox1a6[OxO95b6[24]];list_options[OxO95b6[24]]=Ox5a1;list_options2[OxO95b6[24]]=Ox5a1;inp_item_text[OxO95b6[20]]=list_options2[OxO95b6[20]];inp_item_value[OxO95b6[20]]=list_options[OxO95b6[20]];} ;function Insert(){var Ox1a6= new Option();SetOption(Ox1a6);list_options[OxO95b6[25]].add(Ox1a6);var Ox5a3= new Option();SetOption2(Ox5a3);list_options2[OxO95b6[25]].add(Ox5a3);FireUIChanged();} ;function Update(){if(list_options[OxO95b6[24]]==-1){alert(OxO95b6[26]);return ;} ;var Ox1a6=list_options.options(list_options.selectedIndex);SetOption(Ox1a6);var Ox5a3=list_options2.options(list_options2.selectedIndex);SetOption2(Ox5a3);FireUIChanged();} ;function Move(Ox142){var Ox5a1=list_options[OxO95b6[24]];if(Ox5a1<0){return ;} ;var Ox5a5=Ox5a1-Ox142;if(Ox5a5<0){Ox5a5=0;} ;if(Ox5a5>(list_options[OxO95b6[25]][OxO95b6[27]]-1)){Ox5a5=list_options[OxO95b6[25]][OxO95b6[27]]-1;} ;if(Ox5a1==Ox5a5){return ;} ;var Ox1a6=list_options.options(list_options.selectedIndex);var Ox12=list_options2[OxO95b6[20]];var Ox8=list_options[OxO95b6[20]];Delete();inp_item_text[OxO95b6[20]]=Ox12;inp_item_value[OxO95b6[20]]=Ox8;var Ox1a6= new Option();SetOption(Ox1a6);list_options[OxO95b6[25]].add(Ox1a6,Ox5a5);var Ox5a3= new Option();SetOption2(Ox5a3);list_options2[OxO95b6[25]].add(Ox5a3,Ox5a5);list_options[OxO95b6[24]]=Ox5a5;list_options2[OxO95b6[24]]=Ox5a5;FireUIChanged();} ;function Delete(){if(list_options[OxO95b6[24]]==-1||list_options[OxO95b6[24]]==-1){alert(OxO95b6[26]);return ;} ;var Ox5a6=list_options[OxO95b6[24]];var Ox1a6=list_options.options(list_options.selectedIndex);Ox1a6.removeNode(true);Ox1a6=list_options2.options(list_options2.selectedIndex);Ox1a6.removeNode(true);if(list_options[OxO95b6[25]][OxO95b6[27]]>Ox5a6){list_options[OxO95b6[24]]=Ox5a6;} else {if(list_options[OxO95b6[25]][OxO95b6[27]]){list_options[OxO95b6[24]]=list_options[OxO95b6[25]][OxO95b6[27]]-1;} ;} ;list_options.ondblclick();if(list_options2[OxO95b6[25]][OxO95b6[27]]>Ox5a6){list_options2[OxO95b6[24]]=Ox5a6;} else {if(list_options2[OxO95b6[25]][OxO95b6[27]]){list_options2[OxO95b6[24]]=list_options2[OxO95b6[25]][OxO95b6[27]]-1;} ;} ;FireUIChanged();} ;list_options[OxO95b6[28]]=function list_options_ondblclick(){if(list_options[OxO95b6[24]]==-1){return ;} ;var Ox1a6=list_options.options(list_options.selectedIndex);inp_item_text[OxO95b6[20]]=Ox1a6[OxO95b6[19]];inp_item_value[OxO95b6[20]]=Ox1a6[OxO95b6[20]];inp_item_forecolor[OxO95b6[20]]=inp_item_forecolor[OxO95b6[22]][OxO95b6[23]]=inp_item_forecolor_Preview[OxO95b6[22]][OxO95b6[23]]=Ox1a6[OxO95b6[22]][OxO95b6[21]];inp_item_backcolor[OxO95b6[20]]=inp_item_backcolor[OxO95b6[22]][OxO95b6[23]]=inp_item_backcolor_Preview[OxO95b6[22]][OxO95b6[23]]=Ox1a6[OxO95b6[22]][OxO95b6[23]];} ;inp_item_forecolor[OxO95b6[29]]=inp_item_forecolor_Preview[OxO95b6[29]]=function inp_item_forecolor_onclick(){SelectColor(inp_item_forecolor,inp_item_forecolor_Preview);} ;inp_item_backcolor[OxO95b6[29]]=inp_item_backcolor_Preview[OxO95b6[29]]=function inp_item_backcolor_onclick(){SelectColor(inp_item_backcolor,inp_item_backcolor_Preview);} ;function CopySelect(Ox5ab,Ox5ac){Ox5ac[OxO95b6[25]][OxO95b6[27]]=0;for(var i=0;i<Ox5ab[OxO95b6[25]][OxO95b6[27]];i++){var Ox5ad=Ox5ab[OxO95b6[25]][i];var Ox5a3;if(Browser_IsWinIE()){Ox5a3=Ox5ac[OxO95b6[31]].createElement(OxO95b6[30]);} else {Ox5a3=document.createElement(OxO95b6[30]);} ;if(Ox5ac[OxO95b6[32]]!=OxO95b6[15]){Ox5a3[OxO95b6[20]]=Ox5ad[OxO95b6[20]];Ox5a3[OxO95b6[19]]=Ox5ad[OxO95b6[19]];} else {Ox5a3[OxO95b6[20]]=Ox5ad[OxO95b6[19]];Ox5a3[OxO95b6[19]]=Ox5ad[OxO95b6[20]];} ;Ox5a3[OxO95b6[22]][OxO95b6[33]]=Ox5ad[OxO95b6[22]][OxO95b6[33]];Ox5ac[OxO95b6[25]].add(Ox5a3);} ;Ox5ac[OxO95b6[24]]=Ox5ab[OxO95b6[24]];} ;UpdateState=function UpdateState_Select(){} ;SyncToView=function SyncToView_Select(){if(element[OxO95b6[34]]){inp_name[OxO95b6[20]]=element[OxO95b6[34]];} ;if(element[OxO95b6[35]]){inp_name[OxO95b6[20]]=element[OxO95b6[35]];} ;inp_id[OxO95b6[20]]=element[OxO95b6[32]];inp_size[OxO95b6[20]]=element[OxO95b6[36]];CopySelect(element,list_options);CopySelect(element,list_options2);inp_Disabled[OxO95b6[37]]=element[OxO95b6[38]];inp_Multiple[OxO95b6[37]]=element[OxO95b6[39]];if(element[OxO95b6[40]]==0){inp_index[OxO95b6[20]]=OxO95b6[41];} else {inp_index[OxO95b6[20]]=element[OxO95b6[40]];} ;if(element[OxO95b6[42]]){inp_access[OxO95b6[20]]=element[OxO95b6[42]];} ;} ;SyncTo=function SyncTo_Select(element){element[OxO95b6[35]]=inp_name[OxO95b6[20]];if(element[OxO95b6[34]]){element[OxO95b6[34]]=inp_name[OxO95b6[20]];} else {if(element[OxO95b6[35]]){element.removeAttribute(OxO95b6[35],0);element[OxO95b6[34]]=inp_name[OxO95b6[20]];} else {element[OxO95b6[34]]=inp_name[OxO95b6[20]];} ;} ;element[OxO95b6[32]]=inp_id[OxO95b6[20]];element[OxO95b6[36]]=inp_size[OxO95b6[20]];element[OxO95b6[38]]=inp_Disabled[OxO95b6[37]];element[OxO95b6[39]]=inp_Multiple[OxO95b6[37]];element[OxO95b6[42]]=inp_access[OxO95b6[20]];element[OxO95b6[40]]=inp_index[OxO95b6[20]];if(element[OxO95b6[40]]==OxO95b6[41]){element.removeAttribute(OxO95b6[40]);} ;if(element[OxO95b6[42]]==OxO95b6[41]){element.removeAttribute(OxO95b6[42]);} ;CopySelect(list_options,element);} ;