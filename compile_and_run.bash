echo 'Compiling COBOL'
cobc -free -x -o helloworld hello_world.cbl
echo 'Running...'
./helloworld