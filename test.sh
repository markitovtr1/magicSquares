
PERMUTATION_FILE="permutations.txt"
permutations=""
for times in $( seq 1 $1 ); do
    permutations="$permutations $PERMUTATION_FILE"
done

echo "Starting test with 10 repetitions of $PERMUTATION_FILE"

echo "Ruby naive"
date +%H:%M:%S:%N
cat $permutations | solutions/naive.rb > /dev/null
date +%H:%M:%S:%N

echo "Ruby naive unlooped"
date +%H:%M:%S:%N
cat $permutations | solutions/naive_unlooped.rb > /dev/null
date +%H:%M:%S:%N

echo "Java naive"
date +%H:%M:%S:%N
cat $permutations | java solutions.Naive > /dev/null
date +%H:%M:%S:%N

echo "Java naive unlooped"
date +%H:%M:%S:%N
cat $permutations | java solutions.Naive > /dev/null
date +%H:%M:%S:%N

echo "C naive"
date +%H:%M:%S:%N
cat $permutations | solutions/naive.exe > /dev/null
date +%H:%M:%S:%N

echo "C naive unlooped"
date +%H:%M:%S:%N
cat $permutations | solutions/naive_unlooped.exe > /dev/null
date +%H:%M:%S:%N

echo "C naive O2"
date +%H:%M:%S:%N
cat $permutations | solutions/naive_O2.exe > /dev/null
date +%H:%M:%S:%N

echo "C naive unlooped O2"
date +%H:%M:%S:%N
cat $permutations | solutions/naive_unlooped_O2.exe > /dev/null
date +%H:%M:%S:%N