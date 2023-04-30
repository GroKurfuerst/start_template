#Assume all services run in a same instance for now
# public_ipv4=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
# public_ipv4="15.164.178.173"

EVAL_API_PORT=6001

#Fetch configuration
while getopts a: flag
do
    case "${flag}" in
        a) EVAL_API_PORT=${OPTARG};;
    esac
done

#Download data
if [ ! -d $HOME/data/kaldi ]; then
    echo "Kaldi data not found"
    if [ ! -f $HOME/data/kaldi.tar.gz ]; then
        echo "Kaldi tar not found, prepare to download"
        sudo aws s3api get-object --bucket docker-container-data --key kaldi.tar.gz $HOME/data/kaldi.tar.gz
    else
        echo "Kaldi tar found"
    sudo tar -zxvf $HOME/data/kaldi.tar.gz -C $HOME/data/
    fi
else
    echo "Data not found"
fi

#Run the container
sudo docker run -p $EVAL_API_PORT:6001 \
                --gpus all \
                --name eval-api-container \
                -v $HOME/data/kaldi:/app/kaldi \
                eval-api