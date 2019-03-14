# 
# *********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2019-03-14 16:17
# * Last modified : 2019-03-14 16:17
# * Filename      : hadoop.init.sh
# * Description   : 
# *********************************************************

wd=$(cd `dirname $0`; pwd)

jar_package=$wd/target/***.jar
jar_class=com.algo.datong.ConstantId
read_folder=/DMP/share/data-src/admonitor/etl-mzseq/tonglog/dmlog
output_folder=/algo/algo/leisen/output_48
start_time=20190111
end_time=20190112

echo 'wd:' $wd
echo 'jar_package:' $jar_package
echo 'jar_class:' $jar_class
echo 'read_folder:' $read_folder
echo 'output_folder:' $output_folder
echo 'start_time:' $start_time
echo 'end_time:' $end_time




hadoop fs -test -d $output_folder
if [ $? == 0 ]; then
    #read -p "Output folder already exists. Do you want to remove and replace it? [Y/n]: " rep
    while true; do
    ┆   read -p "Output folder already exists. Do you want to remove and replace it? [Y/n]: " rep
    ┆   case $rep in
            [yY] )
    ┆   ┆   ┆   while true; do
    ┆   ┆   ┆   ┆   read -p "!!! This process is irreversible. Are you sure to continue? [Y/n]: " dc
    ┆   ┆   ┆   ┆   case $dc in
                        [yY] )
    ┆   ┆   ┆   ┆   ┆   ┆   echo "!!! Removing the previous output folder on HDFS... "
    ┆   ┆   ┆   ┆   ┆   ┆   #hadoop fs -rm -r $output_folder
    ┆   ┆   ┆   ┆   ┆   ┆   break;;
                        * )
    ┆   ┆   ┆   ┆   ┆   ┆   echo "Aborted! "
    ┆   ┆   ┆   ┆   ┆   ┆   exit;;
                    esac
    ┆   ┆   ┆   done
    ┆   ┆   ┆   echo "!!! Continue running this script... "
    ┆   ┆   ┆   break;;
            [nN] )
    ┆   ┆   ┆   echo "Process aborted! "
    ┆   ┆   ┆   exit;;
            * )
    ┆   ┆   ┆   echo "Please just enter Y or n. "
    ┆   ┆   ┆   #break
    ┆   ┆   ┆   ;;
        esac
    done
else
    echo "not exists"
fi

exit

hadoop jar $jar_package \
    $jar_class \
    -Dmapreduce.job.queuename=xplan.algo \
    -Dmapreduce.reduce.memory.mb=16384 \
    $start_time \
    $end_time \
    $output_folder \
    $read_folder \

