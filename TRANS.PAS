function FindWord(var cur : integer; var cat : integer; var index : integer; var word : Str16) : boolean;
var i, j, s, l, fs, fl : integer;
begin
  cat := -1;
  index := -1;
  word := '';
  fs := 0;
  fl := 0;

  if ('A' <= Line[0]) and (Line[0] <= 'z') then
    FindWord := False;

  for s := cur to Length(Line) do
  begin
    { 数字(名詞)か? }
    if (('0' <= Line[s]) and (Line[s] <= '9')) or (('A' <= Line[s]) and (Line[s] <= 'z')) then
    begin
      cur := s;
      cat := 1;
      while (('0' <= Line[cur]) and (Line[cur] <= '9')) or (('A' <= Line[cur]) and (Line[cur] <= 'z')) do
      begin
        word := word + Line[cur];
        cur := cur + 1;
      end;
      FindWord := True;
      exit;
    end;

    { 動詞か? }
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

    { 名詞か? }
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

    { 助詞「に」か? }
    l := Length('に');
    if (l > fl) and (Copy(Line, s, l) = 'に') then
    begin
      cat := 2;
      word := '';
      fs := s;
      fl := l;
    end;

    { 助詞「で」か? }
    l := Length('で');
    if (l > fl) and (Copy(Line, s, l) = 'で') then
    begin
      cat := 2;
      word := 'with';
      fs := s;
      fl := l;
    end;

    { 単語が見つかった }
    if fs > 0 then
    begin
      cur := fs + fl;
      FindWord := True;
      exit;
    end;
  end;

  { 単語が見つからなかった }
  FindWord := False;
  exit;
end;

procedure ParseJ(var verb : Str16; var noun1 : Str16; var prepos : Str16; var noun2 : Str16);
var cur, cat, index : integer;
var word : Str16;
begin
  verb := '';
  noun1 := '';
  prepos := '';
  noun2 := '';

  cur := 1;

  if not FindWord(cur, cat, index, word) then
    exit;
  if cat = 0 then
  begin
    verb := word;
    exit;
  end;
  if cat = 1 then
    noun1 := word;

  if not FindWord(cur, cat, index, word) then
    exit;
  if cat = 0 then
  begin
    verb := word;
    exit;
  end;
  if cat = 1 then
    noun2 := word;
  if cat = 2 then
  begin
    prepos := word;
    noun2 := noun1;
    noun1 := '';
  end;

  if not FindWord(cur, cat, index, word) then
    exit;
  if cat = 0 then
  begin
    if (noun2 <> '') and (prepos = '') then
      prepos := prep[index];
    verb := word;
    exit;
  end;
  if cat = 1 then
    noun1 := word;
  if cat = 2 then
    prepos := word;

  if not FindWord(cur, cat, index, word) then
    exit;
  if cat = 0 then
  begin
    if prepos = '' then
      prepos := prep[index];
    verb := word;
  end;
end;

procedure SayJ(var message : Str16);
var i : integer;
begin
  message := '';
  i := Pos(d[31,1], Line);
  if i <= 0 then
    exit;

  message := Copy(Line, 1, i - 1);
  if (message = 'ケラヒヨチミ') or (message = 'ケラヒ ヨチミ') or (message = 'けらひよちみ') or (message = 'けらひ よちみ') then
    message := 'nepo egassap'
  else if message = 'こんにちは' then
    message := 'hello'
  else if message = 'さようなら' then
    message := 'bye';
end;

procedure Translate;
var message, verb, noun1, prepos, noun2 : Str16;
begin
  SayJ(message);
  if message <> '' then
  begin
    Line := 'say ' + message;
    exit;
  end;

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
