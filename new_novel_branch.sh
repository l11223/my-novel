#!/bin/bash
# 创建新小说分支
# 用法: ./new_novel_branch.sh "小说名"

if [ -z "$1" ]; then
    echo "❌ 请提供小说名"
    echo "用法: ./new_novel_branch.sh \"你的小说名\""
    exit 1
fi

NOVEL_NAME="$1"
# 把中文和空格转成拼音或简单英文，避免分支名问题
BRANCH_NAME="novel/$(echo "$NOVEL_NAME" | tr ' ' '-')"

cd "$(dirname "$0")"

# 创建并切换到新分支
git checkout -b "$BRANCH_NAME"

# 创建小说目录
mkdir -p "$NOVEL_NAME/章节" "$NOVEL_NAME/设定" "$NOVEL_NAME/存档"

# 复制模板
cp -r "_模板书籍/设定/"* "$NOVEL_NAME/设定/" 2>/dev/null
cp -r "_模板书籍/大纲/"* "$NOVEL_NAME/" 2>/dev/null
cp "_模板书籍/存档/存档模板.md" "$NOVEL_NAME/存档/" 2>/dev/null

# 创建小说信息文件
cat > "$NOVEL_NAME/小说信息.md" << EOF
# 《$NOVEL_NAME》

创建时间：$(date '+%Y-%m-%d %H:%M')
分支名：$BRANCH_NAME

## 基本设定
- 题材：
- 主角：
- 金手指：
- 风格：
- 感情线：

## 进度
- 当前字数：0 / 300万
- 当前章节：0
- 当前卷数：0

## 备注

EOF

# 提交
git add .
git commit -m "创建新小说《$NOVEL_NAME》"
git push -u origin "$BRANCH_NAME"

echo ""
echo "✅ 小说《$NOVEL_NAME》创建成功！"
echo ""
echo "📁 目录结构："
echo "   $NOVEL_NAME/"
echo "   ├── 章节/"
echo "   ├── 设定/"
echo "   ├── 存档/"
echo "   └── 小说信息.md"
echo ""
echo "🌿 分支：$BRANCH_NAME"
echo ""
echo "🚀 下一步："
echo "   1. 开新对话，发送提示词"
echo "   2. 开始写作"
echo "   3. 每写完几章就运行："
echo "      git add . && git commit -m \"更新到第X章\" && git push"
