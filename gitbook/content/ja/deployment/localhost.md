# 🏠 ローカルホストデプロイメント

開発と個人利用のため、ローカルマシンで8Routerを実行。

---

## 📦 インストール

npm経由で8Routerをグローバルインストール:

```bash
npm install -g 8router
```

**要件:**
- Node.js 20以上
- npm 9以上

---

## 🚀 サーバーの起動

一つのコマンドで8Routerを起動:

```bash
8router
```

ダッシュボードが自動的にブラウザで `http://localhost:3000` に開きます。

**デフォルト設定:**
- **ダッシュボード**: `http://localhost:3000`
- **APIエンドポイント**: `http://localhost:20127/v1`
- **データディレクトリ**: `~/.8router`

---

## 🔧 設定

### カスタムデータディレクトリ

環境変数を使ってカスタムデータディレクトリを設定:

```bash
DATA_DIR=/path/to/data 8router
```

### カスタムポート

APIポート(20127)とダッシュボードポート(3000)はアプリケーションで設定されています。変更するにはソースコードを修正するか、サポートされている場合は環境変数を使用してください。

---

## 🛑 サーバーの停止

8Routerが実行されているターミナルで `Ctrl+C` を押します。

```bash
# 8routerを実行しているターミナル
^C  # Ctrl+Cを押す
```

サーバーはグレースフルにシャットダウンし、すべてのデータを保存します。

---

## 🔄 サーバーの再起動

起動コマンドを再度実行するだけです:

```bash
8router
```

すべての設定、APIキー、コンボはデータディレクトリに保持されます。

---

## 📊 8Routerの更新

最新バージョンに更新:

```bash
npm update -g 8router
```

現在のバージョンを確認:

```bash
npm list -g 8router
```

---

## 🔍 トラブルシューティング

### ポートがすでに使用されている

ポート20127または3000がすでに使用されている場合:

```bash
# ポートを使用しているプロセスを検索 (macOS/Linux)
lsof -i :20127
lsof -i :3000

# プロセスを終了
kill -9 <PID>
```

### 権限エラー

インストール中に権限エラーが発生した場合:

```bash
# sudoを使用 (非推奨)
sudo npm install -g 8router

# またはnpm権限を修正 (推奨)
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

### データディレクトリの問題

データディレクトリにアクセスできない場合:

```bash
# 権限を確認
ls -la ~/.8router

# 権限を修正
chmod 755 ~/.8router
```

---

## 📁 データディレクトリ構造

```
~/.8router/
├── db.json           # メインデータベース (プロバイダー、コンボ、設定)
├── logs/             # アプリケーションログ
└── cache/            # 一時キャッシュファイル
```

**データのバックアップ:**

```bash
# バックアップ
cp -r ~/.8router ~/.8router.backup

# 復元
cp -r ~/.8router.backup ~/.8router
```

---

## 🔗 次のステップ

- [プロバイダーを接続](/providers/subscription.md)
- [コンボを作成](/features/combos.md)
- [CLIツールとの統合](/integration/cursor.md)
