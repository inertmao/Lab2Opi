 git init   

git remote add origin https://github.com/inertmao/Lab2Opi.git

echo -e "\n[merge]\n\ttool = nano" >> .git/config

# Пользователь red по умолчанию (для красных точек)
git config user.name "red"
git config user.email "red@example.com"

unzip -o commits/commit0.zip -d src                          
git add src
git commit -m "r0 Initial commit (red)"
git tag r0
git push -u origin master

git checkout -b branch2 r0                                   
# (остаемся под red)
unzip -o commits/commit1.zip -d src
git add src
git commit -m "r1 (red)"
git tag r1
git push -u origin branch2

git checkout master                                          
unzip -o commits/commit2.zip -d src
git add src                        
git commit -m "r2 (red)"
git tag r2              
git push origin master

git checkout -b branch3 r2                                   
git config user.name "blue"        
git config user.email "blue@example.com"

unzip -o commits/commit3.zip -d src                          
git add src                        
git commit -m "r3 (blue)"               
git tag r3

git push -u origin branch3

unzip -o commits/commit5.zip -d src                          
git add src
git commit -m "r5 (blue)"
git tag r5

git push -u origin branch3  
git checkout master   

unzip -o commits/commit4.zip -d src                          
git add src
git commit -m "r4 (red)"
git tag r4
git push origin master

git checkout branch2                                         
# (red)    
unzip -o commits/commit6.zip -d src
git add src
git commit -m "r6 (red)"
git tag r6
git push origin branch2

git checkout branch3   
git merge --no-ff --no-commit branch2                        

# 2) распаковываем snapshot для r7
unzip -o commits/commit7.zip -d src
git add src

# 3) собственно коммит-слияние
git commit -m "r7 (blue) Merge branch2 into branch3 + changes"
git tag r7
git push origin branch3

git checkout master                                          

unzip -o commits/commit8.zip -d src                          
git add src
git commit -m "r8 (red)"
git tag r8
git push origin master
git checkout branch3  

unzip -o commits/commit9.zip -d src
git add src             
git commit -m "r9 (blue)"
git tag r9            
git push origin branch3

git checkout master                                          

unzip -o commits/commit10.zip -d src
git add src             
git commit -m "r10 (red)"
git tag r10           

unzip -o commits/commit11.zip -d src
git add src
git commit -m "r11 (red)"
git tag r11

unzip -o commits/commit12.zip -d src
git add src
git commit -m "r12 (red)"
git tag r12

git push origin master

git checkout branch3                                         
unzip -o commits/commit13.zip -d src
git add src             
git commit -m "r13 (blue)"
git tag r13           
git push origin branch3


git checkout master                                          
# делаем слияние, но без автокоммита
git merge --no-ff --no-commit branch3

# если нужно внести snapshot из commit14.zip:
unzip -o commits/commit14.zip -d src
git add src

# теперь создаём merge-коммит r14
git commit -m "r14 (red) Merge branch3 into master + changes"
git tag r14
git push origin master
