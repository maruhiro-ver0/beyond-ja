# タイタニックを超えて Beyond the Titanic

*エキサイティングな冒険の世界に飛び込む準備をしてください…*

```
  ゲームはタイタニック号の最初の航海から始まります。もちろんその航海は永遠に達成されません!
  あなたの目的は生き延びて合衆国にある家に帰ることです。
```

これは1986年のScott MillerのMS-DOS用ゲームBeyond the TitanicのFree Pascal移植版を日本語に翻訳したものです。
元のソースとバイナリは
[3D Realms website](http://legacy.3drealms.com/news/2009/03/several_old_games_released_as_freeware.html)
または
[archive.org](https://archive.org/details/BeyondTitanic_source).
にあります。

Samuel BrianによるFreePascal移植版は
[github](https://github.com/samuelbrian/beyond-the-titanic)
にあります。

Beyond the Titanicは80x25ターミナルコンソールが最も適しています。

## ビルド要件

* [Free Pascal](http://www.freepascal.org/) コンパイラ
  (Linux, Win32, Win64 version 3.0.0でテスト済み)

## TODO

* SPECIAL, LINERITE, ROOMRITEを移植する (ゲームプレーには必要ありません。)

## 既知のバグ

* 入力プロンプトが正しくない (Linux)
* サウンドが再生されない (Linux)


## 日本語版の注意点

* Linuxでプレーする場合は, 端末エミュレータの文字コードをShiftJISに設定してく
  ださい。
* Windowsでビルドする場合は, crt.pas.win32のファイル名をcrt.pasに名前を変えて
  からMake-Win32.batまたはMake-Win64.batを実行してください。
