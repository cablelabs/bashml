SHEBANG=${1:-"\/bin\/bash"}
for i in `ls bin`; do
  sed "1 s/^.*$/#\! ${SHEBANG}/" bin/${i} > bin/${i}.sh
  mv bin/${i}.sh bin/${i}
done
chmod u+x bin/*
for i in `ls scripts`; do
  sed "1 s/^.*$/#\! ${SHEBANG}/" scripts/${i} > scripts/${i}.sh
  mv scripts/${i}.sh scripts/${i}
done
chmod u+x scripts/*
test -f test/test && sed "1 s/^.*$/#\! ${SHEBANG}/" test/test > test/test.sh
test -f test/test.sh && mv test/test.sh test/test
test -f test/test && chmod u+x test/test
test -f data/student_scores_example_tree.sh && sed "1 s/^.*$/#\! ${SHEBANG}/" data/student_scores_example_tree.sh > data/sset.sh
test -f data/sset.sh && mv data/sset.sh data/student_scores_example_tree.sh
test -f data/student_scores_example_tree.sh && chmod u+x data/student_scores_example_tree.sh
