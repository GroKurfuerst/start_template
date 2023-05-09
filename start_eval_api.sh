#Assume all services run in a same instance for now
public_ipv4=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
# public_ipv4="15.164.178.173"

EVAL_API_PORT=6001
ASR_API="http://$public_ipv4:8067/home"

#Fetch configuration
while getopts a: flag
do
    case "${flag}" in
        a) EVAL_API_PORT=${OPTARG};;
    esac
done

#Run the container
sudo docker run -p $EVAL_API_PORT:6001 \
                -e ASR_API=$ASR_API
                --gpus all \
                --name eval-api-container \
                -v $HOME/data/kaldi:/app/kaldi \
                -v $HOME/data/nltk_data:/root/nltk_data \
                -v $HOME/data/intel:/opt/intel \
                eval-api

# sudo docker run -it -p 6001:6001 \
#                 --gpus all \
#                 --name eval-api-container \
#                 -v $HOME/data/nltk_data:/root/nltk_data \
#                 -v $HOME/data/kaldi:/app/kaldi \
#                 -v $HOME/data/intel:/opt/intel \
#                 --entrypoint /bin/bash \
#                 eval-api