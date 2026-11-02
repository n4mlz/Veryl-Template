# Veryl Template

ボードに依存しない Veryl プロジェクトのテンプレートです。設計、テスト、SystemVerilog 生成を Docker と Task で実行できます。

## 必要なもの

- Docker Compose
- [Task](https://taskfile.dev/)

Veryl とシミュレータ用の C/C++ コンパイラは Docker イメージに含まれます。FPGA ボードや外部 RTL シミュレータは不要です。ネイティブテストは Veryl 内蔵シミュレータを使います。

## セットアップ

```sh
task setup
```

## コマンド

```sh
task check       # Veryl の解析
task fmt          # Veryl ソースを整形
task fmt:check    # 整形状態を確認
task build        # SystemVerilog を target/ に生成
task sim          # ネイティブテストを実行
task test         # check、build、sim を実行
task clean        # 生成物を削除
```

`task sim` は Veryl の内蔵シミュレータを使います。外部シミュレータが必要な SystemVerilog テストや cocotb テストは、プロジェクトで必要になったときに追加できます。ソースの整形は `task fmt`、整形チェックは `task fmt:check` で実行できます。

## ディレクトリ構成

```text
.
├── src/                  # ボード非依存の Veryl 設計
├── test/                 # Veryl ネイティブテスト
├── target/               # 生成された SystemVerilog（git 管理外）
├── Dockerfile            # Veryl 開発環境
├── compose.yml
├── Taskfile.yml
└── Veryl.toml
```

FPGA を使う場合は、設計本体と分けて `boards/<board-name>/` に制約ファイルや書き込み設定を追加してください。ボード固有ツールは必要なボードの開発時だけ導入できます。

## サンプルの変更

`Veryl.toml` の `project.name` は Veryl の識別子として有効な名前に変更してください。新しい設計は `src/` に、対応するテストは `test/` に追加します。ディレクトリを増やした場合は `build.sources` に追加してください。
