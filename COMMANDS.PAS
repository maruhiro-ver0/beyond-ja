{//-------------------------------------------------------------------------}
{/*                                                                         }
{Copyright (C) 1990, 2009 - Apogee Software, Ltd.                           }
{                                                                           }
{This file is part of Supernova.  Supernova is free software; you can       }
{redistribute it and/or modify it under the terms of the GNU General Public }
{License as published by the Free Software Foundation; either version 2     }
{of the License, or (at your option) any later version.                     }
{                                                                           }
{This program is distributed in the hope that it will be useful,            }
{but WITHOUT ANY WARRANTY; without even the implied warranty of             }
{MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                       }
{                                                                           }
{See the GNU General Public License for more details.                       }
{                                                                           }
{You should have received a copy of the GNU General Public License          }
{along with this program; if not, write to the Free Software                }
{Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.}
{                                                                           }
{Original Source: 1990 Scott Miller                                         }
{Prepared for public release: 03/19/09 - Joe Siegler, Apogee Software, Ltd. }
{*/                                                                         }
{//-------------------------------------------------------------------------}
{****************************************************************************}
{*                                COMMANDS                                  *}
{*                            by Scott Miller                               *}
{*  These are misc procedures and functions used with the main file: AdGame *}
{*                        Copyright 1984 Pending                            *}
{****************************************************************************}

procedure SA;
   begin FlagSA:='s' end;

function En(c : char) : boolean;
   begin
     if(c in Ev)then En:=True else En:=False
   end;

function Here(noun : integer): Boolean;
   begin
     if(noun in Inven)or(r[noun]=Prm)or(noun in p[Prm])then Here:=True
     else Here:=False
   end;

procedure Crazy;
   begin SA;
    if(random(2)=1)then RL(107+random(7))else RL(300+random(6));
   end;

procedure DEAD;
    var b,c:integer;
   begin SA; NoSound;
     gotoxy(1,25);for x:=1 to 7 do writeln;
     Textcolor(1);Textbackground(m9);
     gotoxy(1,18);
     write('*********************************************************',
           '***********************');writeln;
     gotoxy(1,19); for x:=1 to 3 do
     write('*                                                        ',
             '                      *');writeln;
     gotoxy(1,22);
     write('*********************************************************',
           '***********************');writeln;
     TextColor(m0);gotoxy(27,20);writeln('あなたは死んでしまった!!!');
     Textcolor(m2);Textbackground(0);
     for c:=700 downto 20 do for b:=70 downto 1 do sound(b*c);nosound;
     close(Rooms1);close(rooms2);close(special1);close(special2);close(line1);
     gotoxy(1,23);DelLine;DelLine;writeln;write('やり直しますか? ');
     flag := readkey;
     if(upcase(flag)<>'N')then
      begin
       writeln('もう一度…');window(1,1,80,25);
       halt(executeProcess(ParamStr(0), '', []));
      end
     else
      begin
       textcolor(7);
       textbackground(0);
       window(1,1,80,25);
       clrscr;
       writeln('    Beyond the Titanic');
       writeln('A Scott Miller Production');
       writeln('    Have a nice day...');
       delay(2000);
       halt(0);
      end
   end;

procedure Home;
  var b,c:integer;
   begin SA;
     gotoxy(1,25);for x:=1 to 7 do writeln;
     Textcolor(25);Textbackground(m7);
     gotoxy(1,18);
     write('#########################################################',
           '#######################');writeln;
     gotoxy(1,19); for x:=1 to 3 do
     write('#                                                        ',
             '                      #');writeln;
     gotoxy(1,22);
     write('#########################################################',
           '#######################');writeln;
     TextColor(31);gotoxy(25,20);writeln('あ な た は 勝 利 し た ! ! !');
     Textcolor(m2);Textbackground(0);
     gotoxy(1,23);DelLine;DelLine;writeln;
     for x:=150 downto 1 do begin sound(x*55);delay(8);nosound;delay(20)end;
     if(Sc>1000)then Sc:=1000;
     write('あなたはこのゲームで',Sc,'点を獲得し、');
     if(Sc=1000)then
      begin writeln('完璧な冒険者となった!!!');
        for y:=1 to 7 do
         for o:=0 to 20 do
           for x:= 99+(o*430)to 998+(o*430)do begin sound(25);sound(x)end
      end
     else writeln('達人冒険者となった!');
     for c:=1 to 999 do for b:=1 to 61 do sound(b*c);nosound;
     writeln;nosound;
     writeln('コンピュータを再起動してください…')
  end;

procedure Say(o : integer; p : Str16);
   begin
     writeln(m[o,1],'は既に',p,'。'); SA
   end;

procedure Diagnose;
   begin
     RL(191);
     if((tic>42)and not(en('c')))or((tic>146)and not(en('n')))or(en('r'))then
      begin
       if(tic>42)and (not(en('c')))then RL(192)
        else if(tic>146)and not(en('n'))then RL(192);
       if(en('r'))then RL(51)
      end
     else RL(207)
   end;

procedure Monster(var NewRm : integer);
   begin
    if(NewRm=MnRm)and(MnRm=25)then begin Attack:=False;RL(384)end else
    if(NewRm<>35)or not(en('v'))then
     begin
      p[Prm]:=p[Prm]-[23];p[NewRm]:=p[NewRm]+[23];MnRm:=NewRm;Attack:=False;
       if not((NewRm=30)and(Verb in[27,28]))then
        case random(7) of
         0:RS(71);1:RS(72);2:RL(359);3:RL(360);4:RL(361);5:RL(362);6:RL(363)
        end
     end
    else begin RL(383);Attack:=False end
   end;

procedure DescribeRm;
   var o : integer;
  procedure s(r : Str16);
     begin TextColor(m8);writeln(r);TextColor(m2);loc:=r;end;
   begin SA;
if((en('a'))and(here(29)))or not(Prm in [6..24])then begin
     case Prm of
0:s('船の前方');1:s('船の中央');2:s('船の後方');
3:s('救命ボート');4:s('海の上');5:s('広い洞窟');
6:s('棘の洞窟');7:s('海の底');8:s('甲高い音の洞窟');
9:s('川の曲がり角');10:s('滝');13:s('泥だらけの洞窟');
11:s('六角形の洞窟');12:s('浅い谷間');20:s('動物園');
14:s('風の吹くトンネル');15:s('谷間');17:s('谷底');
18:s('狭い入り口');19:s('岩の坂道');
21:s('円盤の端');22:s('円盤の側');
23:s('円盤の上');24:s('エアロック');16:s('ロープの端');
76:s('閉じたキャビン');25:s('中央エントランス');
26:s('下層エントランス');27:s('船の頭脳');
30:s('時の部屋');28:s('研究室');34:s('船橋');
29:s('チューブの中');31:s('医務室');58,69:s('シャトルの中');
32:s('倉庫');33:s('寝室');
35:s('動力室');36:s('1号貨物室');37:s('2号貨物室');
38:s('3号貨物室');39:s('4号貨物室');40:s('大きな檻の中');
41:s('木の橋');42:s('破壊された端');43:s('南の端');
44..46:s('砂だらけの道路');47:s('クレーターの端');48:s('クレーターの中');
49:s('ビルの前');50:s('ロビー');51..54:s('オフィス');
55:s('地下室');56:s('はしごの部屋');57:s('ビルの屋上');
59:case ShRm of 0:s('沼の上空');
1:s('瓦礫の上空');2:s('砂漠の上空');3:s('クレーターの上空');
4:s('川の上空');5:s('小川の上空');6:s('町の上空');
7:s('山の上空');8:s('クレーターの上空');9:s('丘の上空');
10:s('谷の上空');11:s('平地の上空');12:s('干上がった池の上空');
13:s('砂漠の上空');14:s('橋の上空')end;{of Above Rooms}
63,64:s('雲の上');65..68:s('都市の外');70:s('港');
71:s('発電設備');72..74:s('薄暗い通路');75:s('食料庫')
     end; {of case}

    if Verbose then begin FlagSA:='r';
      case Prm of
       2 :if(40 in p[2])then begin RR(2);RL(416)end;
       4 :if(en('B'))then RR(4)else begin RR(4);
           writeln('  安全ベルトが見える。')end;
       11:if(en('C'))then RS(15);
       40:if(en('g'))then RS(17);
       12:if not(en('G'))then begin RR(12);RL(146)end;
       31:if not(en('I'))then begin RR(31);RL(156)end;
       34:if(74 in p[34])then begin RR(34);RL(273)end;
       35:if(77 in p[35])then begin RR(35);RL(381);RL(382)end else
           if(en('W'))then begin RR(35);RL(381)end;
       42:if(13 in p[42])then begin RR(42);RL(214)end;
       48:if(27 in p[48])then begin RR(48);RL(276)end;
       59..69:begin SA;
               if(Prm=59)and not(ShRm in RmSh)then
                begin RmSh:=RmSh+[ShRm];RS(ShRm+46)end
               else if(Prm<>59)then RR(Prm);
               if KeyHole and here(63)then
                writeln('輝く鍵は鍵穴にささっている。')
              end
       else RR(Prm)
      end; {of case}
      if(FlagSA='r')and(Prm<>59)then RR(Prm)end;

     for o:= 0 to NMax do begin
       if(o in Mov)then
         if(r[o]=Prm)then
          if not((Prm in[59..69])and(KeyHole)and(o=63))then
           begin writeln('',m[o,1],'がある。');
            if(ropecon<>Null)and(here(ropecon))and(o=ropecon)and not(ropecon in inven)then
             writeln('  ロープが',m[o,1],'に結び付けられている。');
            if(en('d'))and(o=70)and(here(70))then RL(147);
            if(o=SlotCon)and(here(o))then RL(388);
            if(o in CabiSet)and(here(o))then RL(389);
            if(o=PanelCon)and(here(o))then RL(390);
            if(o in KitSet)and(here(o))then RL(391);
           end
     end end
    else RL(54)
   end;  {of DescribeRm}

procedure SAVE;
   begin SA; for x:=1 to 24 do writeln; nosound;
   window(1,3,80,25);
   gotoxy(1,4);
   if(Drive='A:')then
    writeln('ドライブA:からゲームディスクを抜き、保存ディスクを挿入してください。')else
    writeln('ドライブB:に保存ディスクが挿入されているか確認してください。');
   writeln('  (何かキーを押すと続けます…)');flag:=readkey;
   writeln;writeln;
   write('保存するファイルのファイル名は? ');readln(input);
   while pos(' ',input)>0 do delete(input,pos(' ',input),1);
   while pos('.',input)>0 do delete(input,pos('.',input),1);
   if(input='')then input:='LastRoom';
   writeln;writeln;input:=Drive+input;
   while pos(':',input)>0 do input[pos(':',input)] := '_';
   writeln('保存/復帰するディスクをドライブ',Drive,
            'に挿入されていれば、何かキーを押すと始まります。');
   flag := readkey;
   with DiskSave do
    begin
     aInven:=Inven;aKitSet:=KitSet;aCabiSet:=CabiSet;aPanelCon:=PanelCon;
     aSlotCon:=SlotCon;aCompCon:=CompCon;aRopeCon:=RopeCon;aTic:=Tic;
     aYearDial:=YearDial;aPrm:=Prm;aMnRm:=MnRm;aSc:=Sc;aShots:=Shots;
     aShRm:=ShRm;aRx:=Rx;aEv:=Ev;aCode:=Code;aLoc:=Loc;aKeyHole:=KeyHole;
    end;
   assign(GameSave,input+'.a');
   rewrite(GameSave);
   write(GameSave,DiskSave);
   close(GameSave);
   assign(Objects,input+'.b');
   rewrite(Objects);
   for x:=0 to RMax do write(Objects,p[x]);
   close(Objects);
   assign(WordList,input+'.c');
   rewrite(Wordlist);
   for x:= 0 to NMax do
    for y:= 1 to 5 do
     write(WordList,n[x,y]);
   for x:= 0 to VMax do
    for y:= 1 to 5 do
     write(WordList,v[x,y]);
   close(WordList);
   assign(Things,input+'.d');
   rewrite(Things);
   for x:= 0 to NMax do write(Things,r[x]);
   close(Things);
   writeln; delete(input,1,2);
   writeln('ゲームの状態はファイル''',input,'''に保存されました。');
   if(Drive='A:')then begin writeln;
    writeln('保存ディスクを抜き、ゲームディスクを挿入してください。')end;
   writeln('  (何かキーを押すと続けます…)');flag := readkey;
   writeln;writeln;
   if(Verb<>54)then writeln('ゲームに戻ります…');
   if(Line='')then Line:='look';Tic:=Tic-2;Back:=True;
   if(Prm in[59..68])then sound(20);
   window(1,2,80,25)
   end; {of Save}

procedure RESTORE;
 function Exist:Boolean;
 begin
 assign(GameSave,input+'.a');
 {$I-}
 Reset(GameSave);
 {$I+}
 Exist:=(IOresult=0)
 end;
   begin SA; for x:=1 to 24 do writeln; nosound;
   window(1,3,80,25);gotoxy(1,4);
   if(Drive='A:')then
    writeln('ドライブ',Drive,'からゲームディスクを抜き、保存ディスクを挿入してください。')else
    writeln('ドライブB:に保存ディスクが挿入されているか確認してください。');
   writeln('  (何かキーを押すと続けます…)');flag := readkey;
   writeln;writeln;
   write('復帰するファイルのファイル名は? ');readln(input);
   while pos(' ',input)>0 do delete(input,pos(' ',input),1);
   while pos('.',input)>0 do delete(input,pos('.',input),1);
   if(input='')then input:='LastRoom';
   writeln;writeln;input:=Drive+input;
   while pos(':',input)>0 do input[pos(':',input)] := '_';
   writeln('ドライブ',Drive,'に保存ディスクが挿入されていれば',
           '何かキーを押してください。');
   flag := readkey;
   if Exist then
    begin
     close(GameSave);
     assign(GameSave,input+'.a');
     reset(GameSave);
     read(GameSave,DiskSave);
     close(GameSave);
     with DiskSave do
      begin
       Inven:=aInven;KitSet:=aKitSet;CabiSet:=aCabiSet;PanelCon:=aPanelCon;
       SlotCon:=aSlotCon;CompCon:=aCompCon;RopeCon:=aRopeCon;Tic:=aTic;
       YearDial:=aYearDial;Prm:=aPrm;MnRm:=aMnRm;Sc:=aSc;Shots:=aShots;
       ShRm:=aShRm;Rx:=aRx;Ev:=aEv;Code:=aCode;Loc:=aLoc;KeyHole:=aKeyHole;
      end;
     assign(Objects,input+'.b');
     reset(Objects);
     for x:=0 to RMax do read(Objects,p[x]);
     close(Objects);
     assign(WordList,input+'.c');
     reset(Wordlist);
     for x:= 0 to NMax do
      for y:= 1 to 5 do
       read(WordList,n[x,y]);
     for x:= 0 to VMax do
      for y:= 1 to 5 do
       read(WordList,v[x,y]);
     close(WordList);
     assign(Things,input+'.d');
     reset(Things);
     for x:= 0 to NMax do read(Things,r[x]);
     close(Things);
     writeln; delete(input,1,2);
     writeln('ファイル',input,'に保存された状態に復帰しました。');
     if(Drive='A:')then begin writeln;
      writeln('保存ディスクを抜いてゲームディスクを挿入してください。')end;
     writeln('  (何かキーを押すと続けます…)');flag := readkey;
    end
   else
    begin writeln;TextColor(28);
     writeln('             その名前のファイルは保存ディスクに存在しません。',^g);
     TextColor(m2);writeln;
     if(Drive='A:')then
      writeln('ゲームディスクに戻して何かキーを押してください。')
     else writeln('  (何かキーを押すと続けます…)');
     flag := readkey;
    end;
   writeln;writeln;writeln('ゲームに戻ります…');
   if(Line='')then Line:='look';Tic:=Tic-2;Back:=True;
   if(Prm in[59..68])then sound(20);
   window(1,2,80,25)
   end; {of Restore}

procedure Vanish(o : integer);
   begin SA;
     inven:=inven-[o];
     r[o]:=Null;
     p[Prm]:=p[Prm]-[o];
     if(o=7)and not(en('I'))then Ev:=Ev+['I'];
     if(o=13)and(13 in p[42])then p[42]:=p[42]-[13];
     if(o=PanelCon)then PanelCon:=Null;
     if(o=SlotCon)then SlotCon:=Null;
     if(o in CabiSet)then CabiSet:=CabiSet-[o];
     if(o in kitset)then kitset:=kitset-[o];
     if(o=63)and KeyHole then KeyHole:=False;
     if(o=74)then Ev:=Ev-['p'];
     if(o=89)then Ev:=Ev-['i'];
     if(o=RopeCon)and(verb=36)then begin RopeCon:=Null;RL(402)end;
     if(o=RopeCon)and not(Verb in[9,14])then RopeCon:=Null
   end;

procedure Play( Start, Stop, Wait: integer);
   var x : integer;
   begin
    if(Start<=Stop)then
     for x:= Start to Stop do
      begin sound(x); delay(Wait); end
    else
     for x:= Start downto Stop do
      begin sound(x); delay(Wait); end;
    if(Prm in[59..68])then sound(20)else nosound
   end; {of Play}

procedure DropAll;
   var o : integer;
   begin
     for o:= 0 to NMax do
       if(o in inven)then
         begin
           r[o]:=Prm;
           inven:=inven-[o];writeln(m[o,1],': 置いた。');
         end;
     RL(106);
   end;  {of DropAll}

function FlasOff : Boolean;
   begin
     if not(En('a'))then FlasOff:=True
     else
       if(r[29]=Prm)or(29 in inven)then FlasOff:=False
       else FlasOff:=True;
   end;

procedure MoveTo(NewRm : integer);
 var o : integer;
 begin
   if(57 in inven)and(ropecon<>Null)and not(ropecon in inven)
     and(ropecon in mov)and not(ropecon=70)then
      begin r[ropecon]:=Prm;RL(158);end
   else if(57 in inven)and(ropecon<>Null)and(not(ropecon in mov)or
        ((ropecon=70)and(en('d'))))then
          begin RL(55);inven:=inven-[57];r[57]:=Prm;end
   else if not(57 in inven)and((ropecon in inven)or
          (ropecon in[60,56,44]))then r[57]:=NewRm
   else if not(57 in inven)and(r[57]=Prm)and(ropecon<>Null)and(r[ropecon]=NewRm)then
          begin r[57]:=NewRm;RopeOld:=Prm;end
   else if not(57 in inven)and(r[57]=Prm)and(NewRm=RopeOld)and(ropecon<>Null)and
              (r[ropecon]=Prm)then
          begin r[57]:=RopeOld;RopeOld:=Null;end;
   if(ropecon=Null)or((NewRm<>RopeOld)and(Prm<>RopeOld))then RopeOld:=Null;
   if(MnRm<>Null)then Monster(NewRm);
   if(Prm in[63..68])and not(NewRm in[59,69])then RL(343);
   if(Prm in[59,63..68])then for o:=0 to NMax do if(r[o]=Prm)then r[o]:=NewRm;
   Prm:=NewRm;
   DescribeRm
 end;  {of MoveTo}

procedure Time;
   begin
     Tic:=Tic+1;
  case Tic of
    3:RL(280);
    4:RS(1);
    17:if not(en('A'))then begin RS(3);DEAD end else RS(5);
    19:RL(4);
    20:RL(5);
    21:RL(6);
    23:RS(6);
    24:if(en('B'))then begin RS(8);writeln;RL(16);moveto(5);Sc:=Sc+25;
         n[64,5]:='ship';v[26,2]:='pick' end
       else begin RS(7);DEAD;end;
    43:if(not(en('c'))and not(en('n')))then RL(31);
    73:if(not(en('c'))and not(en('n')))then RL(32);
    93:if(not(en('c'))and not(en('n')))then begin RL(33); DEAD end;
    99:if(Prm in[6..24])and(here(29))and not(flasoff)and(not(en('s')))then
         begin RL(41);Ev:=Ev+['s'] end;
    147:if not(en('n'))then RL(31);
    149:if(here(29))and not(flasoff)then RL(59);
    153:if(Prm in[6..23])and(here(29))and not(flasoff)then
          begin RS(14);vanish(29) end;
    170:if not(en('n'))then RL(32);
    181:if not(en('n'))then begin RL(33); DEAD end;
    549:RL(281);
    586:RL(282);
    598:RL(283);
    607:begin RL(284);DEAD;end;
  end; {of case}

case Prm of
    1..3:if(tic>4)and(random(4)=1)then RL(405);
  36..39:if(random(5)=2)then RL(219);
     7  :if(random(8)=2)then RL(266);
     8  :if(random(3)=2)then begin RL(265);play(6666,7000,0);end;
  13..24:if(random(16)=2)then RL(246);
  25..35:if(random(30)=2)then RL(267);
   47,48:if(random(5)=2)and(inven <>[])then
           begin
            if(Prm=48)then begin writeln;RS(40)end
            else begin writeln;RS(44);moveto(48)end;
            o:=1;flag:='?';
            repeat o:=o+1;
             if(o in inven)then
             begin vanish(o);r[o]:=random(9)+41;flag:='g';end;
            until Flag = 'g';
           end;
end;
case Prm of
  5,6,9,10:if(random(9)=2)then RL(268);
  7,8,11..40:if(here(84))and(random(20)=2)then RL(269)
        else if(random(75)=2)then RS(36)
        else if(Prm in[5..22])and(random(33)=2)then
         begin RL(265);play(6500,6950,0)end;
  41..49:if(random(27)=2)then RL(285);
    59  :if(random(15)=1)then RL(406);
end;
if Attack and(MnRm=Prm)and(not Back)then
 begin case random(3) of 0:RS(80); 1:RS(81); 2:RS(82)end;DEAD end
else if(MnRm=Prm)then Attack:=True
   end;  {of Time}

function Present : Boolean;
   begin
    if(noun<>Null)and(noun<>1)then
     if(here(noun))then
      if(noun2<>Null)then
       if(here(noun2))then Present:=true
       else begin
         writeln(m[noun2,1],'は見当たらない。');Present:=false end
      else Present:=true
     else begin
       writeln(m[noun,1],'は見当たらない。');Present:=false end
    else Present:=true
   end;

procedure Initialize;
 procedure Cn(S : Str80);
 begin
  gotoxy(40-(length(S)div 2),wherey);writeln(S);
 end;
  begin
   textcolor(15);
   writeln('冒険の世界へ飛び込む準備をしてください。');
   writeln('でも、その前に簡単な質問が2つあります:');
   gotoxy(1,4);write('ディスプレイはカラーですか (Y/N)? ');
   nosound; play(72,80,45);
   flag := readkey; play(2500,2490,6);
   m0:=20;m1:=14;m2:=11;m3:=4;m4:=15;m5:=28;m6:=1;m7:=4;m8:=10;m9:=10;
   if upcase(flag)='N' then
    begin
     writeln('いいえ。カラーではありません。');
     m0:=31;m1:=15;m2:=15;m3:=7;m4:=0;m5:=31;m6:=7;m7:=8;m8:=7;m9:=0;
    end else writeln('はい。カラーです。');writeln;
   write('ディスクドライブはいくつありますか (1/2)? ');
   play(80,88,30);
   flag := readkey; play(2500,2490,6);
   Drive:='B:';
   if(upcase(flag)='O')or(flag='1')then
    begin Drive:='A:';writeln('1つです。')end else
    writeln('2つです。');
   delay(999);clrscr;textcolor(15);gotoxy(1,4);writeln;textcolor(7);
   cn('Beyond the Titanic');cn('タイタニックを越えて');textcolor(6);cn('------------------');writeln;
   textcolor(7);
   cn('A Text & Sound Adventure Fantasy');writeln;writeln;
   cn('An Apogee Software Production');writeln;writeln;writeln;
   cn('Written and Programmed by Scott Miller');
   textcolor(11);
   gotoxy(32,24);textcolor(7);
   write('キーを押してください');flag := readkey;clrscr;

   {                      *** SHAREWARE SCREEN ***                            }

   textcolor(15);
   writeln;
   writeln('Beyond the Titanicはシェアウェアです。');
   writeln;
   textcolor(7);
   writeln('このゲームはGPL2オープンソースソフトウェアになりました。');
   writeln;writeln;
   writeln('もしこのゲームを楽しんだならば、作者(Scott Miller)に$5か$10をお支払いください。');
   writeln('このわずかな料金は作者のBeyond the Titanicの制作への対価となります。さらに最近');
   writeln('発表されたシェアウェアのSupernovaやKingdom of Krozのような新作にもつながります。');
   writeln;
   writeln('また、この料金は電話サポート係への賃金にもなります。');
   writeln;writeln;writeln;
   writeln('支払先はScott Millerでお願いします。');
   writeln;
   textcolor(15);
   writeln('        Scott Miller           (214) 240-0614');
   writeln('        4206 Mayflower Dr.');
   writeln('        Garland, TX  75043');
   writeln;
   textcolor(7);
   writeln('ありがとうございました。ゲームをお楽しみください…');
   gotoxy(23,25);
   delay(3000);
   while keypressed do readkey;
   write('キーを押すとゲームが始まります');
   readkey;
   while keypressed do readkey;
   clrscr;
   {                      ************************                            }
   Window(1,2,80,25);
   gotoxy(1,24);
   TextColor(m1);
cn('1912年4月14日     午後11時43分');
cn('');
cn('闇夜のカンバスがこれほど輝いていたとは。');
cn('ホワイトスターの最新の豪華客船、深い海、');
cn('サンフランシスコのまばゆい光も届かないこの場所で');
cn('あなたは幾千もの知られざる星々を見ていた。');
cn('');
cn('海に目をやると小さな氷の破片が漂っていた。');
cn('このあたりには小さな山ほどの氷山が現れるとうわさだ。');
cn('');
cn('だが心配することはない。タイタニック号は「不沈」、');
cn('一流の海運会社ホワイトスターとその船のことは乗客の誰もが信頼していた…');
for x:= 1 to 3 do writeln;
Line        :='';
LastNoun    :='';
KitSet      :=[2,29,57];
CabiSet     :=[89,63];
CompCon     :=Null;
PanelCon    :=8;
RopeCon     :=Null;
SlotCon     :=Null;
RopeOld     :=Null;
RmSh        :=[];
Mov         :=[2,7,8,13,27,29,32,34,40,52,51,57,63,70,74,77,89];
OneWordCommands:=[1,4,5,7,8,16,18,19,22,31,33..35,41,43..54,56..59,61..65];
Ev          :=[];
Inven       :=[];
Prm         :=0;
MnRm        :=Null;
Tic         :=Prm;
Sc          :=0;
Shots       :=6;
KeyHole     :=false;
Verbose     :=true;
Attack      :=False;
YearDial    :=135;
DayDial     :=60;
assign(rooms1,'ROOMS1');assign(rooms2,'ROOMS2');
assign(special1,'SPECIAL1');assign(special2,'SPECIAL2');assign(line1,'LINE');
reset(rooms1);reset(rooms2);reset(special1);reset(special2);reset(line1);
Str(Random(9998)+1,Code);
   DescribeRm; writeln; randomize;
   Window(1,1,80,25);
   gotoxy(1,1);TextBackGround(m6);
   for x:=1 to 80 do write(' ');writeln;TextColor(m4);
   gotoxy(4,1);writeln('Move');gotoxy(68,1);writeln('Score');TextColor(m2);
   TextBackGround(0); Window(1,2,80,25);
  end; {of Initialize}
{***************************** END OF COMMANDS *****************************}
