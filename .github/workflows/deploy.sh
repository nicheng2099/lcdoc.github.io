#!/bin/bash

# 1. 构建网站（使用你的原始构建命令）
teedoc build

# 2. 创建特殊部署分支
git checkout --orphan gh-pages
git rm -rf .

# 3. 仅提交构建结果
cp -r .teedoc_build/* .
git add .
git commit -m "Deploy $(date +'%Y-%m-%d %H:%M:%S')"

# 4. 强制推送到GitHub
git push origin gh-pages --force

# 5. 切换回主分支
git checkout main