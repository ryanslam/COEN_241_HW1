sysbench --num-threads=$1 --test=fileio --file-total-size=$2 prepare

sysbench --num-threads=$1 --test=fileio --file-total-size=$2 --file-test-mode=$3 --max-time=300 --max-requests=0 run

sysbench --num-threads=$1 --test=fileio --file-total-size=$2 cleanup
