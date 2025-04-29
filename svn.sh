# 0) Если репозиторий ещё не создан:
svnadmin create /home/inertmao/lab2/svn_repo

# 1) Инициализируем структуру: trunk, branches, tags
svn mkdir \
  file:///home/inertmao/lab2/svn_repo/trunk \
  file:///home/inertmao/lab2/svn_repo/branches \
  file:///home/inertmao/lab2/svn_repo/tags \
  -m "Initialize repository structure" \
  --username red

# 2) r0: импорт initial snapshot в trunk от red
unzip -o /home/inertmao/Desktop/opi/Lab2Opi/commits/commit0.zip -d /tmp/svn-import
svn import /tmp/svn-import \
  file:///home/inertmao/lab2/svn_repo/trunk \
  -m "r0 Initial import (red)" \
  --username red
rm -rf /tmp/svn-import

# 3) Тэг r0
svn copy \
  file:///home/inertmao/lab2/svn_repo/trunk \
  file:///home/inertmao/lab2/svn_repo/tags/r0 \
  -m "Tag r0" \
  --username red

# 4) Чекаутим trunk
svn checkout \
  file:///home/inertmao/lab2/svn_repo/trunk \
  /home/inertmao/lab2/svn_work

# 5) Создаём branch2 из r0
svn copy \
  file:///home/inertmao/lab2/svn_repo/tags/r0 \
  file:///home/inertmao/lab2/svn_repo/branches/branch2 \
  -m "Create branch2 from r0" \
  --username red

svn checkout \
  file:///home/inertmao/lab2/svn_repo/branches/branch2 \
  /home/inertmao/lab2/branch2_work

# 6) r1: коммит в branch2 от red
cd /home/inertmao/lab2/branch2_work
unzip -o /home/inertmao/Desktop/opi/Lab2Opi/commits/commit1.zip -d .
svn add --force .
svn commit -m "r1 (red)" --username red

# 7) Тэг r1
svn copy \
  file:///home/inertmao/lab2/svn_repo/branches/branch2 \
  file:///home/inertmao/lab2/svn_repo/tags/r1 \
  -m "Tag r1" \
  --username red

# 8) r2: коммит в trunk от red
cd /home/inertmao/lab2/svn_work
svn update
unzip -o /home/inertmao/Desktop/opi/Lab2Opi/commits/commit2.zip -d .
svn add --force .
svn commit -m "r2 (red)" --username red

# 9) Тэг r2
svn copy \
  file:///home/inertmao/lab2/svn_repo/trunk \
  file:///home/inertmao/lab2/svn_repo/tags/r2 \
  -m "Tag r2" \
  --username red

# 10) Создаём branch3 из r2 (теперь от blue)
svn copy \
  file:///home/inertmao/lab2/svn_repo/trunk \
  file:///home/inertmao/lab2/svn_repo/branches/branch3 \
  -m "Create branch3 from r2" \
  --username blue

svn checkout \
  file:///home/inertmao/lab2/svn_repo/branches/branch3 \
  /home/inertmao/lab2/branch3_work

# 11) r3: коммит в branch3 от blue
cd /home/inertmao/lab2/branch3_work
unzip -o /home/inertmao/Desktop/opi/Lab2Opi/commits/commit3.zip -d .
svn add --force .
svn commit -m "r3 (blue)" --username blue

# 12) Тэг r3
svn copy \
  file:///home/inertmao/lab2/svn_repo/branches/branch3 \
  file:///home/inertmao/lab2/svn_repo/tags/r3 \
  -m "Tag r3" \
  --username blue

# 13) r5: следующий коммит в branch3 от blue
unzip -o /home/inertmao/Desktop/opi/Lab2Opi/commits/commit5.zip -d .
svn add --force .
svn commit -m "r5 (blue)" --username blue

# 14) Тэг r5
svn copy \
  file:///home/inertmao/lab2/svn_repo/branches/branch3 \
  file:///home/inertmao/lab2/svn_repo/tags/r5 \
  -m "Tag r5" \
  --username blue

# 15) r4: ещё один коммит в trunk от red
cd /home/inertmao/lab2/svn_work
svn update
unzip -o /home/inertmao/Desktop/opi/Lab2Opi/commits/commit4.zip -d .
svn add --force .
svn commit -m "r4 (red)" --username red

# 16) Тэг r4
svn copy \
  file:///home/inertmao/lab2/svn_repo/trunk \
  file:///home/inertmao/lab2/svn_repo/tags/r4 \
  -m "Tag r4" \
  --username red

# 17) r6: коммит в branch2 от red
cd /home/inertmao/lab2/branch2_work
svn update
unzip -o /home/inertmao/Desktop/opi/Lab2Opi/commits/commit6.zip -d .
svn add --force .
svn commit -m "r6 (red)" --username red

# 18) Тэг r6
svn copy \
  file:///home/inertmao/lab2/svn_repo/branches/branch2 \
  file:///home/inertmao/lab2/svn_repo/tags/r6 \
  -m "Tag r6" \
  --username red

# 19) r7: слияние branch2→branch3 + snapshot commit7
cd /home/inertmao/lab2/branch3_work
svn update
svn merge file:///home/inertmao/lab2/svn_repo/branches/branch2 .
# в случае конфликтов — разрешить вручную
unzip -o /home/inertmao/Desktop/opi/Lab2Opi/commits/commit7.zip -d .
svn add --force .
svn commit -m "r7 (blue) Merge branch2 into branch3 + changes" --username blue

# 20) Тэг r7
svn copy \
  file:///home/inertmao/lab2/svn_repo/branches/branch3 \
  file:///home/inertmao/lab2/svn_repo/tags/r7 \
  -m "Tag r7" \
  --username blue

# 21) r8: коммит в trunk от red
cd /home/inertmao/lab2/svn_work
svn update
unzip -o /home/inertmao/Desktop/opi/Lab2Opi/commits/commit8.zip -d .
svn add --force .
svn commit -m "r8 (red)" --username red

# 22) Тэг r8
svn copy \
  file:///home/inertmao/lab2/svn_repo/trunk \
  file:///home/inertmao/lab2/svn_repo/tags/r8 \
  -m "Tag r8" \
  --username red

# 23) r9: коммит в branch3 от blue
cd /home/inertmao/lab2/branch3_work
svn update
unzip -o /home/inertmao/Desktop/opi/Lab2Opi/commits/commit9.zip -d .
svn add --force .
svn commit -m "r9 (blue)" --username blue

# 24) Тэг r9
svn copy \
  file:///home/inertmao/lab2/svn_repo/branches/branch3 \
  file:///home/inertmao/lab2/svn_repo/tags/r9 \
  -m "Tag r9" \
  --username blue

# 25) r10–r12: три последовательных коммита в trunk от red
cd /home/inertmao/lab2/svn_work
svn update
for n in 10 11 12; do
  unzip -o /home/inertmao/Desktop/opi/Lab2Opi/commits/commit${n}.zip -d .
  svn add --force .
  svn commit -m "r${n} (red)" --username red
  svn copy \
    file:///home/inertmao/lab2/svn_repo/trunk \
    file:///home/inertmao/lab2/svn_repo/tags/r${n} \
    -m "Tag r${n}" --username red
done

# 26) r13: финальный коммит в branch3 от blue
cd /home/inertmao/lab2/branch3_work
svn update
unzip -o /home/inertmao/Desktop/opi/Lab2Opi/commits/commit13.zip -d .
svn add --force .
svn commit -m "r13 (blue)" --username blue
svn copy \
  file:///home/inertmao/lab2/svn_repo/branches/branch3 \
  file:///home/inertmao/lab2/svn_repo/tags/r13 \
  -m "Tag r13" \
  --username blue

# 27) r14: слияние branch3→trunk + snapshot commit14 от red
cd /home/inertmao/lab2/svn_work
svn update
svn merge file:///home/inertmao/lab2/svn_repo/branches/branch3 .
# разрешить конфликты, если нужно
unzip -o /home/inertmao/Desktop/opi/Lab2Opi/commits/commit14.zip -d .
svn add --force .
svn commit -m "r14 (red) Merge branch3 into trunk + changes" --username red

# 28) Тэг r14
svn copy \
  file:///home/inertmao/lab2/svn_repo/trunk \
  file:///home/inertmao/lab2/svn_repo/tags/r14 \
  -m "Tag r14" \
  --username red
