Cataclysm: DDA LUA Extention

■サポートVersion
同梱のversion.txtを参照。

■はじめに
本ファイルはCataclysm: DDA(CDDA)のLUAサポート機能を拡張するMOD(独自ビルド)です。
・本家CDDAと（基本的に）動作に互換性があります。
・実行ファイル(exeファイル)を変更するため、
  サポートしているVersion以外のセーブデータを以降してきた場合は正常動作しない可能性があります。

■使用上の注意
・本MODはCDDA公式の開発チームとは無関係で制作しています。
  ご質問・ご要望・バグ報告は公式フォーラムではなく、
  下記リンクのGitHubリポジトリにてIssueを投稿する形でお願いします。
・本MODを使用して発生したセーブデータの破損等については
  一切の責任を負いかねますので、ご容赦ください。

■使い方
cataclysm-tiles-luaex(.exe)からゲームを開始してください。

■内容物について(主な本体との差分のみ)
・cataclysm-tiles-luaex.exe    …  Windows用実行ファイル本体(LUA拡張版)
・cataclysm-tiles-luaex        …  Linux 64bit用実行ファイル本体(LUA拡張版)
・lua\                         …  LUAサポート用ファイル
・sample_mods\                 …  MODサンプルコード

■リンク
・GitHubリポジトリ
  https://github.com/lispcoc/Cataclysm-DDA/tree/lua-extention

■更新履歴
※本家CDDAへの追従は随時行っています
・0.C-7686相当版
  player_activity(木の伐採やクラフトなどの長時間に及ぶ行動)をLUAから設定できるようにした。
  LUA関数を少しだけ拡張。
  サンプルMODを追加。
  ・player_activity_test - player_activityの実行テストMOD。

・0.C-7630相当版
  本体の更新への追従のみ。

・0.C-7588beta2
  0.C-7568相当版で追加した画像が参照される際のコールバックを削除しました。(クラッシュの原因になっていた模様)
  LUAとあまり関係ありませんが、試験的にゲーム中からアイテムのタイル画像を設定する機能を追加しました。
  ※試験運用なので差し戻す可能性あり。

・0.C-7588相当版
  今回から試験的にフルセットのCDDAを配布するようにしてみます。
  Windows版とLiunx版を分けて配布する意味があんまりなかったので統合。
  CBMと車輌関係のクラスと関数を追加。
  サンプルMODを追加。
  ・vehicle - マップ内の車輌を探知するテストMOD

・0.C-7568相当版
  プレイヤーやNPCの装備アイテムのタイル画像が参照される際のコールバックを追加。
  サンプルMODを追加。
  ・頭装備の不可視化 - タイル画面でプレイしている場合、頭装備を非表示にする。

・0.C-7564相当版
  プレイヤー/NPCの意欲を操作できるように拡張。

・0.C-7550相当版
  NPC関連の関数・変数を拡張。
  サンプルMODを追加。
  ・npc_opinion - NPCの有効度を表示するテストMOD
  ・StatsThroughSkillsForNPC - 周囲のNPCにStatsThroughSkillsを適用するMOD

・0.C-7541相当版
  player_at関数を何もない場所を指定して使用するとゲームがクラッシュするバグを修正。
  モンスターの特殊攻撃をLUAで記述できるようにした。
  ※本家のLUA関連の関数追加に対応。

・0.C-7509相当版
  初版
