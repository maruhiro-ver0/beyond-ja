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
{*****************************************************************************}
{*                                 WORDLIST                                  *}
{*                             by Scott Miller                               *}
{* These are all of the verbs and nouns (grouped in synonyms) used by AdGame.*}
{*                          Copyright 1984 Pending                           *}
{*****************************************************************************}

{====================================START====================================}

                       {VERB LIST:  GROUPS ALL SYNONYMS}
procedure Assign1;
begin
for x:= 0 to VMax do for y:= 1 to 5 do v[x,y]:=Q;
v[0,1]:='attack'; v[0,2]:='kill';v[0,3]:='beat up';
d[0,1]:='を攻撃';d[0,2]:='を殺';d[0,3]:='を倒';
prep[0]:='with';
v[1,1]:='descrip';v[1,2]:='rd';v[1,3]:='r d';
d[1,1]:='記述';
v[2,1]:='climb';v[2,2]:='climb on';v[2,3]:='climb onto';v[2,4]:='climb in';
   v[2,5]:='climb over';
d[2,1]:='に登';
v[3,1]:='close';v[3,2]:='shut';v[3,3]:='fasten';v[3,4]:='connect';
   v[3,5]:='hook';
d[3,1]:='閉';
v[4,1]:='crawl ne';v[4,2]:='duck ne';v[4,3]:='crawl northea';
   v[4,4]:='climb ne';
d[4,1]:='北東に這';d[4,2]:='北東には';d[4,3]:='北東を潜';d[4,4]:='北東を潜';
v[5,1]:='crawl sw';v[5,2]:='duck sw';v[5,3]:='crawl southwe';
   v[5,4]:='climb sw';
d[5,1]:='南西に這';d[5,2]:='南西には';d[5,3]:='南西を潜';d[5,4]:='南西をく';
v[6,1]:='cut';v[6,2]:='slice';v[6,3]:='cut out';v[6,4]:='saw';
   v[6,5]:='chop';
d[6,1]:='切';
v[7,1]:='dig';v[7,2]:='dig in';v[7,3]:='shovel';
v[7,1]:='掘';
v[8,1]:='drink';v[8,2]:='drink from';v[8,3]:='drink some';
   v[8,4]:='drink lot';
v[9,1]:='drop';v[9,2]:='get rid';v[9,3]:='put down';
d[9,1]:='置';d[9,2]:='捨';d[9,3]:='落';d[9,4]:='入れ';d[9,5]:='垂';
prep[9]:='into';
v[10,1]:='eat';v[10,2]:='swallow';
d[10,1]:='食';d[10,2]:='飲';
v[11,1]:='examine';v[11,2]:='ex';v[11,3]:='search';
   v[11,4]:='read';v[11,5]:='look at';
d[11,1]:='調';d[11,2]:='を見';d[11,3]:='読';
v[12,1]:='find';v[12,2]:='look for';v[12,3]:='where is';v[12,4]:='check';
   v[12,5]:='chech for';
d[12,1]:='探';
v[13,1]:='repair';v[13,2]:='fix';
d[13,1]:='直';d[13,2]:='修理';
v[14,1]:='get';v[14,2]:='take';v[14,3]:='grab';v[14,4]:='steal';
   v[14,5]:='pick up';
d[14,1]:='取';d[14,2]:='拾';
v[15,1]:='give';v[15,2]:='offer';v[15,3]:='show';v[15,4]:='pay';
   v[15,5]:='give away';
d[15,1]:='に与';d[15,2]:='に渡';
prep[15]:='to';
end;
procedure Assign2;
begin
v[16,1]:='help';v[16,2]:='pray';
d[16,1]:='ヘルプ';d[16,2]:='祈';
v[17,1]:='hit';v[17,2]:='punch';v[17,3]:='knock';v[17,4]:='break';
   v[17,5]:='destroy';
d[17,1]:='叩';d[17,2]:='殴';d[17,3]:='壊';d[17,4]:='割';
v[18,1]:='invento';v[18,2]:='i';
d[18,1]:='持ち物';
v[19,1]:='jump';v[19,2]:='jump onto';v[19,3]:='jump on';v[19,4]:='jump off';
   v[19,5]:='jump in';
d[19,1]:='ジャンプ';d[19,2]:='飛';d[19,3]:='跳';
v[20,1]:='launch';v[20,2]:='sail';v[20,3]:='row';
d[20,1]:='漕';d[20,2]:='発進';d[20,3]:='出発';
v[22,1]:='look';v[22,2]:='l';v[22,3]:='look around';v[22,4]:='ex area';
d[22,1]:='見';d[22,2]:='辺りを見';d[22,2]:='周りを見';
v[23,1]:='look above';v[23,2]:='ex on';v[23,3]:='look on';
   v[23,4]:='ex top';v[23,5]:='ex above';
d[23,1]:='の上を見';
v[24,1]:='look in';v[24,2]:='ex in';v[24,3]:='look down';v[24,4]:='look up';
   v[24,5]:='search in ';
d[24,1]:='の中を見';d[24,2]:='覗';
v[25,1]:='look under';v[25,2]:='ex underne';v[25,3]:='ex under';
   v[25,4]:='look underne';v[25,5]:='ex below';
d[25,1]:='の下を見';
v[21,1]:='burn';v[21,2]:='ignite';v[21,3]:='light';
d[21,1]:='燃';
v[26,1]:='open';v[26,2]:='unfaste';v[26,3]:='peel';v[26,4]:='hatch';
   v[26,5]:='untie';
d[26,1]:='開';d[26,2]:='解';d[26,3]:='剥';d[26,4]:='の皮を剥';
v[27,1]:='pull';v[27,2]:='flick';v[27,3]:='pull on';v[27,4]:='flip';
   v[27,5]:='flip on';
d[27,1]:='引';
v[28,1]:='push';v[28,2]:='move';v[28,3]:='press';v[28,4]:='turn on';
   v[28,5]:='turn off';
d[28,1]:='押';d[28,2]:='点';d[28,3]:='消';d[28,4]:='動';d[28,5]:='つけ';
v[29,1]:='put';v[29,2]:='pour';v[29,3]:='lay';v[29,4]:='fill';
   v[29,5]:='insert';
d[29,1]:='を入';d[29,2]:='挿';d[29,3]:='刺';d[29,4]:='差';d[29,5]:='立て';
prep[29]:='into';
v[30,1]:='reach';v[30,2]:='reach in';v[30,3]:='feel in';
d[30,2]:='の中身を取';
v[31,1]:='say';v[31,2]:='yell';v[31,3]:='shout';v[31,4]:='compute';
   v[31,5]:='think';
d[31,1]:='と言';d[31,2]:='言';d[31,3]:='叫';d[31,4]:='話';d[31,5]:='しゃべる';
end;
procedure Assign3;
begin
v[32,1]:='shoot';v[32,2]:='blast';v[32,3]:='fire at';v[32,4]:='fire';
   v[32,5]:='shoot at';
d[32,1]:='撃';
v[33,1]:='sit';v[33,2]:='sit in';v[33,3]:='get in';v[33,4]:='sit down';
   v[33,5]:='sit on';
d[33,1]:='座';
prep[33]:='on';
v[34,1]:='sleep';v[34,2]:='lie down';v[34,3]:='sleep on';v[34,4]:='sleep in';
d[34,1]:='眠';d[34,2]:='寝';
v[35,1]:='stand';v[35,2]:='stand up';v[35,3]:='get up';v[35,4]:='stand in';
d[35,1]:='立';d[35,2]:='起';
v[36,1]:='throw';v[36,2]:='toss';
d[36,1]:='投';d[36,2]:='当';
prep[36]:='to';
v[37,1]:='tie';v[37,2]:='hook';v[37,3]:='wrap';
d[37,1]:='結';d[37,2]:='巻';
prep[37]:='to';
v[38,1]:='touch';v[38,2]:='feel';v[38,3]:='touch in';v[38,4]:='rub';
d[38,1]:='触';d[38,2]:='擦';
v[39,1]:='turn';v[39,2]:='rotate';v[39,3]:='set';
d[39,1]:='合';d[39,2]:='回';d[39,3]:='セット';d[39,4]:='する';
prep[39]:='to';
v[40,1]:='unlock';
d[40,1]:='鍵を開';d[40,2]:='鍵を外';d[40,3]:='解錠';
v[41,1]:='wait';v[41,2]:='z';v[41,3]:='rest';
d[41,1]:='待';
v[42,1]:='wear';v[42,2]:='put on';
d[42,1]:='着';d[42,2]:='被';d[42,3]:='締';d[42,4]:='付';d[42,5]:='装備';
v[43,1]:='north';v[43,2]:='n';v[43,3]:='fore';v[43,4]:='f';v[43,5]:='across';
d[43,1]:='北';d[43,2]:='進';d[43,3]:='前';d[43,4]:='渡';
v[44,1]:='south';v[44,2]:='s';v[44,3]:='aft';v[44,4]:='a';
d[44,1]:='南';d[44,2]:='戻';d[44,3]:='後';
v[45,1]:='east';v[45,2]:='e';v[45,3]:='starboa';v[45,4]:='st';
d[45,1]:='東';d[45,2]:='右';
v[46,1]:='west';v[46,2]:='w';v[46,3]:='port';v[46,4]:='p';
d[46,1]:='西';d[46,2]:='左';
v[47,1]:='north east';v[47,2]:='ne';v[47,3]:='northea';
d[47,1]:='北東';d[47,2]:='東北';
v[48,1]:='north west';v[48,2]:='nw';v[48,3]:='northwe';
d[48,1]:='北西';d[48,2]:='西北';
v[49,1]:='south east';v[49,2]:='se';v[49,3]:='southea';
d[49,1]:='南東';d[49,2]:='東南';
v[50,1]:='south west';v[50,2]:='sw';v[50,3]:='southwe';
d[50,1]:='南西';d[50,2]:='西南';
v[51,1]:='up';v[51,2]:='u';v[51,3]:='climb up';v[51,4]:='climb u';
d[51,1]:='上';d[51,2]:='登';
v[52,1]:='down';v[52,2]:='d';v[52,3]:='climb down';v[52,4]:='climb d';
   v[52,5]:='lower';
d[52,1]:='下';d[52,2]:='降';
v[53,1]:='type';v[53,2]:='type in';
prep[53]:='on';
d[53,1]:='打';d[53,2]:='タイプ';d[53,3]:='を入力';d[53,4]:='と入力';
v[54,1]:='quit';v[54,2]:='stop';v[54,3]:='give up';v[54,4]:='i quit';
d[54,1]:='終了';
v[55,1]:='take off';v[55,2]:='remove';
d[55,1]:='脱';d[55,2]:='外';
v[56,1]:='shake';v[56,2]:='bogie';v[56,3]:='dance';
d[56,1]:='振';d[56,2]:='踊';
end;
procedure Assign4;
begin
v[57,1]:='enter';v[57,2]:='in';v[57,3]:='land in';v[57,4]:='land on';
   v[57,5]:='land';
d[57,1]:='入';d[57,2]:='乗';d[57,3]:='着地';d[57,4]:='着陸';
v[58,1]:='exit';v[58,2]:='out';v[58,3]:='leave';v[58,4]:='retreat';
   v[58,5]:='escape';
d[58,1]:='出';d[58,2]:='脱出';
v[59,1]:='diagnos';
d[59,1]:='状態';
v[60,1]:='look behind';v[60,2]:='ex behind';v[60,3]:='examine behind';
   v[60,4]:='ex beside';v[60,5]:='look beside';
d[60,1]:='後ろを見';d[60,2]:='後を見';
v[61,1]:='restart';v[61,2]:='let';v[61,3]:='fall from';v[61,4]:='drop from';
   v[61,5]:='fall';
d[61,1]:='やり直す';d[61,1]:='やりなおす';
v[62,1]:='score';v[62,2]:='rank';
d[62,1]:='得点';
v[63,1]:='creatur';v[63,2]:='alien monster';v[63,3]:='monster';
   v[63,4]:='alien creatur';
v[64,1]:='save';
d[64,1]:='保存';
v[65,1]:='restore';v[65,2]:='resume';
d[65,1]:='復帰';

                     {NOUN LIST:  GROUPS ALL OBJECTS}

for x:= 0 to NMax do for y:= 1 to 5 do n[x,y]:=Q;
n[0,1]:='alien';n[0,2]:='dead alien';n[0,3]:='body';n[0,4]:='alien body';
m[0,1]:='エイリアン';
n[1,1]:='all';n[1,2]:='everyth';n[1,3]:='object';n[1,4]:='objects';
m[1,1]:='全';m[1,2]:='すべて';m[1,3]:='何';
n[2,1]:='banana';n[2,2]:='food';
m[2,1]:='バナナ';
n[3,1]:='bat';n[3,2]:='bats';
m[3,1]:='コウモリ';m[3,2]:='こうもり';m[3,3]:='蝙蝠';m[3,4]:='足跡';
n[4,1]:='bed';n[4,2]:='bunk';n[4,3]:='beds';n[4,4]:='bunks';
m[4,1]:='ベッド';
n[5,1]:='blue button';n[5,2]:='blue';
m[5,1]:='青いボタン';
n[6,1]:='boat';n[6,2]:='life boat';n[6,3]:='titanic';n[6,4]:='lifeboa';
   n[6,5]:='ship';
m[6,1]:='船';m[6,2]:='ボート';m[6,3]:='タイタニック';
end;
procedure Assign5;
begin
n[7,1]:='bottle';n[7,2]:='brown bottle';n[7,3]:='brown';
m[7,1]:='茶色のビン';m[7,2]:='ビン';
n[8,1]:='black box';n[8,2]:='box';n[8,3]:='black';n[8,4]:='switch';
   n[8,5]:='box switch';
m[8,1]:='黒い箱';m[8,2]:='箱';m[8,3]:='スイッチ';
n[9,1]:='building';n[9,2]:='buildin';n[9,3]:='tower';n[9,4]:='towers';
m[9,1]:='ビル';m[9,2]:='建物';
n[10,1]:='button';n[10,2]:='buttons';
m[10,1]:='ボタン';
n[11,1]:='cabinet';n[11,2]:='file';n[11,3]:='blue cabinet';
m[11,1]:='キャビネット';
n[12,1]:='cages';n[12,2]:='bars';
m[12,1]:='金属の檻';
n[13,1]:='coin';n[13,2]:='quarter';n[13,3]:='25';n[13,4]:='money';
m[13,1]:='コイン';
n[14,1]:='containers';n[14,2]:='crate';n[14,3]:='crates';n[14,4]:='cargo';
   n[14,5]:='contain';
m[14,1]:='コンテナ';m[14,2]:='荷物';m[14,3]:='貨物';m[14,4]:='積荷';
n[15,1]:='ceiling';n[15,2]:='roof';
m[15,1]:='天井';m[15,2]:='空';
n[16,1]:='chair';n[16,2]:='time chair';n[16,3]:='time';n[16,4]:='seat';
   n[16,5]:='metal chair';
m[16,1]:='金属の椅子';m[16,2]:='椅子';m[16,3]:='いす';m[16,4]:='イス';
n[17,1]:='chasm';n[17,2]:='canyon';
m[17,1]:='谷';m[17,2]:='穴';
n[18,1]:='city';n[18,2]:='floatin city';n[18,3]:='floatin';n[18,4]:='town';
m[18,1]:='都市';m[18,2]:='町';m[18,3]:='構造物';
n[19,1]:='clouds';n[19,2]:='cloud';
m[19,1]:='雲';
n[20,1]:='computer';n[20,2]:='termina';n[20,3]:='compute';n[20,4]:='typewri';
m[20,1]:='タイプライター';
n[21,1]:='controls';n[21,2]:='machine';n[21,3]:='equipme';n[21,4]:='devices';
   n[21,5]:='control';
m[21,1]:='操作盤';m[21,2]:='機械';m[21,3]:='設備';m[21,4]:='装置';
n[22,1]:='crater';n[22,2]:='pit';n[22,3]:='stove';
m[22,1]:='クレーター';m[22,2]:='ストーブ';
n[23,1]:='creature';n[23,2]:='creatur';n[23,3]:='monster';
   n[23,4]:='alien creatur';n[23,5]:='it';
m[23,1]:='怪物';
n[24,1]:='silver dial';n[24,2]:='day dial';n[24,3]:='day';n[24,4]:='silver';
m[24,1]:='銀のダイヤル';m[24,2]:='銀';m[24,3]:='日';
n[25,1]:='dial';n[25,2]:='knob';n[25,3]:='dials';n[25,4]:='knobs';
m[25,1]:='ダイヤル';
n[26,1]:='door';n[26,2]:='hatch';n[26,3]:='saucer hatch';n[26,4]:='ship door';
   n[26,5]:='sliding';
m[26,1]:='扉';m[26,2]:='ドア';m[26,3]:='ハッチ';
n[27,1]:='piece of wire';n[27,2]:='wire';n[27,3]:='mangled wire';
   n[27,4]:='mangled';n[27,5]:='piece wire';
m[27,1]:='針金';
n[28,1]:='egg';n[28,2]:='eggs';
m[28,1]:='卵';
n[29,1]:='flashlight';n[29,2]:='light';n[29,3]:='flashli';n[29,4]:='hook';
   n[29,5]:='ring';
m[29,1]:='懐中電灯';m[29,2]:='電灯';m[29,3]:='ライト';m[29,4]:='明かり';
end;
procedure Assign6;
begin
n[30,1]:='ground';n[30,2]:='floor';n[30,3]:='earth';n[30,4]:='deck';
   n[30,5]:='bay';
m[30,1]:='地面';m[30,2]:='床';m[30,3]:='地上';m[30,4]:='デッキ';m[30,5]:='港';
n[31,1]:='trees';n[31,2]:='tree';n[31,3]:='forest';
m[31,1]:='木';
n[32,1]:='piece of fur';n[32,2]:='fur';n[32,3]:='piece fur';n[32,4]:='piece';
   n[32,5]:='blue fur';
m[32,1]:='青い毛皮';m[32,2]:='毛皮';
n[33,1]:='green button';n[33,2]:='green';
m[33,1]:='緑のボタン';
n[34,1]:='gun';n[34,2]:='ray gun';n[34,3]:='gauge';n[34,4]:='orange';
   n[34,5]:='laser gun';
m[34,1]:='銃';
n[35,1]:='safety harness';n[35,2]:='safety';n[35,3]:='belt';
   n[35,4]:='harness';n[35,5]:='strap';
m[35,1]:='安全ベルト';m[35,2]:='ベルト';m[35,3]:='岩';
n[36,1]:='ice';n[36,2]:='ocean bottom';n[36,3]:='bottom';n[36,4]:='ocean';
m[36,1]:='氷';m[36,2]:='海';m[36,3]:='レバー';
n[37,1]:='debris';n[37,2]:='trash';n[37,3]:='rubble';n[37,4]:='wood';
m[37,1]:='瓦礫';m[37,2]:='がれき';m[37,3]:='ごみ';m[37,4]:='ゴミ';m[37,5]:='破片';
n[38,1]:='numeric keypad';n[38,2]:='keypad';n[38,3]:='numeric';
   n[38,4]:='numbers';
m[38,1]:='キーボード';
n[39,1]:='survival kit';n[39,2]:='kit';n[39,3]:='surviva';n[39,4]:='red kit';
   n[39,5]:='surviva kit';
m[39,1]:='小箱';m[39,2]:='キット';
n[40,1]:='knife';n[40,2]:='blade';
m[40,1]:='ナイフ';
n[41,1]:='concrete';n[41,2]:='concrete wall';n[43,3]:='cement';n[41,4]:='pad';
   n[41,5]:='landing pad';
m[41,1]:='コンクリート';
n[42,1]:='dirt';n[42,2]:='dust';n[42,3]:='desert';n[42,4]:='sand';
   n[42,5]:='landing bay';
m[42,1]:='沼';m[42,2]:='砂';
n[43,1]:='cage';n[43,2]:='large';n[43,3]:='large cage';
m[43,1]:='檻';
n[44,1]:='left hand';n[44,2]:='left';n[44,3]:='hand';
m[44,1]:='左手';m[44,2]:='手';
n[45,1]:='rusty lock';n[45,2]:='lock';n[45,3]:='rusty';
m[45,1]:='錠前';
n[46,1]:='message';n[46,2]:='chisele';n[46,3]:='writing';n[46,4]:='marking';
   n[46,5]:='chisele marking';
m[46,1]:='文字';
n[47,1]:='mud';n[47,2]:='sloppy';n[47,3]:='slop';
m[47,1]:='泥';
n[48,1]:='chain';n[48,2]:='thick chain';n[48,3]:='metal chain';
m[48,1]:='鎖';
n[49,1]:='panel';n[49,2]:='compart';
m[49,1]:='パネル';
n[50,1]:='path';n[50,2]:='passage';n[50,3]:='tunnel';n[50,4]:='road';
   n[50,5]:='tubes';
m[50,1]:='道';
n[51,1]:='banana peel';n[51,2]:='peel';n[51,3]:='skin';
m[51,1]:='皮';
n[52,1]:='glowing pill';n[52,2]:='pill';n[52,3]:='glowing';
m[52,1]:='光る薬';m[52,2]:='薬';
n[53,1]:='rail';n[53,2]:='railing';n[53,3]:='wooden';n[53,4]:='wooden rail';
m[53,1]:='手すり';
n[54,1]:='reactor';n[54,2]:='core';
m[54,1]:='炉';m[54,2]:='動力';
n[55,1]:='red button';n[55,2]:='red';n[55,3]:='lower door';n[55,4]:='mangled';
   n[55,5]:='mangled door';
m[55,1]:='赤いボタン';
n[56,1]:='right arm';n[56,2]:='right';n[56,3]:='arm';n[56,4]:='arms';
m[56,1]:='右腕';m[56,2]:='腕';
end;
procedure Assign7;
begin
n[57,1]:='rope';n[57,2]:='thick';n[57,3]:='thick rope';
m[57,1]:='ロープ';m[57,2]:='パラシュート';
n[58,1]:='screen';n[58,2]:='monitor';n[58,3]:='tv';n[58,4]:='screens';
m[58,1]:='スクリーン';m[58,2]:='画面';
n[59,1]:='bench';n[59,2]:='chairs';n[59,3]:='seats';n[59,4]:='benches';
   n[59,5]:='metalli';
m[59,1]:='ベンチ';
n[60,1]:='player';n[60,2]:='self';n[60,3]:='waist';n[60,4]:='me';
   n[60,5]:='myself';
m[60,1]:='プレイヤー';m[60,2]:='自分';
n[61,1]:='shelf';n[61,2]:='shelves';
m[61,1]:='棚';
n[62,1]:='reactor shield';n[62,2]:='barrier';n[62,3]:='shield';
   n[62,4]:='plate';n[62,5]:='radiati shield';
m[62,1]:='プレート';m[62,2]:='シールド';
n[63,1]:='shiny key';n[63,2]:='shiny';n[63,3]:='key';
m[63,1]:='輝く鍵';m[63,2]:='鍵';m[63,3]:='キー';
n[64,1]:='alien saucer';n[64,2]:='alien ship';n[64,3]:='hull';
   n[64,4]:='saucer';
m[64,1]:='円盤';
n[65,1]:='shuttle';n[65,2]:='car';n[65,3]:='vehicle';n[65,4]:='engine';
m[65,1]:='シャトル';m[65,2]:='乗り物';
n[66,1]:='sign';n[66,2]:='note';n[66,3]:='red sign';
m[66,1]:='看板';m[66,2]:='サイン';
n[67,1]:='bones';n[67,2]:='bone';n[67,3]:='skeleto';n[67,4]:='animals';
   n[67,5]:='remains';
m[67,1]:='死骸';m[67,2]:='骨';m[67,3]:='動物';
n[68,1]:='slot';n[68,2]:='opening';n[68,3]:='hole';n[68,4]:='key hole';
   n[68,5]:='keyhole';
m[68,1]:='鍵穴';m[68,2]:='スロット';
n[69,1]:='steps';n[69,2]:='stair';n[69,3]:='stairs';n[69,4]:='ladder';
   n[69,5]:='step';
m[69,1]:='階段';m[69,2]:='はしご';m[69,3]:='梯子';m[69,4]:='坂道';
n[70,1]:='metal stake';n[70,2]:='stake';n[70,3]:='metal';n[70,4]:='pole';
   n[70,5]:='rod';
m[70,1]:='金属の棒';m[70,2]:='棒';m[70,3]:='人影';m[70,4]:='ミュータント';
n[71,1]:='rock feature';n[71,2]:='stalagt';
m[71,1]:='鍾乳石';
n[72,1]:='strange wall';n[72,2]:='strange';n[72,3]:='hexagon';
   n[72,4]:='shapes';
m[72,1]:='障害物';m[72,2]:='六角形';m[72,3]:='フェンス';
end;
procedure Assign8;
begin
n[73,1]:='water';n[73,2]:='river';n[73,3]:='stream';n[73,4]:='gusher';
   n[73,5]:='lake';
m[73,1]:='水';m[73,2]:='川';
n[74,1]:='alien suit';n[74,2]:='suit';n[74,3]:='space suit';
   n[74,4]:='uniform';
m[74,1]:='スーツ';
n[75,1]:='table';n[75,2]:='tables';
m[75,1]:='テーブル';
n[76,1]:='tan button';n[76,2]:='tan';
m[76,1]:='黄色のボタン';
n[77,1]:='tape';n[77,2]:='future';n[77,3]:='future tape';
m[77,1]:='テープ';
n[78,1]:='healing tube';n[78,2]:='tube';n[78,3]:='healing';
   n[78,4]:='glass tube';n[78,5]:='glass';
m[78,1]:='チューブ';
n[79,1]:='walls';n[79,2]:='wall';n[79,3]:='north wall';
   n[79,4]:='east wall';n[79,5]:='west wall';
m[79,1]:='壁';m[79,2]:='北の壁';m[79,3]:='東の壁';m[79,4]:='西の壁';m[79,5]:='南の壁';
n[80,1]:='waterfall';n[80,2]:='waterfa';
m[80,1]:='滝';
n[81,1]:='white button';n[81,2]:='white';
m[81,1]:='白いボタン';
n[82,1]:='gold dial';n[82,2]:='year';n[82,3]:='gold';n[82,4]:='year dial';
m[82,1]:='金のダイヤル';m[82,2]:='金';m[82,3]:='年';
n[83,1]:='slime';n[83,2]:='jelly';
m[83,1]:='粘液';
n[84,1]:='vent';n[84,2]:='vents';
m[84,1]:='通気口';
n[85,1]:='lamp';
m[85,1]:='ランプ';
n[86,1]:='microphone';n[86,2]:='mic';n[86,3]:='speaker';n[86,4]:='microph';
m[86,1]:='マイク';
n[87,1]:='bridge';n[87,2]:='wooden bridge';n[87,3]:='wooden';
m[87,1]:='木の橋';m[87,2]:='橋';
n[88,1]:='beams';n[88,2]:='orange beams';n[88,3]:='beam';
   n[88,4]:='electri';n[88,5]:='orange';
m[88,1]:='光線';m[88,2]:='光';
n[89,1]:='helmet';n[89,2]:='control helmet';n[89,3]:='hat';
m[89,1]:='ヘルメット';
end;
{====================================END======================================}
