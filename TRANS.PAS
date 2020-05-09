{ Find a Japanese word, and convert to an English word }
function FindWord(var cur : integer; var cat : integer; var index : integer; var word : Str16) : boolean;
var i, j, s, l, fs, fl : integer;
begin
  cat := -1;
  index := -1;
  word := '';
  fs := 0;
  fl := 0;
  s := cur;

  while s < Length(Line) do
  begin
    { Numbers or alphabets (as noun) }
    if Line[s] < Chr($80) then
    begin
      cur := s;
      cat := 1;
      while (Chr($0) < Line[cur]) and (Line[cur] < Chr($80)) do
      begin
        word := word + Line[cur];
        cur := cur + 1;
      end;
      FindWord := True;
      exit;
    end;

    { Verb }
    for i := 0 to VMax do
    begin
      for j := 1 to 5 do
      begin
        l := Length(d[i, j]);
        if l > fl then
        begin
          if Copy(Line, s, l) = d[i, j] then
          begin
            cat := 0;
            index := i;
            word := v[i, 1];
            fs := s;
            fl := l;
          end;
        end;
      end;
    end;

    { Noun }
    for i := 0 to NMax do
    begin
      for j := 1 to 5 do
      begin
        l := Length(m[i, j]);
        if l > fl then
        begin
          if Copy(Line, s, l) = m[i, j] then
          begin
            cat := 1;
            index := i;
            word := n[i, 1];
            fs := s;
            fl := l;
          end;
        end;
      end;
    end;

    { Japanese 'NI' (TO, IN, etc.) }
    l := Length('‚É');
    if (l > fl) and (Copy(Line, s, l) = '‚É') then
    begin
      cat := 2;
      word := '';
      fs := s;
      fl := l;
    end;

    { Janapese 'DE' (WITH) }
    l := Length('‚Å');
    if (l > fl) and (Copy(Line, s, l) = '‚Å') then
    begin
      cat := 2;
      word := 'with';
      fs := s;
      fl := l;
    end;

    if fs > 0 then
    begin
      cur := fs + fl;
      FindWord := True;
      exit;
    end;

    if Line[s] < Chr($80) then
      s := s + 1
    else
      s := s + 2;
  end;

  FindWord := False;
  exit;
end;

{ Parse a Janapese sentence, and convert to English words }
procedure ParseJ(var verb : Str16; var noun1 : Str16; var prepos : Str16; var noun2 : Str16);
var cur, cat, index, v, n1, n2 : integer;
var tmp : Str16;
var word : Str16;
begin
  verb := '';
  noun1 := '';
  prepos := '';
  noun2 := '';
  cur := 1;

  { 1st word }
  if not FindWord(cur, cat, index, word) then
    exit
  else if cat = 0 then { verb }
  begin
    verb := word; v := index;
    exit;
  end
  else if cat = 1 then { noun }
  begin
    noun1 := word; n1 := index;
  end;

  { 2nd word }
  if not FindWord(cur, cat, index, word) then
    exit
  else if cat = 0 then { verb }
  begin
    verb := word; v := index;
    exit;
  end
  else if cat = 1 then { noun }
  begin
    noun2 := word; n2 := index;
  end
  else if cat = 2 then { prep }
  begin
    prepos := word;
    noun2 := noun1; n2 := n1;
    noun1 := ''; n1 := 0;
  end;

  { 3rd word }
  if not FindWord(cur, cat, index, word) then
    exit;
  if cat = 0 then {verb }
  begin
    if (noun2 <> '') and (prepos = '') then
    begin
      prepos := prep[index];
    end;
    verb := word; v := index;
    exit;
  end
  else if cat = 1 then { noun }
  begin
    noun1 := word; n1 := index;
  end
  else if cat = 2 then { prep }
  begin
    prepos := word;
  end;

  { 4th word }
  if not FindWord(cur, cat, index, word) then
    exit
  else if cat = 0 then { verb }
  begin
    if prepos = '' then
      prepos := prep[index];
    verb := word; v := index;
    if (v = 37{TIE}) and (n2 = 57{ROPE}) then { If 'ROPE NI X WO MUSUBU' }
    begin
      { Convert to 'ROPE WO X NI MUSUBU' }
      tmp := noun1;
      noun1 := noun2;
      noun2 := tmp;
    end
  end;
end;

{ Parse 'X TO IU'(SAY X) }
procedure ParseSayJ(var message : Str16);
var i : integer;
begin
  message := '';
  i := Pos(d[31, 1]{ TO IU }, Line);
  if i <= 0 then
    exit;

  message := Copy(Line, 1, i - 1);
  if (message = 'ƒPƒ‰ƒqƒˆƒ`ƒ~') or (message = 'ƒPƒ‰ƒq ƒˆƒ`ƒ~') or (message = '‚¯‚ç‚Ð‚æ‚¿‚Ý') or (message = '‚¯‚ç‚Ð ‚æ‚¿‚Ý') then
    message := 'nepo egassap'
  else if message = '‚±‚ñ‚É‚¿‚Í' then
    message := 'hello'
  else if message = '‚³‚æ‚¤‚È‚ç' then
    message := 'bye';
end;

{ Convert full width numbers/alphabets to half width }
const hchrs : Str80 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
procedure FullToHalf;
var i, c : integer;
begin
  i := 1;
  while i < Length(Line) do
  begin
    if Line[i] < Chr($80) then
      i := i + 1
    else
    begin
      c := Pos(Copy(Line, i, 2), '‚O‚P‚Q‚R‚S‚T‚U‚V‚W‚X‚`‚a‚b‚c‚d‚e‚f‚g‚h‚i‚j‚k‚l‚m‚n‚o‚p‚q‚r‚s‚t‚u‚v‚w‚x‚y‚‚‚‚ƒ‚„‚…‚†‚‡‚ˆ‚‰‚Š‚‹‚Œ‚‚Ž‚‚‚‘‚’‚“‚”‚•‚–‚—‚˜‚™‚š') - 1;
      if (c < 0) or (c mod 2 > 0) then
        i := i + 2
      else
      begin
        Delete(Line, i, 2);
        Insert(hchrs[Trunc(c / 2) + 1], Line, i);
        i := i + 1;
      end;
    end;
  end;
end;

{ Translate a Japanese sentence to English }
procedure Translate;
var message, verb, noun1, prepos, noun2 : Str16;
begin
  if ('A' <= Line[1]) and (Line[1] <= 'z') then
    exit;

  ParseSayJ(message);
  if message <> '' then
  begin
    Line := 'say ' + message;
    exit;
  end;

  FullToHalf;
  ParseJ(verb, noun1, prepos, noun2);

  if verb = '' then
  begin
    if noun1 <> '' then
      Line := noun1;
    exit;
  end;

  if noun2 <> '' then
  begin
    Line := verb + ' ' + noun1 + ' ' + prepos + ' ' + noun2;
    exit;
  end;

  if noun1 <> '' then
  begin
    Line := verb + ' ' + noun1;
    exit;
  end;

  Line := verb;
end;
