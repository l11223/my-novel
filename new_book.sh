#!/bin/bash
# 创建新书脚本
# 用法: ./new_book.sh "书名"

if [ -z "$1" ]; then
    echo "❌ 请提供书名"
    echo "用法: ./new_book.sh \"你的书名\""
    exit 1
fi

BOOK_NAME="$1"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ -d "$SCRIPT_DIR/$BOOK_NAME" ]; then
    echo "❌ 《$BOOK_NAME》已存在"
    exit 1
fi

cp -r "$SCRIPT_DIR/_模板书籍" "$SCRIPT_DIR/$BOOK_NAME"

echo "✅ 《$BOOK_NAME》创建成功！"
echo ""
echo "📁 目录结构："
echo "   $BOOK_NAME/"
echo "   ├── 进度锁.md   ← ⚠️ 每次写作前必须读取！"
echo "   ├── 章节/       ← 存放正式章节"
echo "   ├── 设定/       ← 角色档案、世界观"
echo "   ├── 大纲/       ← 总大纲、分卷大纲"
echo "   ├── 草稿/       ← 随便写"
echo "   └── 存档/       ← AI对话存档"
echo ""
echo "🔴 重要提醒："
echo "   - 目标字数：300万字"
echo "   - 字数不到280万禁止写结局"
echo "   - 每次写作前必须读取进度锁.md"
echo ""
echo "🚀 下一步："
echo "   1. 填写 $BOOK_NAME/设定/ 里的模板"
echo "   2. 填写 $BOOK_NAME/大纲/总大纲.md"
echo "   3. 复制 WRITING_PROMPT.md 发给 AI"
echo "   4. ⚠️ 每次写作前让AI先读取进度锁.md"
