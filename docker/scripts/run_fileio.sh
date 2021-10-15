sysbench --num-threads=$1 --test=fileio --file-total-size=3G prepare

sysbench --num-threads=$1 --test=fileio --file-total-size=3G --file-test-mode=rndrw --max-time=300 --max-requests=0 run

sysbench --num-threads=$1 --test=fileio --file-total-size=3G cleanup
