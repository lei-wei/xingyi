#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e


# push_addr=`git remote get-url --push origin` # git提交地址，也可以手动设置，比如：push_addr=git@github.com:xugaoyi/vuepress-theme-vdoing.git
# commit_info=`by sh file`
dist_path=docs/.vuepress/dist # 打包生成的文件夹路径
push_branch=gh-pages # 推送的分支

# -----------推送网站文件----------------

# 生成静态文件
npm run build

# 进入生成的文件夹
cd $dist_path

# 发布到自定义域名
echo "# xingyi" >> README.md

echo 'xingyi.leiwei.space' > CNAME

git init
git add -A
git commit -m "deploy by sh file"
# git push -f $push_addr HEAD:$push_branch

# git push -f git@github.com:<USERNAME>/<REPO>.git master:gh-pages
git push -f git@github.com:lei-wei/xingyi.git master:gh-pages

cd -

rm -rf $dist_path

# -----------推送源文件----------------
git add -A
git commit -m "deploy by sh file"

# git push origin main -f
git push -f git@github.com:lei-wei/xingyi.git main